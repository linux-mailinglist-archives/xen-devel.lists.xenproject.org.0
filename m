Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D16496000
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 14:53:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259351.447577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuLs-0006fO-FP; Fri, 21 Jan 2022 13:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259351.447577; Fri, 21 Jan 2022 13:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAuLs-0006ch-BP; Fri, 21 Jan 2022 13:53:16 +0000
Received: by outflank-mailman (input) for mailman id 259351;
 Fri, 21 Jan 2022 13:53:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAuLr-0006ca-91
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 13:53:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a125851-7ac1-11ec-8fa7-f31e035a9116;
 Fri, 21 Jan 2022 14:53:13 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-xSBKIh0zPYald_8Rhh-Zwg-1; Fri, 21 Jan 2022 14:53:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2429.eurprd04.prod.outlook.com (2603:10a6:800:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 13:53:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 13:53:10 +0000
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
X-Inumbo-ID: 7a125851-7ac1-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642773193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmphCjcBoj0WxajIE6NzK2YkZY6RABI1X7Hi9dizdMQ=;
	b=jzYIId/vLeUOmVii938qdFz3KU0Uo7yhJ7dfVFaWQ7e8HF+NcollultPsVnZIEvsifxuzm
	xRLVM7Iuw3YqlzcnmK87cPCgfLu7qodbVwg2gtmf7gTQB1j+fBV5W/vT7rvkz5IeaCaBuJ
	9q8CgbAe+0HoNLh2Lbn6bAbwKYKD5CI=
X-MC-Unique: xSBKIh0zPYald_8Rhh-Zwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCJ54Dp6aK6COC18LZ264P6eUe7FHVn2Z/cIub8HuLsBw1ZRocSIcmcTRFYXyTLdcnhn8Komd0kKPEJWuWks2RTJchZvRL5vumMLKGezJMeR80zGcdiKnY3uvlS+xplgesKzkHpZASHXmyEyS7rrZDLAAPDaC44pNBEA/1bsxd25AdK92aL7p0rDlipwb+SdjiVYcSalj+LXRWemA9bB7DLUxogvYTL9GXd7agWtSePPrDQU/nax2dbLSGMYRBrV8rCoHLiZ6/e8g7IFZwBoMd6HyMrzIrinRWNPmIlQZRjGLGm1d2SIoMmJgEsDa/rBOQfoRpI7UT2KcITPOhCwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmphCjcBoj0WxajIE6NzK2YkZY6RABI1X7Hi9dizdMQ=;
 b=bFjJU/CDBohUosI9yUG7b9X4YqZbBQkQ46AOo3qnwsvcpIm6rTwbz1dvbAIT+Hb75WTfqpgDSm1nq9o/0WukK30bifblRCWr4LmW2CAvA48AilqTlxOc5lKEtj+nhzhVr/W04Xu9FnM5IpS3l+AuJkBcxXQhmUmG49cgcY2RHtAd7TUYi1/mlKtVzMlo0uZmlQF/2OHdPdRSmY7A6V5+3EEmMcrM07Yx54wo8+AYDByP2+7o5C12w/ZXtE24QWeFc5PWs0FWqrysnDOnRl4FU2toCASv84zzixGHduBjeSa1atZb4oCLIaon2Lfv2KB1K8RthGDKi5571xFboBOLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5031a5b-7be3-814d-27ce-dc6aea424c81@suse.com>
Date: Fri, 21 Jan 2022 14:53:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/vmx: Fold VMCS logic in
 vmx_{get,set}_segment_register()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220121110834.9143-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220121110834.9143-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0100.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::41) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa176e91-5728-4f04-ad3c-08d9dce55c52
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2429:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2429C48335DE910ED9E1C35CB35B9@VI1PR0401MB2429.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	loowa3ERdOWR8VpBC9aiE+waNNYskp4u2CXmXcwAxLwhuQcvQTZIlL5ROLgMjObyPjMiYaAObMkAYbb2SsKjm5VaZigeJ99TYhgLcxF5naIw+ZwaYa2Q4LiLzX8bg+3//ld4vlJjO4c19N+EqZA5551J3IGR44KTbrpYYbq4C3JFsPY/ria4F0fsIB2N0BQOlsIpYPswVin4Lwn0puDgVXrUcCPpVtp52HFy0g2BNIamL3RkQn9g1jHErgoDWc9eLbO+uz3RbDESWQfZ7xLwJFHsME7TCsdYL/xZzYNjijqy8VAugqkYPUjEHjJxC6djKxzvy1P2KLDZqjpYM93OJl/ymP2YDAam+tHCTiJ6hgAEb31nsuyNu62F/YE3OtZgIYpzTILwGpXznnyQ10fHpCY97Af/a+KJ3wIQQG63P0gEFlO3NAq354VvC9e2XILvdbypOPxg72Rvhx6C/dtl8qoMO3P8bFHCnP1BAWDv23gng7LtGhieHlRWqyT+6uKNdlqKnuxzP/BXk08wLlhkoXN/5ZaexHoClAxwxKn6UPnmsdXlIxL2RE6DipD8nTad08b6BVdSaWE3Ue6M7UH7F9QlcVptmyTfX9mLTNFNwFRFyWnHghb3UREk1Wl/kfWuiDGu7jNcgcI1Az5wcb8VYSzP0zd8kjFLsNgUs58jakkOzeiT2wNU0RRYMn9KO6h0kqmZcnU7+zBpyxLwqULkqmq/cV+ADd/kbycgWfQ5m7Q5kNhCT6YbwgPrSskqjuNH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(54906003)(26005)(66476007)(186003)(316002)(38100700002)(66946007)(508600001)(66556008)(4744005)(2906002)(31686004)(36756003)(86362001)(4326008)(31696002)(8936002)(8676002)(83380400001)(53546011)(6506007)(6486002)(5660300002)(2616005)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmtTWk5QcjBQc1hiMzc5N3BtbVAwSytLd1kyRUN1RlcrZXd3WXd6YXFEZWk4?=
 =?utf-8?B?OGY3Vm1aUWZkVU5sZFRNeEgweStxbVBMcmV6SFZ3ZGFMM3c4aFRpNmtkTFZN?=
 =?utf-8?B?RkxiMlpkRkdZTDZuL1pLS3NYSER3WEpSUnVEandDN2dPRmtTYkM0alVJTEgz?=
 =?utf-8?B?WjdQOVBlRzNKSUlRdWNRTmlyZk53ZTZCVkJHQVhYUzBuZmFudU0vZnhGWXJ3?=
 =?utf-8?B?T0d6T1F6MWVjdWx2Z3JrNTFzN2RtU1hqMDdvSjdVNlRwV0tBTUg5dGI4Ymtt?=
 =?utf-8?B?Y3BiTGtTK0lZaitUU1JNT2dSVnljWlVxc3MwRExpZEtjMFVMdUxKV2NoSHNU?=
 =?utf-8?B?SEp1V2tuU1FiUkNWcHN5UHRYYU53Q21ud01MdHo3Z3JPejNGeFFkTUJNcFNq?=
 =?utf-8?B?eEYxd244d1ZEMnE3RGE1NTdObmZiQXoya3dzc3pzMStzb3RQMXNYcFQ2S2Z0?=
 =?utf-8?B?WWlXRnBhd0FpVmUvaUk0K094Wkx1Ym95dDlub1Z3RCtLUTFCM0dGYjlCK3ov?=
 =?utf-8?B?WDBuVFA3TUlER1g1NmZVR3Q5dHVSMnI3c2tsQzR2UHZpWWhxbkVWVVh3ZVVK?=
 =?utf-8?B?Wm5HejBJbGZiOEJCK0Ntajk4cEhPeSsyZVAwN2lRZm1TSXRrZkd4Z0x1a05T?=
 =?utf-8?B?MHBlTnhKb3oxTm9GaHNad0xwalY5REswZUJMWjM4U1dNMmhLQmRKNHNiczBy?=
 =?utf-8?B?bVI5QThZZWRCMHBEbTI3aDNXVG55RmVpUkpUT3N6ZzJaQjVjRzlVSUFtMkx3?=
 =?utf-8?B?amszMkpoV2ErdnlxSVRyb2RoaXdoeVpXMHlVNVk4cm5nUG5qTUJ0MWhqZ1hO?=
 =?utf-8?B?aDd4THpFcXZ4ZGw3eFk5dGVDRGlzMWpVcC9RNFBVeVRCUnJEM3NIZFZENGdB?=
 =?utf-8?B?SWNGZ1JEN2gvTm5sVXptTGxaSmx1c2Y3QUxxQnNIWGhCcjJpWEZrNS9jaWY4?=
 =?utf-8?B?Wmx0UXQzNERXUVZmT25UamxOY0czMmt5UklYdDlWcWltcjdqcGh6UzZxM2Fv?=
 =?utf-8?B?L2RSc3ZKUHY2YlBzQmxMQUgra0toQzNSNjdRYnlUZzNyWHVDOEZNK2Q4Z21n?=
 =?utf-8?B?Qit4c3Q2MDVtNFUzcXJDS0JpYlFyQVJ2K05NRWEyVDRuamNXNHVVVzdGcFFK?=
 =?utf-8?B?cFhyVmFBcW8zMHd0MmFsK200aldQUUp4QkVLaTlQV1BMUHNTaE5IRkMwQlN3?=
 =?utf-8?B?R2RJVUdlQS8zMW5rUlBuVXpMYmhYbTFkMjEvWXVjMkIzYkJUN1EyTUdXSlUy?=
 =?utf-8?B?S1NuZmduWlJjWllWdXB5SXVvbjdGRmJLR1dSVzBZWVI5eEtqbkMyTWVSZjh4?=
 =?utf-8?B?MlhzN1JxczlLaWErTk9FeFNoVzFnRng4N0tRZEVJbkdtMGhzbUYrWjc4M1BD?=
 =?utf-8?B?OHdHRmNoRk9JVW44UzNZa3BhTXRiaFY1R1BscGpMa1lXL000c08yekhXM1FF?=
 =?utf-8?B?RWVYUjhSUVlRM0FUVUphZ01MaW13cm12dkNoSG5nVDFRRXcvWWdkZXk2dkoy?=
 =?utf-8?B?OEUzRnlaR0RITGgrTktuTnFVdkUzK1Q3K05Bai9NTnRQTTVhb3QrQ25PU1Fl?=
 =?utf-8?B?UkRiQkFIeFZCL0dieTVwZHVvZnZKOVVTT2ZPRXI0cUhwSWFqMTlyeWJ6TzNU?=
 =?utf-8?B?ZHdUU0RnWmVLZTUzMzA3Qkl5MVVTdUNweWdoNnVCbUxZMW5BMTFuTzAvUFNp?=
 =?utf-8?B?cDJjTENsR0RLMGh6Rk1YenlNUkVOQ25mZ1BvLzlmVXNtb1BCVU1iV3dBZTNV?=
 =?utf-8?B?Q3pCdHFPeVhiWTl2OVMwbHljSWMvNE1nN2UxZFFQQkU5blF6Q0w3T25ERnZY?=
 =?utf-8?B?di9RbGg1Z1RsQkM0MFBzRUV5L2VIL2dneWRSVkRXdHQwUW43UDg4QkpKYUx6?=
 =?utf-8?B?MXNwd3o4OUhkYXdKNU90eHEvS21xRXFncEFoekNpZzVVdVpYQWc4VmJ0WWRy?=
 =?utf-8?B?ZG81Ykh6TDJYczJtNCtkb29Vb3IxSEw0TVZkQVhEeFBvbzF4Q2J2NEt0aFZG?=
 =?utf-8?B?anNtWElDSjJ2TzF6dDhCMWFEVkFwNE5JdHFPMEpMdjBQcjJXVHlJZ2hUbEQ4?=
 =?utf-8?B?RExXQklxaWJlWGVJamdhaUZRVEJ0QU5UdTNiMGZ3MGJOQUk3SjROcFBQa1Jz?=
 =?utf-8?B?Z1V3aVlJbytVN1VsOEU1UzNNRGJ2d0FxRG1odFVGQ3hlRFN4YnBFS00yYTVU?=
 =?utf-8?Q?VZol/oYv+H8t5ZnAXCC6W/o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa176e91-5728-4f04-ad3c-08d9dce55c52
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 13:53:10.5648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YFFAmdEKVMOlRIPnbhUkWGJtP6yEGM+TnCO6U8vAw2cJUtkf04wW9DRrT+VLnNE3InP9FysHuhlxAxl30UDDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2429

On 21.01.2022 12:08, Andrew Cooper wrote:
> Xen's segment enumeration almost matches the VMCS encoding order, while the
> VMCS encoding order has the system segments immediately following the user
> segments for all relevant attributes.
> 
> Use a sneaky xor to hide the difference in encoding order to fold the switch
> statements, dropping 10 __vmread() and 10 __vmwrite() calls.  Bloat-o-meter
> reports:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-433 (-433)
>   Function                                     old     new   delta
>   vmx_set_segment_register                     804     593    -211
>   vmx_get_segment_register                     778     556    -222
> 
> showing that these wrappers aren't trivial.  In addition, 20 BUGs worth of
> metadata are dropped.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


