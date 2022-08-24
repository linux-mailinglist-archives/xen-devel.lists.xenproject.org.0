Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AB459F35A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 08:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392182.630361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjRi-00053i-TJ; Wed, 24 Aug 2022 06:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392182.630361; Wed, 24 Aug 2022 06:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjRi-000514-PD; Wed, 24 Aug 2022 06:00:58 +0000
Received: by outflank-mailman (input) for mailman id 392182;
 Wed, 24 Aug 2022 06:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M3pU=Y4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQjRh-00050y-Px
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 06:00:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e512464-2372-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 08:00:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4413.eurprd04.prod.outlook.com (2603:10a6:803:65::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 06:00:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Wed, 24 Aug 2022
 06:00:53 +0000
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
X-Inumbo-ID: 1e512464-2372-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYDYdLS4esVpk36A1vxt8X9oXPBcmALBUd+l35UhbsKPlsK/+iOFUq0kQe6MDS/ZnhvdjzCVOcETexgwaFgicmFDOWqhK78+5B8za8BOcdIF63UKtt7mqGGoUlUPCITVQUBx0kA3i7EV5svH5Naf1I2bjeOIzxmkSAXg44n+1kp40QZUOL2N/5e34aJJWozSSK9+N65O4OjenSepNa+QOBZcsbsaG9DfH3cAATFXm66jV1073yjByh3uI7sKAHCZ5tYY4KbN6tfR8nTZ1DUUNPI4aM8Reg41CNZWnFHIOfZruxG5hC3bAZMutg7mQPU7awbXWKwQmsyvx3qmmD+16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt91lwIbbsksV0yTwfyBb2I1zskDDO/eRi+yZNFT4Y8=;
 b=XvyD5GIj2ECHKc107/fnFKy/vgBLW6T/BZWL4WaM0PkrZeRo0Jrwrk+LWpGI2thnRg5Jae3t3EpW6Ml8kgfFQU0yHQ47v7LrjkfSQnbQm7RyAkLf3N7HsVoNDF7T6q6n9+y10kLLWGUNkRxudXpKgnOprtiN+JqyWxg0GB5YyMrcCm6ADZ/GwzG1Nepdiy3zqARgdcMcPkXEKjvvYn4SIUZPPwuN/TWLpelrwpTtbgobv2mWRQo2jie/C46IaJ5r/y6RXgbC1quFFeBWQPOQMkgPCpaFdZwMVVeUe+NQYh8gOmRuR0d0Zft3WBKJqWYlvqS+5Xpg918J0q6ixz+yDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt91lwIbbsksV0yTwfyBb2I1zskDDO/eRi+yZNFT4Y8=;
 b=XbGuladkq5hMS84/qDKWmTyQ64kz2JH355090pXlDVEWiVkvevOl9SA2REX3mBSL95UkJYlqTrdvm43adNIvkVbhpb1KEOzVntyOWPxvknQrDfSdg10MtT/oYpFU+ru1Y4ONv7ovKoUCCp06/eSX4HEiDrYhGR2hQlSJVNbXTkA6YGxXo9b8vV3o6zqlhCBvftmhZ7A59u8Fod0ce5romrsbRUsq9MTF9p8sMFrcw10ZrwVeTljEBSuD5B7mb1sZ/DHVFs/2xgWuUIQOSd2bVRc/ivH3fMi2MpRkfjLfT/vA9GiyRos1TNP+qRjVL7YrDXI6xiDptGIuzcKKkjbSiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e846638-c23c-0ec7-54b8-e318527ffac5@suse.com>
Date: Wed, 24 Aug 2022 08:00:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] x86/CPUID: surface suitable value in EBX of XSTATE
 subleaf 1
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Thomas Gleixner <tglx@linutronix.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4ec41e6-16cd-4452-19c1-5d6d9e3bddf8@suse.com>
 <27f97ef0-148d-a0c3-ae13-0ed4d640a10c@citrix.com>
 <b3873ba1-f2f5-2f64-9bf6-d819f614019d@suse.com>
 <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5188b0d-43d9-44f1-2aae-e8ca0350a911@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR05CA0034.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b664c90-3386-4170-8e63-08da859600af
X-MS-TrafficTypeDiagnostic: VI1PR04MB4413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t96qKN2Zxo9L2+57XNrS2BdQqhvj6K3RmATGXnHeTxyF9AOz/pq952OjZGdvPiLkzEAq9vlO0dtGEFypSye+gKv3QT5XwjgtvjrWQ2cS4kArxN2e4dj09jrGfig/zO0xAkinLBftH4Jmdwz5HjCmVdXk07qMnuDRC7GrUMFzMQehujvx9Ma2M90QQUeDMjMuAlnDCfiD+OYcFhYi4VLlrI9bS3hc1N1zyJ8CI/uXPUy75pqX+hesOemo41w93Tv9HLt4hyXfZqGM50CWHc06SqAHrl0M339c9mKm37jlisoKMAU0nMnH/BQsg+aE7fxFGPyC1LjYSf/3KCFSfoXCQOFHTH5wt3Ph/pEFXN7RmIprHQj3I+x7jznx3wfukj5EC7978/2YEBQ0oxw9kBvlLZjAO5wOyqO3Cx3tNmXfLik+rSRDgiuxfdkiQSRdcyW/nCm8OjYb4pI/590Spj5aPjAmwfWgB7OKutzTBxvPmREVPt/rZIKd5IrP7ieSqJFKKCsIcjql6G/L2YbRn3oCMbKqP9H7Xy0J80Dj0TVkT6lPOh34/mS70WiZzExpv/xyyKBsy6YrvgRZDx+H0s48l53hgRt3pBSjf0L8u316ay8GNO5jkPXrqHL2Z7YTl8DzHDYleSOssYkYy6Ny/R5AkFj+R47uLvU7irAJPcyGGXNyuVsPtlXHTUYMmTrd4b4MgKU7g/UzFCEZukxTLMHrtpESSNAjmGsTvWT1NSKLIrzM7mj9ivm3hAHQtOhIMDSJYw7nH+AxboLIx06hPc0QV8LTI4vRk+p/05Wnk4kUBY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(396003)(136003)(346002)(39860400002)(316002)(2906002)(6512007)(41300700001)(31696002)(86362001)(26005)(53546011)(6506007)(83380400001)(2616005)(38100700002)(66556008)(66476007)(8676002)(66946007)(8936002)(186003)(4326008)(5660300002)(6486002)(6916009)(36756003)(31686004)(478600001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lRWmxlcEVoQmZReWFaOVkydy9qUGhhVE5HT1JNWlZtTlAzYVdXL3NTT09l?=
 =?utf-8?B?ZlBhK05SV2Npb256R1Qrb3doWnp3MnhpWXFaZW51aWpyM005enpYcmZXSTBL?=
 =?utf-8?B?eXNtMWZzTGtKUXlXQkM1SDZ3b1JkaHJHdVJ3UmlhU3VCZjZLS1F2b3F1bmFN?=
 =?utf-8?B?d1pQOEZna00xRjF2OTNkdS9Lak4xUWpYRnhnU0J1MlR3N2dvcVZyQzl4YzYy?=
 =?utf-8?B?V0dTU1VSMmhMZ3dKTFdVSGRlYjNIczA3OVlLZlgrV3paNHY1d0NYMi9sVFdI?=
 =?utf-8?B?QVIxN0VNamtLTDdQdmhMRThadVk3Q0xheEVjcVJjTmpDVlR2NVJ5REhGT1NE?=
 =?utf-8?B?V2pleXVkYm14VFYvdnBNYm1wdVdhNDE2dmgxVWRrQXZ4U3k0OW00bUpXaTJi?=
 =?utf-8?B?MnBhZ25uSnNHMnRUaGdTU3lJWGZKQ3FHay9ISFhSVCtMZ2E5ZTBqR2JvRjRK?=
 =?utf-8?B?WjU1dlllNFlDS0NoTzFTNnBkNXZtd0dQZUQxZEpZelVxL293WGh3dlkyZGcy?=
 =?utf-8?B?WmRrZFZQL3A4WjFNcUV0dWRoWEo1QmhhdmRtRStMRW9XZG80aWhyaVRSdHpW?=
 =?utf-8?B?ZHExMWY2cWxkdWVrVmI2RHRsZHdDRlBDVlJwazh3d2tOcXRuYVVuODE3RmlV?=
 =?utf-8?B?aXZMdDFva2NrUjR4dFZDcU5xbmRoUEoyMUUzN0R3MlhMVFZtMmt3MGRHWVJw?=
 =?utf-8?B?bHNhZ0M0c1NWV3l5MTZ3U09MRnoranNJbzU5K0NUVTFGREk0NjhvSFcvc3pr?=
 =?utf-8?B?VEtObEM3R3dZa3RrRzlOZkthWU51dTUrak1ZY29laC9hMHBVanp1a1lNZnIv?=
 =?utf-8?B?c2Y1RUVKenFBSkhhT2FNbWlWOFpkaWdzejBhT3FTL2RIWHErS28wM2QvWkcz?=
 =?utf-8?B?ZWVxYTEzSzRheC9IcnBVemMxNVF0dnJOcFp6bUI3MS81enFUZmtTUWhOdWho?=
 =?utf-8?B?TGU4OGpWL2YyUzFDeW9weTV2eGY0RDZuL3ZOaGs1ZTdHM1IvNThXazVDK3I3?=
 =?utf-8?B?dkhOWEZ4VzZ0Y2JqbEN1WVE5OHFTeGdSam5wOWo3Y054L2MraDA5cHo3a0Q0?=
 =?utf-8?B?Q3lCRkxrRnBWS2tJZ0d6c1d5VmhkRDFua25wZlJidkR1aGk3SEVQd3BJOVQ5?=
 =?utf-8?B?NlBrWHo3M2lzRDJHdlJqMXdwS2V6RXhLVHVHWWV4NTh2L01NekFWa1BnK1l3?=
 =?utf-8?B?Uk1WUEMvM013OWZwTmgxRGR4bEVXL1liQlR4a21GQXJreDVOa01hWmt0R05z?=
 =?utf-8?B?emVqcjVVb09hb2dJL1F4b2c4N0xvYVN5aDVVTUNNRlg2RWg4ZFZZWmZkV3NK?=
 =?utf-8?B?bU5VQjdmcmIvWC9JTHJYaHJ0ekFvTWxEWkp0NElYNDRXUGFxY2RlTUM2Tjhn?=
 =?utf-8?B?cG8vMlJYbTY3cTRUWm1Tck1KdjFvTTJGUVBJSjRuMWRINGNSSTRwa1dpUDA1?=
 =?utf-8?B?L0tURW1YeFAzdnF5ZmhTNmZOS0F2OEZMU2xhMnhkYW1uMk8wR0xJaUJoWGhm?=
 =?utf-8?B?UFIvRlBqQk9qaUtFYS9Jb3RHN2UxQWtpWkdaTVNla3lQZUo4VWtyeXJlUG5P?=
 =?utf-8?B?V3dYTUc5QlZtc1cxN0pZbUNZZTJXWVc1bEg2ZUlCMUNIbnZxdmJtQ3lGVEVC?=
 =?utf-8?B?L202S2Z2UGhzUmhTbTZpNXFUM2U2ZTVNZVRNajkvOE9sWjFiZy90TDI2MWg2?=
 =?utf-8?B?RWhLQ0dMcXl2U01jYi9GNVIzR0Zxdmw5cTNEamp0N3RYenlmQ3N3bEpEQnU0?=
 =?utf-8?B?RW02c3pRSjlhT2JWSDQzejcyTDNjNXlLdjdYa0thQ3BwSGI0dU5Hdms4ZTcr?=
 =?utf-8?B?d1BJZFhMcTU5dEhGUUFtanF5QUd6aHFSM29KeHdFRHc0NXc1VTd4aC9MeC9w?=
 =?utf-8?B?d2k5eGs1ZlZsQlh3YnptdU9BMFNQZTVCZVlsa01OK2NuSDNHdWhnUzVXV0N5?=
 =?utf-8?B?VTJOOC9vUnBlZ294eEozdzZsTC84MXUrOXJCMEQ0cjQ0aG84SFBFVUdxYnpR?=
 =?utf-8?B?Nml5Z01jM2tBNlM1TnhUNkQ0VWpCRDM5NVVTMlkvZFkzcGtoR29NK0lhRTBZ?=
 =?utf-8?B?VXhoWFpxZHFFWE5qc205eWtUYmY5VWVPbWlTZXo1Q3ViUDlmaXhSQVFNdUZK?=
 =?utf-8?Q?qQWtVZFZ4S6V01rc6Y6WyQSUr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b664c90-3386-4170-8e63-08da859600af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 06:00:53.1315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njAVQokmB1p1vXI1AEMw0bbl8zaQ8Tbec3b5JQ8vavwvhZMTXb8MUy/K/nwz0Hb6Tm7557fPBlvj+OZrH7Q8FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4413

On 23.08.2022 12:48, Andrew Cooper wrote:
> On 23/08/2022 10:27, Jan Beulich wrote:
>> On 23.08.2022 10:59, Andrew Cooper wrote:
>>> But this is going to further complicate my several-year-old series
>>> trying to get Xen's XSTATE handling into a position where we can start
>>> to offer supervisor states.
>> Where do you see further complication? The necessary fiddling with XSS
>> here would of course be dependent upon p->xstate.xsaves alone (or,
>> maybe better, on the set of enabled features in XSS being non-empty),
>> but that's simply another (inner) if().
>>
>> As an aside, I actually wonder what use the supplied size is to user
>> mode code when any XSS-controlled feature is enabled: They'd allocate
>> a needlessly large block of memory, as they would only be able to use
>> XSAVEC.
> 
> This field is an already known kernel=>user infoleak.  There are threads
> about it on LKML.
> 
> But it does highlight another problem.  This change does not fix Linux
> on AMD Zen3 hardware, where the kernel will find the CPUID value larger
> than it can calculate the size to be, because Xen's use of CET-SS will
> show up in the CPUID value.

Why would that be? We don't even have CET related defines for XCR0, so
we don't enable the states in XSS. And I don't see why we would. Even
for other XSTATE-managed but not XSTATE-enabled features we could
clear the respective bits around the CPUID invocation (just like we
may need to set some in XSS). We'd be in trouble only for any XSTATE-
enabled feature that we make use of ourselves.

Jan

