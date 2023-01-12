Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7F667252
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476107.738102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwpU-0007Lh-4q; Thu, 12 Jan 2023 12:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476107.738102; Thu, 12 Jan 2023 12:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwpU-0007Jx-1N; Thu, 12 Jan 2023 12:37:12 +0000
Received: by outflank-mailman (input) for mailman id 476107;
 Thu, 12 Jan 2023 12:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwpS-0007Jr-Dr
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:37:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d448a08a-9275-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 13:37:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7649.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 12 Jan
 2023 12:37:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:37:07 +0000
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
X-Inumbo-ID: d448a08a-9275-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyVBY/W5EUfzWR936HNMzRbE942tx6bMwkYbmpsrKKboggy+vgzm5lQmS5x0pGnEKUDxzuSx70H4lNdypZz3ayJjZNre+/89F4KFBCnRGanA3C2Oo8X56WFLoCCHsKfb6zHRCcDF8fnkZNwuKhNYwSkjJ6IiESOSnEDbTR7dxkwickoyVivKrqUmH0a3Bo0LtUK9dTT+Ni3rR8RhOgtPdAKGgmTly5EteFwxD1WLKq/9tuZ5AZLssB6VCZNJcmb1U5Q976TdCkRJB1PeumMfq1nscg+VI07KK+/gGvS0FJmXf5VhYbSZvhtb/9ROhNSz4i+QAXXO5HwcSGZLJBgkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoZp68UQ9//guHuBEsj9AbqZ0JtSUVb8y30mnObDHNI=;
 b=RE6Htba0Wdxgz9BV6iznpu//oC2oNLXWcWBjFiDWDYYwBDbOYARzRYHFU9plV8H/Du4wNkLbiF6BeysCBJvmohwY9K2ULwouM5BZYZHRkbJs3EQK37vu4sMmVOObgLZHcjhLCWqdRfImzZ1eFk6cn+anzpZrD9qRzBTN1YwRHcgq4+m8HCYQU1WT9VlNx7F54jQnzfA/t0N4DHyHKnzazE6a/yb9kNAeyCxGjx8mQJ7QN/wiMW38VCgBtn183ktZ3YEWNeq7rsE7FEWiqd2ze7EMlecbHajdQej/hlZ4zIBztEfkmSDPyZxxEuQTWRQa9F6cQzxIDTKpMuuB46/LCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoZp68UQ9//guHuBEsj9AbqZ0JtSUVb8y30mnObDHNI=;
 b=AiaAxBxs52nvu8yUtA0kTM6LBfMiFxV6unVVOlYUpFIxh/4i+2bo0/fpF7Y1t1QU0W0H0FRgYWac61VRXMh8kVMvYB0xKEyf/or0ImInJIjVXy2Zp25+WKi2kSIUQiMlI4yZfYLuRvFD9VXTzHaddVWrfarejW19j/FnRXpFzAeJVnRIrK0icap0I5us2nY53bjdL1heRX3iHbfY+UNbW7wnI6TNA0sj1ecmAnjE8PtXj1ylgQxXcGXIVcRpUEOIxt8Q+iEIEO42qDWOwBgpzHDxJxP198nvwHUsHe3ybyO+lGGx+JU/qv2fPRRB07kvNDVD1KSdLicM1I01dGgx1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c5a4c07-e942-a683-8579-a0f9d5971c7b@suse.com>
Date: Thu, 12 Jan 2023 13:37:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-7-burzalodowa@gmail.com>
 <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
In-Reply-To: <aa20eb4d-7b18-9bbf-718f-2fe5fa896713@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f5bd65-2411-4105-fb10-08daf499b78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4HpCIIhqSni/g+SF9DfUs4aWHvX0VDLbxHaMprthr7zPbeMIraLwHKOWEUlD9Sl27HyDhhtM0asoW4FrsS+1TRQBi+oW0+S6fabJhchNlE57A5/vokBLxVs/9GjWCEkLfHVj0hUoqXv7L3J4erxGUY6ZHEL+PmLEJtEZQqPZseMvl0seJc/HVgHKm9WMICxES2nPQV0MpdiAaFipLmhuyQOvaRr/KwvfvhMA3Wh1sPsnS+zuf/BwxQkdGBooIOyAQM+azNga9ARZ57XGLEgzLc2p4Bzysq/bM650BYDP0+U1FDccRqOum6YApyKOnmJjjS1t49KzmdndbOO6dESgohDsnLIUjHnr/4e+qTNR8Ejef+LUQkRpVKS2cdDru3oViYDZ6fcQF1lzxCJICz+BdUlOl2NJLC3sro1sIO/UKU/KRiwZLt8MAZs9sd/gvNJU6xRymiRUzfknU+gupYt1iy76xpoS5BBVXlQjM1sniyYlPBWQERaNgT4UoXMiWs8P3JpoMm1w04gcC9EhJ/kLMDK7CKS+oIfx61tLNfrQxphewIh5pHwNIcJ1QZpFxj1OX3VUXt7g2nGIHUcZWnVVOJTTPV1F65t8cpr/NDVtpxHuCMnVKfZdxhGuQCM5KPUThawSOIbmETw1/AKlm0LdNqX0QVNuM158t8v3BzyyU3GWV4w6lelsuD+FDsctP2C5I9YDh+fAnviNl7qhnFYhCI4ELNlJrok7jPcAsXCc8Qc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(83380400001)(316002)(2616005)(54906003)(41300700001)(26005)(5660300002)(8936002)(66476007)(66946007)(8676002)(66556008)(6916009)(4326008)(31686004)(2906002)(6512007)(6506007)(31696002)(86362001)(186003)(36756003)(38100700002)(478600001)(53546011)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTY4bm44bTk0MTQ5bi82ZjRHOTdtMWN4QldGbnFJNXJ3bWdORDFTZGZHL0l2?=
 =?utf-8?B?NEFuckVGanFIR1hoZWlTamtlMm52RERrTkd5ajRaWXJJRUkwRjY4bWh2RTAz?=
 =?utf-8?B?THhCSklFdDdMNDBiSVlCZUFMVi9Mc1VLQklKNllmVFNZVXFvT3NwL2dNT010?=
 =?utf-8?B?cWJobU5QSzZ5ZmZVbm5CK3BKV2xXeFBlVWdUYWU0NGtqcE1YZmZHcmVtOElY?=
 =?utf-8?B?V2VQLzVLQ0pJRHdEWDFXRE4yOWxPNFkySmJUbjhFNG8zdlJxL2tGYWFXeFVL?=
 =?utf-8?B?VEExVFNiSkRpTEtQL1FtTzlUdjJ3ZlBuUjkrQm9JU3RwVEVUOUNYVjRYY25o?=
 =?utf-8?B?MGVuaDlXOXJ1YllCc2pXUTg1dGxDQXFTTlJDRU5pNkxtTjVta2paeG1ENGpP?=
 =?utf-8?B?Tkx6MzAyVWFMcHRLelVjZmhyYkQxQkVuNHJUZFh1dU5USkZYYllxRkpOanlm?=
 =?utf-8?B?TUE0UkJOUTIvR3Frc1k4c1JHV2o4Vjl6NGNqamZWbDM0Y3VpSFdKbDFDNGNU?=
 =?utf-8?B?Mzljc1E4cFJySW11bHlRUEUvVnIxWm5NeVFqUVI4WlYzSC9FL1JIYzlob2xY?=
 =?utf-8?B?Wlo5cjJZTGY1b3lOUUd3eUZTL1Q4ekliSENlS3BueUZNVS8yZ1dNQnBCZDdZ?=
 =?utf-8?B?MW42Y3oxdEhRV2p2eisySHg1OUNGWkRCL3ZUM1ZlclhLMExKRnZOVS9aSnZ3?=
 =?utf-8?B?VWRHQUpBTTYvVk9tRzU5WWt6U2FlVGdSdGJBTnRWemtBYW9RcExHMFdYVHYy?=
 =?utf-8?B?ZENydmh5Z3BEK0o1SUhPZk9CUEM2SVJzdWpsZWRkNURpSUxUT0ovTjQ3dGZa?=
 =?utf-8?B?Q0ZUTkFpZGJqY1RnTUt2dFlZWDVic2dwRFJ6L3huRmRkMWl6RlY0RUJCU3Yz?=
 =?utf-8?B?ZUpnOWE5NVRzc3hTWWFYQ0trdnVObHh6cUFUaU85aHRrOGY3UHIyeFVIWDEv?=
 =?utf-8?B?aGoyeFlRWlk3eGdWdEdJemZhbEhiMzlFQ2J4c0VEbEJaMHMrSWtrWmo2K1hT?=
 =?utf-8?B?d1RveUh3bWhyMkJJakdZYXdOYUpDdFJFL3pGOVJZTlZlUDdtU0J3aHFtbHQy?=
 =?utf-8?B?OGxWaFZ4VVFYN2FsUCtPMmRBRjZydlN0ZlJ0aWFlQTZPV2FJd0Zlb0VwMFFB?=
 =?utf-8?B?UVdjSzBONk5tU21sZHdXL1l0K25nNmdzUmp2aE9qTzVhTzV3dWE1YXU3c2d5?=
 =?utf-8?B?TVJnTXY2SUZUS2xVbkEwT1RBQ1RvSlhqUWdvUzdrMVBhaG1GQndFa0NWZmdN?=
 =?utf-8?B?RTd3Wnl0bGEyTHBTU0tnZzF4aXJ6Wi9KallKOUJFbTNsdk9yK0xRa2RTTzBp?=
 =?utf-8?B?RWNZTGg1Njg1RXZneUk1cFJqbi9NREFUMG9uc28zYkhNOGROVkVoaGdvcExR?=
 =?utf-8?B?UHVSd3htOFlwK0FMZzM1WVcya01saWhLWWNwUzBCNHViMThteTVLdFJuM2tF?=
 =?utf-8?B?OEpId1U5dHphOXRtaURBaUJCUTJxYTVxcy9Dd1oyeUo4S0oxeTRORG9Ra2o0?=
 =?utf-8?B?VHhZd3BNNEVRbmlsbXJ6RG9tZFZsZjFGTW1RL2pheTd2LzVUSmxha1NjL3Nw?=
 =?utf-8?B?eGUzSEFpUU8xbFZ2OTl3Mm5QejNqcjhwbWJnVTgzSkt0VHBoUGNDdjc3Vkw0?=
 =?utf-8?B?YVJxdzZXd3lzZThVUjA1SEg3V2xJSWpvdGwvQkY5UnNCeVMzZXNTSFl2Mk5z?=
 =?utf-8?B?eFF0UG1xL0JaaURYMWs0eEpLYTZHSzBKMDlLTEZaWWRhenBOOXFzTm8zdWlh?=
 =?utf-8?B?MlFneGZnb3RPcytNRmtqSmlzc2U0d0ZtdklFZDJKSFlxZjVUU1d2Zzk5SVNp?=
 =?utf-8?B?VjJ4MjRHZmZJMk5mbGdJMGlhZUdHTmN1Sm05bnV2UStUSmNiT3FEbGJwckVD?=
 =?utf-8?B?a1VhMWlwNUlCS1dPTXBvb3VnSTllOGJRYWdFRC9BTTlEVGlZaVYybXhQSTVH?=
 =?utf-8?B?cCtCQnR6Y2NCRzBaUUZTYmw2eFF0TWk4cisyQnNOYnprdmxBWUh1aHlTMDlO?=
 =?utf-8?B?by9nci9rZGRlTXUwWG9hV3NhZkh6aXhtSUd0YW56ZnA2UTA3Q2pjck1qalJE?=
 =?utf-8?B?Zy8rWXVweWpQQkZaT0xId1NyUk9CajR0UWVSbXNZNVNRU216L3drNmNBMjNp?=
 =?utf-8?Q?mhQITQcysULTHYhdQ7tDQ/abt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f5bd65-2411-4105-fb10-08daf499b78c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:37:07.4708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6MVq4JAluMvF28RoBxvkzc0KQuxvXPpDZkJdpbv5SFT0a0CGduoKQOrZOa9iddBjZtxZLeBkqB01zBOE91+kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7649

On 12.01.2023 13:16, Jan Beulich wrote:
> On 04.01.2023 09:45, Xenia Ragiadakou wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
>>      return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
>>  }
>>  
>> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
>> +                                       const struct pirq *pirq, uint8_t gvec)
>> +{
>> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
>> +
>> +    return pi_update_irte(pi_desc, pirq, gvec);
>> +}
> 
> This being the only caller of pi_update_irte(), I don't see the point in
> having the extra wrapper. Adjust pi_update_irte() such that it can be
> used as the intended hook directly. Plus perhaps prefix it with vtd_.

Plus move it to vtd/x86/hvm.c (!HVM builds shouldn't need it), albeit I
realize this could be done independent of your work. In principle the
function shouldn't be VT-d specific (and could hence live in x86/hvm.c),
as msi_msg_write_remap_rte() is already available as IOMMU hook anyway,
provided struct pi_desc turns out compatible with what's going to be
needed for AMD.

Jan

