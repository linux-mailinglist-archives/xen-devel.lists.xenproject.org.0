Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD95797D1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 12:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370538.602334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkef-0001qS-L6; Tue, 19 Jul 2022 10:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370538.602334; Tue, 19 Jul 2022 10:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDkef-0001my-I2; Tue, 19 Jul 2022 10:40:41 +0000
Received: by outflank-mailman (input) for mailman id 370538;
 Tue, 19 Jul 2022 10:40:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDked-0001ms-Vv
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 10:40:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39ecd785-074f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 12:40:37 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 10:40:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:40:35 +0000
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
X-Inumbo-ID: 39ecd785-074f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoBxl18nmlFDs7diHv14QIe94PiteUQXz4poWylD0n/rthcbbzfQbSPLoRhj4mqRlhkfCbPa3DNLoZTtMFCGbEgxKXQsz5h7KSIk/QIhDl8wPmRkoUq6SyK3DbUkzJvRpcSKH/yL4/AOttniG6L+5gDu2hkRaGTr67JkCg//0ZLRRYGThWSZ+UfbRtlR/cu08Z+TGLNhLN+ik21Q5l7xnd6aOaR0onzx9RAY3xVrT8ZojFTWNQLcWTE7tMQifooA09WdH52XPfq8dLvyDjz4f94oKvKOG/Oa7JOJmjRH8urq1fZ+SoOEt9zvvTA0VFxnavCmLqte0khT5LGBt3LUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRjwHYs/6+ulOWiNct/cBA7oHfv2XFfc84i8pr4DY4Y=;
 b=Q+MKDLAnMZ2lUZZuPSieiQG9laTec3Heg6L6FbrRPFxYEI3LSmWxpNauYe/16ckag0NR1zJPLOWKJWkC8Sel8xCYMhSSaLGRBrcwY7hsge52lDa3hOKvN3KzQ/IiKbNwL2cC2rXQUiUg5L527w7FxahG8Si9VuVpMmpJpWwpQHQe2S5nSevYl2GRwWfCknHCqZ201SWXPKeEcwrT98J+5MQAi3YemD/mbfynRf5Hygwo2V9D2oNC58td+CLieXFejr884Ze6JJg4ftZcJbfzNIHRlhwyVwRuZkV5AO96K1bl3TEhdxFszWSr28eUk7x28+8VORRrEwGHTo1SSINtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRjwHYs/6+ulOWiNct/cBA7oHfv2XFfc84i8pr4DY4Y=;
 b=iDmIxbj5tpaoKxwGzZ4ICBpdsMzXAYDXZUYTaE/Z6tf4HlKYpu4oY7sM1LsYLJnOH79Ra6MEMfnhK249yZxMWW77bdN4llkhb8WD/pEwtIXTo0Tpe7HXOxssBV0A7ogvraYymovCTDtHQ6XR57P42MSmII6ucEgC41+n5RCVMBrIlGrV8/sWhuIeAWNWwa0LrU5o2W4oyrJukZdbNvL3Z7vPUuW26TBCkaF/x9e63Nz3rtbi5xwS8VSlbvN73db6eHeqrj9DWi94XGNjod7GVlpA2xQJStw39/vOv7AnqA0QvxDGPfT0kNYTnbqiiag8GqoNwc6Jt0TdkzdNM0MgUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3aa941de-3dab-0265-02af-38ad1cc3a4f3@suse.com>
Date: Tue, 19 Jul 2022 12:40:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] vpci: include xen/vmap.h to fix build on ARM
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
 <20220718211521.664729-5-volodymyr_babchuk@epam.com>
 <b4554a1f-73ab-7a46-591b-ccb5bb34ea1f@suse.com> <87ilntgzpj.fsf@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87ilntgzpj.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 266669a5-bb47-46ba-1aa8-08da69731ca2
X-MS-TrafficTypeDiagnostic: DU2PR04MB8855:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/yTpuizHkCo3rRk6PvANPx9poMGK8YrFIub4aDYKPSE8z4eI45MEALPK0KQ7sfIrP+Wkufuh9x1nhutdxIH3lisxBEuj3ceyeVfXYSE5OxpMxrTxPM6S8xtaNGOGM08mai+VCsE0AL9g4ALSAlNs7vCTQvHz6B5ZdN4Ph6ihtbaebxNKXgSuuXDj9dbHrCydeY3S1fiS0u6329xQV2zbA474PT32e9Hu5nChdVREjukqX2V5Y3N13ysGjZcndGMVCzUKvN6leYN+cJlrd8+uWx0ah0nTJqmHMlI6cnnEKuFro6maCDSF8r+pHH0PVR/PeJ1eNspL+zyI+J2SHlc284KSg64D9jcrl0Q5AnZv52SsEDu4uM2yUy4KwRV6R9rcTkLZfUN4JFfGbyuyVIW8KysoKj2hl85r+d1yX3zFm5v6llXcmkCAbsFIkeOjG9//FOvEwP5fsymeKPsKtSAX/MJS53VI3UTsGEjFKwO5sSll/kUkLfZLqE59kSxRJ1UIgFTtojowa8w4K7wNrqIlbSycIMFyM6Wb4iu3hYgjzLK3rzFzOIwaZHFZUvtp33Onu06gGQk7HLUPS/rZ9Z7W4dl2Ivm9DPFmJwVtnkKlNp9NbTbPJLcjkb59A6o9HBPXa/FsEphMOEBDrEyzVrAnk5TBI9j2iRhtsqc35eFUQsLx7vzzTsFzqTdO5qtWJ6SojqVaLTPCGRvd9S7B6Hf5Q4xYCIPcdUubc6u57LUES5X8NHNpu6w2zunFln483MYiQltjADdMFn6TdWnOc7SibqjbsZ6MszDgxdY3Q2FoEX6J/M9oBF8OKI7Dbbu4NnusNqZR8tdsGyYLqpPAF/Z5GQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(366004)(396003)(346002)(376002)(8936002)(66946007)(5660300002)(4744005)(8676002)(66476007)(66556008)(38100700002)(4326008)(186003)(36756003)(31686004)(86362001)(31696002)(316002)(6916009)(478600001)(6486002)(41300700001)(6506007)(2906002)(2616005)(53546011)(83380400001)(6512007)(26005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjhndUNPVFJiKytXNUdwNnFTRG9ZRXl0Zkp3RmhIcG9EakZycml2ZVRPTVFZ?=
 =?utf-8?B?amhkUkZKZGZQTzlhVEJMWWFVSkZKOUVuTVQzMnR0aXp5OGlXTWFrUi9UKzdN?=
 =?utf-8?B?Z2FYc255UjRwcEV1MGNQUGllbFltbnVWdld2RXFKc1BIMEl2WkpCcEVMQ01v?=
 =?utf-8?B?c0Zpc0hNOGpsWWJXSC9tYlJxODlISFRxTmY2dUI4VTlXTGg0Y1J2NktWMmlT?=
 =?utf-8?B?b01ncEtjZUtRaUdDcXFSbE9iY0V4SG9kMWJmdFlpaTdPbFJXdFgrVnZYOTc3?=
 =?utf-8?B?TnJRTTRGRy9LcSt1L0hVL2tVUjhyN3hlSW5jVjNCVG9HM1piZmN0ZUZBWUxV?=
 =?utf-8?B?VHlHNUpGeHVMdWZxYlBSU0xNN1d4NVo0dDlFdDNpbE4zbVZwdVd0dVdUcXFB?=
 =?utf-8?B?Y2pvclQ5elJvenNrQUJyVHZ3ekhabmkwZjg3TG1lM1FFS1VCRU1pbVhnUkJS?=
 =?utf-8?B?OEVhU2lXZWJSRWt4VXFVUytvc3lhWlJVSTg1azg4b3hhRmR1L3l1ajk4dk4y?=
 =?utf-8?B?eE1sRHdyMWs4T25SWk1Ea00xdFUwNi8yQ1VlOUJxMHJ2djArUzE2S1Yxb1ln?=
 =?utf-8?B?VXlkTTB0TlQzZmhNS2dPZlBWV0czZEp0YTg1c2pqOTg4b0NMS3hrV2ZqY0NX?=
 =?utf-8?B?SkhWVktCNUlJV3ZmaDR1Uk9PdncxOE9DVjFYTG5tbzBLVHFiNjdPc2VYRXZo?=
 =?utf-8?B?R2hpNkRDNFQrVFpwOEtCZnU4N0ZJNFJxajlzVVN4b1REaDBMV0FVQ0thOEJt?=
 =?utf-8?B?dDFqcmhTT3prdE4yV051WVlCemdxSFdYQlA5UmZiMktuRWpSWUQ0cWh6cC9C?=
 =?utf-8?B?VUJieWRiL2JXWHJoN25mb0FwTlN6NWVMU0IwZWFudFpQdUN3cEdBS2phbUND?=
 =?utf-8?B?VndXSUJpUFFVV2VFSkthQ2R6ZzZtdWY4MlYrcEJLbldDb3lMczR0OE50dUxn?=
 =?utf-8?B?S3hGZ2RmUWFUZ2JaZFRuWVBhblMvanlCNy9NdEVRM3NSZGFabWtyM3RzOFFP?=
 =?utf-8?B?V1JOYng4WXp1VCtUS2ZnbjJRM3JVNFBza3VXMk9JWjdiekRqMU4zQW11ZDYy?=
 =?utf-8?B?WkRxdlFpdjVyVUZmbDVEb3gwdDArTXBuaWNlN253MXZ0cFdxT00xSlRGVzNa?=
 =?utf-8?B?OUM1TkMzVzc4NVFkdDB3di9wNjhsY2ZQWjNpU29QOVpUQzF4NHdodkJBQVk5?=
 =?utf-8?B?RXlKOTlXVDYwc3FySXF1SUY2Ky83aGZFUU9XdDZTN2VpQ0dtdTI5WmljZnJv?=
 =?utf-8?B?eWxtS2VUU0lkaktnNFpJWENnVGkycjNVOG8ycTJCU3QvNG1nOWJhQ2QrUEZ5?=
 =?utf-8?B?U096YXFZZkF6Qkt5WTFUM0czR1dzZFlpa0dxajJwU1ZxS3BPMVMrcG1pZjR5?=
 =?utf-8?B?UnRTODFhLzc3S2FYaDBqNXRsM0plcWdZTEFERzJuR09oN3VzUlJvV2R6MzlR?=
 =?utf-8?B?bmEzajJIVk43NG9RWG9zS0NGN1dXUXVnV3N6d01sNVRRYnpQcXd2bmI0WnBi?=
 =?utf-8?B?K1dYejNpYithdUdsTDdkUm5SdHNaUTVndm9jd241R05iODVlZHhhUDJ0L29S?=
 =?utf-8?B?K25iU1FLUnpSbzRmYmtTcldQT05RcnR4d3ZubGNiSW1qTG13SFl0dDdtZEVN?=
 =?utf-8?B?MGd3bkwzcWlZRWJFbVVQNkRLNUpzdDJXOTVCWkViWWZiTTJwSm11OTFwdVNQ?=
 =?utf-8?B?eFBuZVVOd01sNGtKMGlUdHAycC8wYlU3Rk5QYXc0a081cVpTNUlJMCszd2pJ?=
 =?utf-8?B?cmlRQ0FmS2VhYk10cENkTitHdDBIcEY1d3ZENHh0VlZRUVNjRXRrYXMwZmpi?=
 =?utf-8?B?M21JZDlzYUZuNTZycWJqM0xWUTJiNUJwdUM0dnhTbCs3d29rMnZxQXBqT00x?=
 =?utf-8?B?b1gvUkN6UjZFYmFwZ0crdlJRdFhVSmNXSk8wK25RNWV2N28raFluMDRCSVNM?=
 =?utf-8?B?QUFNRzNzbWkvdi9nSWs5Um4rWFloLzNKZE1ncUJFM0hMc25ZeGRUSXdpRkFh?=
 =?utf-8?B?QUZWaEgrUldrbC80WlJTNU44ZWpTNmdBbGJGcHllQy9ZT0liaFBYV0h0cWM4?=
 =?utf-8?B?SThOSVhFU0h0aGQzNlJ4RTRxVHE2eU1xYkQ1N0toejJFZUlQTVhoRUQzaVA4?=
 =?utf-8?Q?kW6NaHmK2U9iwFj6rqrdQv6zX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266669a5-bb47-46ba-1aa8-08da69731ca2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 10:40:35.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tia8XdfpHkoTjjkZLOcWh5yXXARmwHpibKcsMtiD+Zzf/wqhesZbzxPziKVh/W3QLkxsPRLK36wufHy8sYCBNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

On 19.07.2022 12:32, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 18.07.2022 23:15, Volodymyr Babchuk wrote:
>>> Patch b4f211606011 ("vpci/msix: fix PBA accesses") introduced call to
>>> iounmap(), but not added corresponding include.
>>>
>>> Fixes: b4f211606011 ("vpci/msix: fix PBA accesses")
>>
>> I don't think there's any active issue with the "missing" include:
>> That's only a problem once Arm has vPCI code enabled? In which
>> case I don't think a Fixes: tag is warranted.
> 
> Fair enough. May I ask committer to drop this tag?

I had taken respective note already, in case I end up committing this.
But this is the last patch of the series, so I can only guess whether
it might be okay to go in ahead of the other three patches.

Jan

