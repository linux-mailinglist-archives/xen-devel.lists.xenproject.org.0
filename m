Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7CA5816BE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375476.607882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMmf-0000C1-2s; Tue, 26 Jul 2022 15:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375476.607882; Tue, 26 Jul 2022 15:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMme-00009q-VL; Tue, 26 Jul 2022 15:47:44 +0000
Received: by outflank-mailman (input) for mailman id 375476;
 Tue, 26 Jul 2022 15:47:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGMmd-00009k-Oo
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:47:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f84f92-0cfa-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:47:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 15:47:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 15:47:40 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 48f84f92-0cfa-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaAiUXt3ZTicNT2tobxphGDg72mOeMm97rMzysEVy0moRa9spkS1fYE5Xmd2XM0z9LoN+Vn12DljJiWWc1gKpVGVB84dyzHavzk+QZ9fWlEy7xQ6jqsDBeH6UG9xxA9mQ/PAIhFnopkedF8MyeBD/r1NMAdw6du2eERWm5/LpCOnIzWFgV1HRjeX20QZGD6vBvXe5WSfu+Z0eMbdTiJ3VeDhfLdCtLYrsaZ4zBI4x/NMfCz5mECvsvzwkAUzs/o61mxTkM0eRj156VdORQI0UPB5A7BjrXgnrGruKc0CI8lSx50+6Y60tf+4Xs779tklhott1VhyE82M5dw54k8PUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJVgy2h8KL58ca9SLkpUIZ7kl9xylz5GmOf1zkLhxng=;
 b=TQaGxR0HC7O4SHFdaVJEcTLmLZgZwnpOpTQE385h3bq8BBTB7/xeRXrJQM4BIsRFcZV2UsQb2+lFNPc7FPtZq/0BY58rIVgsYdO9sDnJTK73h566DReSJi4jAUdT37EhSq0TDLolmBnBDFnVQNN6gaPuPU6VzZE8Yyf6krCnY9DajJxqKNF5kuoKr+fS5fHTqmrIJb5oOUKrJ8GlGPKHS8VRCikBD6axjhVwz2tduKYltx7N/3QFnkHzothv80IEszeJNiAf1/bD7acz03vMpehTl/UcEkn4magjlXV3+y00PyjzObIB9ARPzkfNUtYELe5i1PBnQ5x8majc/W+MNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJVgy2h8KL58ca9SLkpUIZ7kl9xylz5GmOf1zkLhxng=;
 b=QWNIOo8HQzoeUc+nOrxGMbEe3WLrfYcQMSU1ajpvIYlZPxGwmpCeExCgnVmIEIMCVWqfc0C4EwPnYbUrLsGthPINQpWdZfBQgkbb5lfzyeZxY383+dO28EtS3qgqXR9/RtYUwbY9EulaYCV9RfUniDgSH9BJ/pgCo4k+73ErUdm4P2+5FyMbgLBnSrCFIPOBz9eJe1wjndjE9EIk5L8bOy5bL8hOgZiEOc/JNMw0bVc2Frsbummkf0k9rE5QdQHaxorSrJqvgrguCURFuk9gJz5GssyoKVgSBjPNps1nYD7bBC46WxptLw5OsPWcWr3VEYyT/IHTTpI7p+cf7ayOFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83c1b506-27d5-19e0-89b0-a6a27b4e5535@suse.com>
Date: Tue, 26 Jul 2022 17:47:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] x86/msr: fix X2APIC_LAST
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Edwin Torok <edvin.torok@citrix.com>
References: <f22ea4c14d8be5672c036076ecd5818c6ca1d06a.1658849010.git.edvin.torok@citrix.com>
 <3e5ceee7-533b-1cae-262e-b05b5b22692b@suse.com>
 <3b23d5a1-4b49-6c12-2539-dcd1bb2de735@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3b23d5a1-4b49-6c12-2539-dcd1bb2de735@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97629aea-9834-4fdd-72ca-08da6f1e2bf4
X-MS-TrafficTypeDiagnostic: DB9PR04MB8379:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5K4FQkbHmp05yarn6spZIUffDN7So/NJV1/JJG5KdD5gJcNzchpoajKwEr4HrkQPUqMgxmzpz05Fpsfyh3YTL8AAT4ql8QGkyid/segmjReNsu/BOH429zstvxFzfsgua6faoQ7Io+xNnn8SeMUFFkzpP+w8sA2OC8fLbF4OorEEKI80VvJMEYpfCz+nrwToJ+Vez9GUEZEyj2+T1bM15LBLSVi7JzzX8kLmllt0IAIT9FpNgEFtbXNIGFbPfgkh78jVxyntchbT88CFHoAnW/vZ2MsD9aDf7cDFmPpPElxiLPlYNCQn3k3KGo+gPorYonhQeUPbqO5mDNMSa1x8JD1CsaMQZ5MQyGlt6FRjJBfbZ5Qvl4q8pnO2XwulHRHlDujYQ5zp7RFKkTP9ZDBU7gIr9NY4ZV2bE1PqhUakPsz9SxjZLoCvNC1sq3aethc6dFFn4CS5lVD/C8gyoSdwfEFxFXMNmj1qCfAs1fP7fpzzSp0fVhwxHUfQAYBbqUt8gObMjG/faRdt00SCh70ppvmrMPWf6yE/PHXsh5UKvPAhGZS8iUX4yHjvyunoWYS+36lVnkB6+r0EOdQ29ITh61kEWOFCa/lnrhhVeQk1qzAwXgMIfao+OG5KvUhsP9JaieNM3SKIt+vEO/uprgVTDcbc6ij0PunA0XoYh8p+PRTeQpZd/NMIde5xbI4fs2Of9X0JQHFRCXnn+7Dui/b7dQjv5zWkI6SrWxLrAaNYboem40p9CdyxZ6kUo+3M7NrxL5rq5YlNN7eWNDaNVJiNbHqAa5NPwDANOe8G5b7FrXQcGZJN4bTgSG4gvGA2YngtrXNzkH92huXlcH1+ksCOgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(366004)(186003)(2616005)(6916009)(66556008)(54906003)(66946007)(4326008)(8676002)(83380400001)(66476007)(6512007)(31686004)(6506007)(36756003)(41300700001)(53546011)(26005)(2906002)(31696002)(86362001)(38100700002)(478600001)(5660300002)(4744005)(316002)(6486002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzBYTWt4R1J6ZDB4eldyQ0tPNzI2dWRhN016VjlxS2dDTEdPRkFxTFFqQ3VL?=
 =?utf-8?B?SDltQ2R4TzhWU0N1UDRueW81Sk8veFBFTW9nb1JNUDJoZjFXYTdQNC9ub08z?=
 =?utf-8?B?dS9ldng0aWtPemJnd0RzMENIZk9ualN2cVlCTW4vaG5sd2NZcTJXZUFIdFBT?=
 =?utf-8?B?R1lTQUVYZ05qR0hEWElDUDI2bzhrcVc1Mlc4eXhnN3o3ampTbEhqTGVjSS9C?=
 =?utf-8?B?L3ZacktnaU93b3Y5elVWdVBxOTd0UGdYWGFBNUZraDdEbTNNMWhyUURWUWRJ?=
 =?utf-8?B?YVZBNlpzOG5acG5lbmNIWUVmQmtuMFZlNENoUWJBZGVUQVZRS0NqUEJGdldt?=
 =?utf-8?B?TW9YTFVzRGFLM00vRWJMWnpHVWVHazN2SGVKWXE3OXRqOStUUkVvUUZLazNt?=
 =?utf-8?B?QXNTR0JtWGZCOFhEekxTOG1FYjIzbGpzZzMxUlA3ZlEyVGU3dWlQU3hnVW5l?=
 =?utf-8?B?UHZZS0ZvV0kyQjQ5VThvOVNiZWNIUkNKNUQxdS9sU2dZRVkyNHFETkVnQU56?=
 =?utf-8?B?QlB4ZHE4ZEhITVc2M0loMkhxWjN4WkhITTU5WVd5dWRvN0J2cEJpaUhDU2xq?=
 =?utf-8?B?YzZtY2xKa01rYVdlRGp3dDdmS1VFR3V1MzdjOFRRRCt0c0lnaC9vc250SDVV?=
 =?utf-8?B?M2JhNUlRZzJVNW92anlNYXF1Wlp5UWRFOUlSOGoydytCSUo5OTU3ZlFIeTJZ?=
 =?utf-8?B?SG1ETnd5dk11amFZbzZ3UjQyMjhvcjFzaXZhNnF1VElEWENLN2dVSFNQaG5D?=
 =?utf-8?B?MTY4eUM2bVJiaWpFQS9MdW4rWnJtNjdYUUpobk16Nm4xd0lHRGdHQlBlaTNB?=
 =?utf-8?B?R0RSenZOd3ZlZUNkRThYZkd5TUVxSUpjakdublE2djE0NkdFMlZ1Um4yY3h4?=
 =?utf-8?B?K1RqcnBqSkxaNXFqSm9obFltOC9mUWNNUDBGeGhkeFZvMlBDTFpBSG5iaVFL?=
 =?utf-8?B?V0orS0RHMHIwQkkzYmJGSmZmRHQ4akxydys5T3ZPcVNLQlZudTRZUlhjeE1z?=
 =?utf-8?B?c2tkeGhaeU5qNDRWaUpzRGwreCtsdmtmUGxUMGw3aTdSTjNNbXgxMkdkNnJM?=
 =?utf-8?B?aXhMN3dnak91aEhjKzk3aDJ2bmJaQlBLNXBRVnl4R0JLZnFCZUREbFpPZElo?=
 =?utf-8?B?RHhvTllrNHBHRWhyMGVzSS9XclFYZUQyYVppTnVqSUQ1c1FpVXdJb0s3bVpp?=
 =?utf-8?B?cTlwbklramF0c2dkd3B6T1lnczdQL3BBWGxNS1pZTWFMR2I0ODYzTU1NdnBZ?=
 =?utf-8?B?bVZHR0NPc0xiSk5SRm84a3dOdWYxdlB2NzdodWVhWVk2NUhCUGVUeVBtNDI2?=
 =?utf-8?B?WGxOcjdncTM0bjhTTDFwclkyUzVnai9FRHhSblNUb01NQ0E3OHB4Y1NwSWFM?=
 =?utf-8?B?ZFd3SzVhUXB0ZTJjMldWV28yZ1ZGaGJQLys5aHFWRDVycVJMRC8zeTlEZ2o0?=
 =?utf-8?B?NGJEeGlnWnA0eWxmUDJkSzYvRXk2RklJN2dKNENlR1gvTUl0ekNmWEJkOW9P?=
 =?utf-8?B?WS8zOHQ1YmE4MmprU2wvamM0NG1PZmJkdlk3bXY2clVKQlYwdExmcFhucnFE?=
 =?utf-8?B?QXg1ZnhxZEh2L0hicDR4b0I1ZG54cEtKUm5GMWhUMjNBSXRJTFFWQlpUTGpP?=
 =?utf-8?B?U0srYlpEamptbzJWKzNxU2VPNlRhbkp1cXRYZFdTRE1NNUc2WkpQOU1xalVa?=
 =?utf-8?B?UVdyUkRZaDkwUkl0TUpRRWl6dnJhMldRYkdQakgwVkZpVmpsdTFIZVJzaEg1?=
 =?utf-8?B?YmlEZEplbGUzUDFZV1NyRnNHdURYakJmWElKcThONElWektSVlUzMUdDQU8z?=
 =?utf-8?B?V1ZjendKbkkrdEp3eDRPWHpxd0wvaitiZTRuMTNZT3pneTZzYjIrWkYvbVgr?=
 =?utf-8?B?R1dCamVvL1FUakVPaTFwNTVDaUdHZllTL2U5Y212V0x6QlBLN3g5SjJ0dlFp?=
 =?utf-8?B?eEVOQVNxV2JMNzRqeEJRZFFVZDZVVXU4SkZNQWhkOUg4bHpBaDRHU21XTk8z?=
 =?utf-8?B?eStLWjRiYzh3aHFxNXBQL2FiQjFSNmhhUGtSaFpZRnlUNWYySGRwbGJiTFRR?=
 =?utf-8?B?WGJmQk1jK29adys4Zm4zMGp1cVJFUGIxZjI2YTRZRU5WWExQSGZZWlN4OGJu?=
 =?utf-8?Q?JAHZxJD6y6UZpzhWcd5Wm1Bqu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97629aea-9834-4fdd-72ca-08da6f1e2bf4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:47:40.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTotQ6W8U1dvOW1Jdf2zP9sGeBbxVUADFgBa8jDdAy9WH6Dqav+PQdNWso7RL+j5+yIHlUDgobWlj8MDJtS66A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379

On 26.07.2022 17:42, Andrew Cooper wrote:
> On 26/07/2022 16:33, Jan Beulich wrote:
>> On 26.07.2022 17:28, Edwin Török wrote:
>>> The latest Intel manual now says the X2APIC reserved range is only
>>> 0x800 to 0x8ff (NOT 0xbff).
>>> This changed between SDM 68 (Nov 2018) and SDM 69 (Jan 2019).
>>> The AMD manual documents 0x800-0x8ff too.
>>>
>>> There are non-X2APIC MSRs in the 0x900-0xbff range now:
>>> e.g. 0x981 is IA32_TME_CAPABILITY, an architectural MSR.
>>>
>>> The new MSR in this range appears to have been introduced in Icelake,
>>> so this commit should be backported to Xen versions supporting Icelake.
>>>
>>> Backport: 4.13+
>> FAOD nevertheless it'll be applied only back to 4.15.
> 
> It shouldn't go back before 4.16, because otherwise we start exposing a
> bunch of MSRs (including undocumented ones on Haswell/Broadwell) which
> were previously disallowed.

Hmm, I'm confused - how would the limiting of this range cause more
MSRs to be exposed in 4.15?

Jan

