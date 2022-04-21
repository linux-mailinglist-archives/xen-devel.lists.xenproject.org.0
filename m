Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D850A06E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310147.526815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWa2-0002Zt-Bo; Thu, 21 Apr 2022 13:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310147.526815; Thu, 21 Apr 2022 13:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWa2-0002X4-8d; Thu, 21 Apr 2022 13:10:42 +0000
Received: by outflank-mailman (input) for mailman id 310147;
 Thu, 21 Apr 2022 13:10:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWa1-0002Wy-Hg
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:10:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 715ec16a-c174-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 15:10:40 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-MNNobX0xMWWrssbHLp986w-1; Thu, 21 Apr 2022 15:10:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR0401MB2676.eurprd04.prod.outlook.com (2603:10a6:203:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:10:37 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:10:37 +0000
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
X-Inumbo-ID: 715ec16a-c174-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XwltpXNGUfKmNG4DGrHU00pL2l7vesHzISdiHd+xR+4=;
	b=CVin/TLvtpZH5Z60kY3+rreU8Vi7MOMsqhGZ+/BmRGq19YfeVg7gR3zS4sLtSqbXbWkwgf
	gv76PHOm0Jit4xF2Zuk2xfYNqSyCdPSt+s+7WrrXkoJ9aoaNMtgY/0ztZKk7dYkWRlA2bV
	Gow6P3/NtOXOWuJSS8DXsziaxpCJGeo=
X-MC-Unique: MNNobX0xMWWrssbHLp986w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=le/J/KGTFSHr6dwWSWO9Mxa7hYCYqDr+uMhPeKQFXQBV9eHVj5sVnRjjzVPWFj8qZZqx32t5wgAvn3iWwrwnTXtfirFYXdfD8Qm8PD/7/AaKSfkrXrfv8WIsvAlD7FK3rPS2T90VSPH6C/AJkWTa+mB6v3+61H+G07OoRDbTBmo+MyqChuw5zRbI9sb/Kxh1N/Ft7cnblLRPgJEP2B8gfhmFeMAuS+XDh7zNAHUp4dGK6jLshbs4n1bUun8kCOpVd9TPlOjdXuAlxDap1wVieWLjd+BK0sDZ7Beqr9vs0ivCtTay9JKEswZNyZfrIDIYiYcbMOuLiHaICdPEfZqEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwltpXNGUfKmNG4DGrHU00pL2l7vesHzISdiHd+xR+4=;
 b=XOOMBuczthkKG1RnExTIsGVyINmz7kFsKOv4X8VH5T35RSRXUUv3D3ct0CnoJ9IKvZUhMyoj+YIBs/Bp5HoLCzv/VAwMbj7X7jeG5b1qDPk4+mpDKHxFQqYXqO9oSrhc5RDYYaqtiV7ufubE7B5iqmVoQCme+Kqv9IztEtoTVoFoGuxVjMsOEUpd0YQanYaE4BMyPW8gQ1Z9rTyzBXa/hwAXJC3228XEmMJ5GjhdO0Yvmke1kfH5j9RMqVee+9GQtF4+69kzAEmqH6nJMOiKeM+rsYgYcBSBSZKIabasZElWK5Llt1yUu+/6JVbKLiIc+ANag/R5I2MQsKaA5Xy6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e330e26a-052a-c75a-92f1-fe7f022b6c35@suse.com>
Date: Thu, 21 Apr 2022 15:10:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 5/6] x86/debugger: Misc cleanup prior to splitting
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0107.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::48) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52ae3373-ee16-4464-f2f4-08da239853b0
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2676:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0401MB267649F116E6E735E4EAD318B3F49@AM5PR0401MB2676.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TxuDd9Tni0NmFFcs7rgEDHQ+cxQc8mCPUkHTV4hc+RiWK5HVqkwUjNO7hshW47kUrCROjaUPEMF4rJxyPYeDRZWOka7Ic+IQo1xwof3uhitUXbCix4vT+x3IC3eDSyJmgMgbSo2u3hwzC8k3QglLwSkeVbfL65iBb1t2Qu/8bmYjTzdQo+w0eyjIcnpjJealNc0R+I4D+gpeRQQRQZfsEe37pURluqtZ584Q3APqUX/8UMuE03maWrAmoIBbhswXMjW7+VxFSC+i2rvCnT3KaXiVZguOvE3Vipbwa5zIDtTP4n5wfd+EW0j2hr1E74Pw6WCXMdTOzPNKCIiN4iNizKXYZR7R8O1jxzjL1xhnL14IBAJAvYMXMZ0RI1DcfLvXqgxp5Z/fkUElKKIZTNPsbV2LXnCZkEcaUmhukrwGfAsAQOOHtfVKmmDjicWj1rHr23G6uYrwNQ+0+fEjtW3rUO7A2xSgSyoLaoDfNA108yi/TFxD1sbfrtUG3+De0HxmP9MZIMEj9JPkhvsPgUqJ1g3dswtGW8XqDKnVuSl+j8gCRaFWVmKTgyT4EH9anDy5SVJFKFYB0FVb/cW4/XyfXewXw1G5ydyqLOsoZBDawlV7pzxzRe45wSq+X6me91G1Nzz7tKVZmsw5Nl8coJCLdwdylcY2cuYKUXFq/BW/SKDIQ8NglcRuNjY78VvFDmtpDJjaEXh4kXFDMsldQmfp6ZiUt4T5YzI+9/suJ9Ya5MJlh0yUiymrLUKhc20jWjW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(5660300002)(4326008)(54906003)(186003)(8676002)(26005)(6916009)(6486002)(66556008)(66476007)(66946007)(31686004)(36756003)(86362001)(2616005)(8936002)(4744005)(53546011)(38100700002)(2906002)(316002)(6512007)(6506007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2dQcjU5dzliMWNHZkVIejhGSTlzY3R4RzdvODZEdXZZdm5iaVpyV1lpeXNh?=
 =?utf-8?B?YU9OMWNVOUZwczZRNi9uSk1RZnNkTjFybGx2TjRXWHZCRnFjelNmaStlZEFQ?=
 =?utf-8?B?c25YdU9JVkRUZUpJak9idzB2NjBQZTNBTE9WUEhabVkwZFVwMjU5bWRURVlQ?=
 =?utf-8?B?dmpXOUxJQ0MwODU1c3ZJNDMxRmRnaUhXc3hSZW1DaDd0R2FkY0E0M3hUeXcv?=
 =?utf-8?B?RXIrelNmRkUxc1JiblJQSnprS3BUeU0xQzFON01HSnIyeWVkMElQWHVqVzVD?=
 =?utf-8?B?YlhVc1U4UVhSQWtwWVQwdzNaM1F3alF0WVBYYkZBMEcvL2dRdWJJWGllbnIv?=
 =?utf-8?B?UGE4dnRYcEZXZFVtSVpIWHR6dWRya2M4emdxajF1OVpLOWxoZ0JNMUpHaHV5?=
 =?utf-8?B?TTQvdHFiU1F1dDdJd0FzRy9OTXFOVXpZdy9NRnhEa1RRRTVPRnIvc05CN0M3?=
 =?utf-8?B?U3BsN1dSV1hUYXQ4NUZuczBMZTBDb0Z0YUdJdmFYLzNGRDdNRzJPRy83UW9Q?=
 =?utf-8?B?ZFQxUm5FOG12TmNXQmFIZzJqZVl6WVF5MkM5dUJHZ0h0ellFQ2ZORjV0OFFk?=
 =?utf-8?B?Ry9mZDJ5cVRxRFcydGV2bWRCYk1xOGhtZmF5QzBxY21qK3JXcTBjSWd3NWZD?=
 =?utf-8?B?UVVvQzJhYzdDUG81RUFCVjdLY24wM1BrVVdNOVErbm9obXpYNzRaNHVTTlow?=
 =?utf-8?B?aWFycTZYUHh3SitrNzc3WmJCZlV1a3FSRUNEWmQwVFh4SnBvM05PVkx4bkNX?=
 =?utf-8?B?ejFNR2toZUJCUnE2Vi9QM0JzZkNwYUhIZHplQ2NwWDFxeCtqbUoyRjg4UGdO?=
 =?utf-8?B?SGg0OUplY3RZUTMxNVplUVVHbG5YRGhjZE5IU1d4aTZSb3UweHJmY3BybjI3?=
 =?utf-8?B?QUJRU3NHcW05WHc0enA0MzBjOVpIcTlzS1BRcG5wanNlNEkyT0JLRGZ4VWta?=
 =?utf-8?B?ZjZSU1IxYWlVRmJqME1FL3pDcHhIbzN1WGlYSjhsYVBmb3Y4dG1YLzNMeGNJ?=
 =?utf-8?B?VytZOUFRYUtwRlFkOXNndjgxUjBEaFd1RVM4c2tJSUdKSzBSKzZiamdqZXIr?=
 =?utf-8?B?RTJaUThnblBheXNvMWZ6YUkrM0dnSjRsNVliM2hOV2I2UWxDNHJwMmNkaGlx?=
 =?utf-8?B?a0VCWmprK3l6UXVybnpPVlpvcDdud29RRVJSL3hIUHZwMFJmMHdmZ3pLblhn?=
 =?utf-8?B?b1p3YzNxa2V3LzFaV0RyWG5hWEh3NGkzdWI5NUNCRU5nZ0xwYmVjNi9hQm1P?=
 =?utf-8?B?eDBNQngyMis1ZFoxbVBlMUVNb3FjTUdwd0d3ekd4aEdRYnhlcGVCUjZOOHVw?=
 =?utf-8?B?R1JZQWlMZmlBeVJGM0poWEJxblJwa3lYb3pEdC94clNjMUhVRHFsOEllTUhW?=
 =?utf-8?B?MUVQaVd6Y0pOWGd0SFd6N0xFb21uTGZWbElHemd2WHpLTmNabTZZRmxXNHNU?=
 =?utf-8?B?R1pnUGZSOU50S08wcDdncHY3QjhPMk14amJWZWVIdXU1WTd2bHZMdlY1cGdp?=
 =?utf-8?B?MFRwMHVZcjFRNzA4bGh2MExQdjFNWTh1eW9DbUdPc1lzclh5Q3lZSU9JTklZ?=
 =?utf-8?B?MTdMc0QyK0VSMnc4elZzUnZVU1ZoZzIveXFaVTVucklVT0d6bzNSUUZXUExz?=
 =?utf-8?B?TVNUUmZIQ2lPdTZiWnRtdGdLRDdSVHhoU3RjSFVLZUZZWmppWFRHRDlXTG1m?=
 =?utf-8?B?N0IrZTlqRW1OMDUyWUQ1WWM2OUI1elNOWFY0dDdkK0JMQnd0YU1Rd09VcE9P?=
 =?utf-8?B?SmYvMjF6YTBxN2lLVWFUSWN3WW4yWXlDVW9scnl1b21pZndrem1ESmlXc0VG?=
 =?utf-8?B?QnQrU1dRUnpHanRuTU5KWW44M2VnOUJQdWtlUC9ZcHpnZE9kMEp1aitqTXJ5?=
 =?utf-8?B?K0hhdXorbjdBWnNEL0VkY0VrZmZJZEs0VGIyYnZuUmdlbDNpNFpDUDNtWEZF?=
 =?utf-8?B?TU9PTWNHbDhaRWdDWThRU1UvZE5hL0YvTllGMmpTcTZRaUxYeEpwNUM1a1Ir?=
 =?utf-8?B?WnF4MXNRYUNzcXV5by94T0hheXYrL25Mb3cyTjdFRDM2VldjTXBOV0JNOHBu?=
 =?utf-8?B?RG8yUnhhUUVzQ2tNdVJQVWVGNWs3ZjVKbVN2ZUtiNkVFRzlkN1RLbjR4ZHZi?=
 =?utf-8?B?Q1pCcXVxcjB4azd2RFMrZ29uSDZiRE9UUGFtYzB6djlSUllSNFJPamJoWTgv?=
 =?utf-8?B?Mi9wYUNud05NaHZKUzRvTFlOelFudkliZXlmVFlHQ0tuN1hrMnZMZVNrUFVT?=
 =?utf-8?B?dHM4NjQyVUt4S2JYNldsOEFsVitpaHpUc3VQclJCVGNRNS9NVXZmY1ZrM0xG?=
 =?utf-8?B?dTZDbFgxaTRabDFORTdMbVRyd3hPK2FRQ0wvc3hUNXVVN0FPdXRLQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ae3373-ee16-4464-f2f4-08da239853b0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:10:37.4014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2roEmQHa7T5nHfx6/hm+twIOIO8c8knvoKqdr4lpBObNZsuUbDg+RuCUxAoRwqaKFg/oTRDkzoEGGR3Y7CB1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2676

On 20.04.2022 16:13, Andrew Cooper wrote:
>  * Remove inappropriate semicolon from debugger_trap_immediate()
>  * Try to explain what debugger_trap_fatal() is doing, and write it in a more
>    legible way.
>  * Drop unecessary includes.  This includes common/domain.c which doesn't use
>    any debugger functionality, even prior to this cleaup.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


