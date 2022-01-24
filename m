Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8200F4984D4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 17:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259924.448722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2EF-0003nw-0o; Mon, 24 Jan 2022 16:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259924.448722; Mon, 24 Jan 2022 16:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC2EE-0003kQ-SH; Mon, 24 Jan 2022 16:30:02 +0000
Received: by outflank-mailman (input) for mailman id 259924;
 Mon, 24 Jan 2022 16:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nC2ED-0003YC-AF
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 16:30:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfedff82-7d32-11ec-bc18-3156f6d857e4;
 Mon, 24 Jan 2022 17:30:00 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-AD_ZMNXaPPuiPgxuEKufKw-1; Mon, 24 Jan 2022 17:29:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0402MB2930.eurprd04.prod.outlook.com (2603:10a6:203:9a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 16:29:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 16:29:56 +0000
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
X-Inumbo-ID: dfedff82-7d32-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643041800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0TkUH3x/EEJXXR+NO6BZEI51INDb8h8sa/CRb7WX84=;
	b=hWYJ5m671aaM+P/PWUgfTlvYi7I27j3HrSVk+zmBKDENil8UQoxMgXIqPDFdiFdufeGW2n
	0O6ePfkq0Z/xNZL76TTHEiX4W7soPDXaYsE7Qr05CEvUvV36LRZEdEf/B8APzLPp5EcwgZ
	TZ73hH8KidW2uEPAeU6voPypiUsndDo=
X-MC-Unique: AD_ZMNXaPPuiPgxuEKufKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzF9hMrq39QO4GC6/mlHoV+WuGeOpfZOA0jGPzKPxR8uvWxOOlgmwJqzRkAV5JEdtztDJta23g1wh0Ks1Rvvo9AVHBLDqrsw4XUDcoozI1gPovbqBpe34S2+XarG98h7OjuiTsvM2DcFnAUsHVLaSyfF2JIRgRGmM3W/RzePsxtynRYMxT/CNDPnVORNSguUHU0yjD3RQwGJXkvLZwn7DHdqoC0KM5UbsCbTvOC/6eRqqIvgXNdlJ7bMvkgln5adzHNXypUAi5yHWULRUmtZ79AqSH/2J3b/1ZRaD4Doy5v2+PaYPnS+zghNS8lRwgrMRXPA7VQtJvOXa4g3/qozVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0TkUH3x/EEJXXR+NO6BZEI51INDb8h8sa/CRb7WX84=;
 b=GR85ErBUOAohNsbSrHAb3XWRYWXMTeEt4l75Zno+ZiI9VE5lOhfKO/yKMbOi3QSmryISke8upANYm78JrqowEfXuL8q7xP7ELcAlx14zQuPQmMNHqEQJ6CAkdYjP3YZXeTDKXRCEu71qD0Ok5f86KVuhY6nH1/nritUJvhmsUWMP1hx52BFH6geq3QRlyoQ3IAejCnK0VGCnYJyBqAVm8sSTJVz/gAiwSCLxUHAZSqzjrwRlmFDUi4LVgEwl1otReskxkN8gfNAtuBE/LofDdmbLfBAeisGueZ9Csf5ARzKzVwCx97DuLTNJOYKk6naJ3Zk2WOhx7a9BhQsnLgK8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66ef43da-fde2-7cb4-0b5c-a3ed7ceb139d@suse.com>
Date: Mon, 24 Jan 2022 17:29:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-11-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-11-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1de0df3-82a5-4a13-f5af-08d9df56c1d3
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2930:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB293048C7B228E5FCD2190D22B35E9@AM5PR0402MB2930.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGXioKKMagZ6hRqBTN2T/sMlRXMhJlTS7/yNev/jK/Sl7KWJdYFYn63fTsN/r432rCnezYyI+j/2xSjmzC6XEO/OvOQQsgV+XifjeiC/uPH2y22V8h8U9/Ul43L/4+N2CtReQuEDtDTBK3zQPSPef/lmSA6/3mzt+Qlwv78rgaH2xubRTYTNdrRnRsxDJbjLk4I/joKGiaJE8FrbTyozx1mtnsI3q1TAl8SpG1Va5VGM+EeiwmLtkideQVrd307eg6TFEa3PwHMvL4aYPsaOXF/vZR/E22knJog+uD4n4UXyVA0pvpH6ObxxXHkvvO6D1fXBEyok9tMS3bFaUtotZMcsZHORTUgJ4Ouh1FM0/9f0+r4Rn2Bfw3YyVVpsqYDFShnOfJ0tMsLZOH6yj6lHAV2P7aWnd03pwCwacJsREtA00VPy3mj1tMRsciYX0Rt5YdQTNjv4twX9NB8B9VM0uge0QZKYm1/Ezp3ga1QbXsEbVf28Nwo4tYoGVvnIava4OENTcs43T/97UoKzp/RGxU3SPYbTO+KQEXFNaLnLN/lYi3VQD2kuYvKSZfCsycr12qlp/y5/dsTFMHoHAvi0455XU2/GFGYNO0xJ617EO2ktrjizRmlVU7N6vSP2q2idcpQQ0ks/ZadVvi//ANAX9+hi12bnu7x2tNAM1XteKuSHAG2MY/f84KTMF00Gb5EDp/NNARETFdEO/fp+OmRrVn6qnmJrikOadyD4NzfY5eKH6/O3cMNqiHHb7ETj39vg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(8936002)(8676002)(6916009)(2616005)(4744005)(66476007)(66556008)(66946007)(4326008)(5660300002)(6506007)(316002)(86362001)(6486002)(36756003)(6512007)(26005)(186003)(508600001)(2906002)(53546011)(31696002)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xNRUs3R0UxQmluVXJ5R1RpaVVFWHNYQVhqZ1hGMWt5RXJ1OVk4RUtSRExq?=
 =?utf-8?B?WUlqY3pWU2VsUzN2cGNSVGJCZU44VE4xN08wNDJRbkhVZlp4Y0N3N0VyUHlM?=
 =?utf-8?B?ZHRvWm1jd1h6cnY1Z0NoY0lxVTh2VkVJNGJFMFVxMldsbXh3cENwUU9lajhU?=
 =?utf-8?B?Q1lLRnBWYWdJMlUvQkZ6TWRGbk5mWVQzM0l4TmFqSlVZK2g3K0NiR0xuTTR0?=
 =?utf-8?B?d001NHBwUldVMWRPd1RXMW5LYTVoWk9MSFFoR1pic2thalNMbnRrU0ZsbUZz?=
 =?utf-8?B?S3BtaGMyMVBCamh5UzUvZnlUU2lwODlJbkxvRVhYZ1h2NHh6L0xQNTFwU1dk?=
 =?utf-8?B?a2tCT2lMdTgydG43MG41STlvWCtRWWNRakp0dDk1K1U0VHZvdngybzROKzJI?=
 =?utf-8?B?czlZQjllaThLWG9sc0dlMk1NQ0tpRkwxZUJOODEwNGZtdGZ5bis5NHk5eHlM?=
 =?utf-8?B?STdWVVlhVXdIdVdSQWRuR3J5Z2pFMStvWitZUjVCcTIzRmFSWjVyVHFCcWsz?=
 =?utf-8?B?WVl0c1AxVmpjei9jVUM4eWhiV2pnWjN2WE9OZXQ1c3hyWkJpdVdtV2FQMmp0?=
 =?utf-8?B?MlZsamsrNW8zZWVnVDdvZ2I5ckcyUm1GeThQclRJZ3c5RmNHU1FidmRRS1RZ?=
 =?utf-8?B?eGVTb0drcCtzTFpIZlo5UUd2bGZqWWRVYWswT3A1R0Y0WHU2ZmJqRUtNaHJY?=
 =?utf-8?B?YmFqR003cjcrMmJSdXZ4ZHlzVzJGUDQrTjdndTBPODgvNjBadzhJeVY2azQ4?=
 =?utf-8?B?cU1ld2U2bTl4KzBhbW9nTXhDVkJ5eUk4UmFLUnFIWUJaRWkwSFRyYjdqME5S?=
 =?utf-8?B?WGdJRSs2SjdyVHhxcGgvcTR1TUdDUnM3MWE1TWUxZjQrK0hyTVJZeEQyYitJ?=
 =?utf-8?B?U0NsZXc3S0E5K2xOb2NjTFRjZ011a3NHM3JrdENzTWdLYiszeS80enBFa2hu?=
 =?utf-8?B?TTZnZ29XYkFRRVVRNHk2UGRWcmYxRE5tQTVkQm5vVWEwTG16WHVBYjVTMlpy?=
 =?utf-8?B?NEdlYzBKQnRUYjVuVmFEMEg0MjZ3Y08zcEdTb3VRMk5tK0svVjhQeFI2Vzll?=
 =?utf-8?B?OWEwaW9XWGxNYUN5d1QyMjYwOUNBSk5pVU1iTU5TMjVROUhYUU9OYThTMmJM?=
 =?utf-8?B?RHI3OFJFeTB5SzhmSmRiMWRpc3JQWmlSYmtvTnlnRmJCTEZ6NVllbHdnQWEr?=
 =?utf-8?B?NElyTUZDdGk5YWkzUkUyTnhoKy9ma2ZHam42bFBVRlUyYzVHRHhGYVNKN0Y5?=
 =?utf-8?B?d3hMRStTSXNnc1MvMnlWOUg3bWZ0aVJhMmROdEhObUF6ZlNlTlFmSlNMQWtU?=
 =?utf-8?B?OS9xczFhUGZNWHl0cHhXeUR4bEFTQSthQ2xickpXdGhSalJjdElPUHRRTnpn?=
 =?utf-8?B?QkFwaG1KTTczcFg2VTFsWjhGLzZNVnI1OC9DZ1lKeFp2LzR4bVlsd3BQUVg4?=
 =?utf-8?B?TnRvcVBwM3VvTTYvSVM0bDBRVUF1b205NGZndXdXaDYxTzdPaWg2ZzBJQnZB?=
 =?utf-8?B?bjcvR2tSYXN1cng5WE5iWFlmbTNUK2xIVmNpUGxWODcwaTJUMjRTOENOS1di?=
 =?utf-8?B?WmRTL3ltdzgrbTlkSlAwTWFNOXkzRHFMMThDK2xHY3I0VW9WczBhQ0JZRnZs?=
 =?utf-8?B?QTU1dlJpV3ZidHpVNnArS1VIcHJyRjRZeE5HdnUvYlF2YmNRTXNVRnA4bWg4?=
 =?utf-8?B?UEh1ajI1ZU9Iam45dm05Rit2Tkc3ZEY5ait2ZFArd0ZKODgyNlBBQWVMbFFS?=
 =?utf-8?B?azJKTWxQWnZ5Myt4SUVPeFJ1Q3YrdWxqNXJsL2V3cFFnYXlmU3lBRnNuNnB2?=
 =?utf-8?B?VG9hbXcwclpSajIvRmU0UHF3ejZPaWVpbVhuRkRvbm9KblhWTUFuSngvYnpG?=
 =?utf-8?B?Q3pYaWJwc2RPczM5aStmdGpUNEtOOHdsYzRPMmVHMVo0QmkrUTRNQy9yYktn?=
 =?utf-8?B?T0dWeDlqSE1LdmppRk9FUktMa0pJaDZ1dE1CbWk5eTB6ZkJNME8zZ3RQUE1j?=
 =?utf-8?B?aWI2dDBQeFVBT0lPUFE5aXJjT0VxR0toR0hSdTR6cVVWNUZYbUJ3eEQyczlP?=
 =?utf-8?B?WnBVR2Npa1E4c3ZnM0FCM2hlMEhVMXFMQzdlQ0JOTEFOa2RYVEhRTFgxRHgr?=
 =?utf-8?B?UEtpN0I1VlpwWTdleVpFTDgydmxnc01rQTlqdGxhaDlVTHNKZTRmbitQem9t?=
 =?utf-8?Q?c3ynHWwNpR9b8cnKABwxNi0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1de0df3-82a5-4a13-f5af-08d9df56c1d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 16:29:56.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN2EYxI/uBDAEW55NfEMvceUfxFmWGP3oozhXh3UoQJwSoB0xg8DidTGOfr87ia0c/VGoLL6s42vLNTooLUfdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2930

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -391,8 +391,8 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  	memblk_nodeid[num_node_memblks] = node;
>  	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
>  		__set_bit(num_node_memblks, memblk_hotplug);
> -		if (end > mem_hotplug)
> -			mem_hotplug = end;
> +		if (end > mem_hotplug_boundary())
> +			mem_hotplug_update_boundary(end);

Can the if() please be folded into mem_hotplug_update_boundary(),
eliminating (at least for the purpose here) the need for the
separate mem_hotplug_boundary()? As said on the previous patch,
I think the two want folding.

Jan


