Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E84D11E6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 09:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286592.486163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV0R-0008DZ-HQ; Tue, 08 Mar 2022 08:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286592.486163; Tue, 08 Mar 2022 08:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRV0R-0008Ar-Dj; Tue, 08 Mar 2022 08:15:43 +0000
Received: by outflank-mailman (input) for mailman id 286592;
 Tue, 08 Mar 2022 08:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRV0Q-0008Al-5B
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 08:15:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17be3cb-9eb7-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 09:15:41 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-h3A88TbbPbqlZlp9j1WKjA-1; Tue, 08 Mar 2022 09:15:39 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6294.eurprd04.prod.outlook.com (2603:10a6:20b:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Tue, 8 Mar
 2022 08:15:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 08:15:38 +0000
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
X-Inumbo-ID: f17be3cb-9eb7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646727340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1s6mjjH7R8wg503B6pqhzr81HIXl+9NtbdwV2yhnIg=;
	b=LhagFGw9xDTKsHmxNH7TNDm3OQi7A9L28aHkU3BRdgJjoZZPporu3MCK2LTwnUPSsoQPVd
	hgzXX8m9I0fPbFe9aFn2T2FrSDE0CyRJQrkrVKhoPcQeRmb6lgtyXGVzrq6vaQokWS7wUt
	eUmOLgFAYGLBgrd5aHN7zFNQ/ZjAw/A=
X-MC-Unique: h3A88TbbPbqlZlp9j1WKjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhtA1B4gj7hzXngsYzu6NeGToxyTa9vxMxhUhHqU5woEeiC0u+IvhSBBbyOjDjSumeJoLGZAUSuuoQOUkZlgXXuEF0hIJXEoGdwI1E3SkuvNx1U+U6HNUJ8Vz9GTadraXjlLerl5/XcKa2XgSEaszy54Ba8BwznUQbTTDy8E7TFaO3LyySuJUYWsMehFcOZS5P+PsQpjPkCpvdzk3E/fSUSd8FFx0xAZ4++9PcBs49sw2CXmJVkSnJD1qGvAfel7nV97cq9DA/SEAy8UKcNweMKa1D5Vj+Nd4OF3SFGz58GDzbXkENJh+idjkIiDqphJuSHiSPaWwvdMyLjut2tAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1s6mjjH7R8wg503B6pqhzr81HIXl+9NtbdwV2yhnIg=;
 b=fpLCTemt12KKu+ZZnuaHkrOGOx2cLrUysqoqq2Z9NaM95BbIAbnJk6OrEasXlRoXNj48Ioh2Qmdu2vzt6On0uqwiU/dmtIcnP1KE+t6WfD5Ibf5m/3u0zAB/oTNIqnT5kHPGAI8uJsCaHZDaNUstoWzU/wMZFHQYUXoMKYSz4PKA+jj87bnVvuyxyMjw0AF/ze0HzkDz6+dOGzhnd8HRm8gTFbPuM5qV/m5O2KQVh7bzglkb8aRbUaklATUFT/WST55B8vUQHGhcHRnIg+x8xvxqjkf4oitS6pzKuWusx4UMLGb9RMlfcShoM6UA7mxYMRg4NcqOBFvi5w6zeNKrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c3d9a1db-bda0-22f4-6733-11dfbb1bebfb@suse.com>
Date: Tue, 8 Mar 2022 09:15:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] x86/kexec: Fix kexec-reboot with CET active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@cantab.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220307205313.31247-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307205313.31247-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00f4f8e2-f486-43a6-dff8-08da00dbd451
X-MS-TrafficTypeDiagnostic: AM6PR04MB6294:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB629453ACDADC0756C4CC4666B3099@AM6PR04MB6294.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZXP9lG5AW/cq6frzp6PmWbKpQUj14PH+La6FWleX2NHNdIBWM10RrrwX7gHRrcHY4iTV+ryCYoLFQSvsWk588t2Yf8pA/s7t/puSB+TFMobpKZP9/Mi3vE/toK/nuZJVGUgXtRN/4A/EPNtSp0Ly1vXrcSQWiGKga0GnvGKo3iJLqHPzNaWcYjXZmym2/hSu8noXbtMZi+YIMnM8tqpvjm5vOuzinTFxMN1tO9jM20hdN7Ak2/hrdu/hDN1kgucQPxq0KVQUp31lkHQxKvb0mGYVDfcdDkQ4LMd4Bio8laUVcT6VgySQt8gzoBhTM8h7VdPqBMY8xwGHLZYrhCcGpzQHkLw1pabKweZ2iI4gxdlYbqWMj6XG2Z0/adrmwQ7jZQTFbY1ucWCr/OA/O1yX0WYaaElrtc5jCc0EPqdh5eIy/svE6eSpn6ePkHUxet+0k/UVehdFtiFMXLPUvUxk9fz50z6CunLLV9au4lgWdlhInwUwSmH5KXPzBrPVnAWANImj7uSTiHx58v0IamuETrLEKTsyT4vhadPS6166bVLWbhrRl7BEqioMDh86I533KqJFt0u1Opbjs4BxYYmIE7LG7/Iz9/VgT93AsI21YqwPLeepL1v3uM5V0NLLaxhhy5Y8+jaVnyWUCzso5JkIMhflwwDVQyYPPL7CExOECGmIfSv6XIi0PuHbNL0mP+4ZbrOq+S8DpUjA+r/AMELDcq13RMO0NAOK9g9DrchnX/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(316002)(6486002)(36756003)(31686004)(66946007)(66556008)(66476007)(8676002)(4326008)(26005)(83380400001)(5660300002)(6506007)(186003)(2616005)(53546011)(8936002)(4744005)(6512007)(86362001)(31696002)(54906003)(508600001)(2906002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2g1N1pvc2JQUEtuUkdDbzYvK2NWbWJzYjZpbEtubkY4SUR0czN2Z1k1N2tB?=
 =?utf-8?B?YXdvNzFRV09tbWpLcVlKaTk3Y0p4RzBZVjd3T09tNlpDSVBkUW9TQm1BeEwx?=
 =?utf-8?B?dzhrWC9xalcxZHFFNHZmWG5KVGEvN0gyOVlFY3lSK2tyVkpuNjNpSmZ3VFFt?=
 =?utf-8?B?R056V2Vxbmh5ZzhuZ3hBcGlxYjR4VStxV1ZRMkJQMnZQem1adVdqV0YzV05n?=
 =?utf-8?B?SmljVUJsZC9UTjhIK1lUVnBTN0MxSnhNVEpvamM5NGxGVTNPZzhPcGJNSEpv?=
 =?utf-8?B?aFRBTDlXalFCVnMvMnA1dk9WalNaN0NBSXFGM3lTSEg5M25YZ0VlTlRKRi9Y?=
 =?utf-8?B?aVBXZXdhdHFva3lwMmlKNjJjdnhLRllvUWp3UlI3QUVQWjlMMTNDY1luNjlR?=
 =?utf-8?B?MHUxUmhCN0lFUmNUOXlySjNUTGZiMENjU3ZaQWozZ1NoaXNNU0F4aFg5Q3lH?=
 =?utf-8?B?eEpCalFqamdxNzNJVGo1SHJpUm1DUTMySzhDWkRCUnBkakpKRFRUVWlBYXZI?=
 =?utf-8?B?U085REFFY0VXM1JiSnFoZDFXNFk3M1RPSE5iOVRBODU3UWxpNHdLWXJwMHFE?=
 =?utf-8?B?anNZOGJDb2RFRm9TZFlyZ21pQ0dNRzRrZFlyRWE2cnpyRmlaaW1kQkM3SFBl?=
 =?utf-8?B?TGdOMHFOZjc5WlhSZWRQd1ZOT201c3l0cGQ4VXdWV3M4WVpsc0ZlV1lpUDFz?=
 =?utf-8?B?Qy9jampTWjAzNU5OMWh4UnFVZlRwV09nbG9ZQ3RhK29PZm5KaDY0d3haYkN4?=
 =?utf-8?B?cGRkZndHd0xIZTNKOTlmTHdZYmFMYlVLbit6WWlVd29IYmZKL3VKdFI1aWRt?=
 =?utf-8?B?cWhGK0pBSkZJV1dXRStHcXdkd3VtdE5oa1Z3R2UzVlNXS0RPTzhmNzJHeEFN?=
 =?utf-8?B?OXpUWVl1cDZHdmRmMmhreG5BV3hCcDY2dDY2RkhLYkZEdlNGOU43dktndnZw?=
 =?utf-8?B?TnBDUms0N2pCNmF4c0dsWCthSzB2WFg1b3crRzVMdTRnc3N3QWU5a0FXYzdL?=
 =?utf-8?B?VVp5aHFsUlhwSzBlK0Y3bzYrU3lVNWFMckkvbEx0YTJ5MEl5V244anNZUGhP?=
 =?utf-8?B?UkNKcjJhaU9STmNhbDJKdCt6WmlTak9lOHBGaXpLV1Qza3EzZXBtQkM5azF2?=
 =?utf-8?B?dThmQXllQ05xOUFNdldQVW90ZGpGSVBxdktqSjVaWXFUV3NsS043Q2p5bU5C?=
 =?utf-8?B?MHhVNHlHbFFNQ1hoQXRIMm1kUlFCT1NianNWLy9BRk1mSUw3UnJEQnlzUFpL?=
 =?utf-8?B?S2NQV1NVYllGay81WGJZMVpIWHhybW5oTVZUcVlaUHJrWXo0dVVpU3RnN3Z5?=
 =?utf-8?B?c3dEUUx5RE02ODZkYWEyditUN283QXMyYnM1RFdoVTRRMkl5Uk9YVjE2a0d3?=
 =?utf-8?B?MS9MRE11VGNHY2xPd1JLem52bnFtM05BbExjY1AyRVBpMks4QnREWWc5Mjh2?=
 =?utf-8?B?VzUxVnllSWNIR0dUM2UxOUpQa2JvSzRsWUt5WENXbmFUSyt0RFdYQlYzcDBh?=
 =?utf-8?B?UlV3V0hmNXhLNWNrRW5IQ0JFTkR1NlZZcE9DTnM0WmM3eUZsZWJaVGJUM2w1?=
 =?utf-8?B?VWZEK0psRWJsTnZlR1BFMHNGWEZFOW4vbzBia3Z5MXlNNUFhUHdFczNya2hQ?=
 =?utf-8?B?QjFBZTNmc2UzYUR0MUkrdnB3cGhxWEpKdEwvQkMzaDlvcGdNS1JjVGVmdGdx?=
 =?utf-8?B?YkdsOVZWQTJXY0hPNnR6R2w4NTJ1VWorQ1lZQjU3YkJCZUNtN0R2Q0hCRzRt?=
 =?utf-8?B?bHRwMUk0b0kzNy9tbk5HbGFIVWpCRERGWjlUNGd3L0xlblhSOGRKdWFjV0tJ?=
 =?utf-8?B?RkFRdTZ0QVh0aVROd0lkbjIwUzkybGYzS2hXUm9jVkFnUHh0YWJrcHFmSkhh?=
 =?utf-8?B?TzVvdzA5MTY5Mmtub3djRTRuV1VvVEZlS1FlZE1jUEFoMWRSYmtpYnhwMm9H?=
 =?utf-8?B?VzJZaS8wdy9ETUlkWVFwR09uaUErMHZTS2VjbEZJdnJDRzdkdmlnZ2ZUR2hM?=
 =?utf-8?B?QW4xVlRCTG5oMUM3eWJCQUsvdk1EVk1GWUsrMFYwV1NsWVp1bmdyTEd6TmVS?=
 =?utf-8?B?N29PMDluNnlYMDl0SEVIZ0tjWFlNOUZRMjc2ZHB0cmdhTjV5MDJrcThGOWs4?=
 =?utf-8?B?cTZuT0FMYllRT29KQm1leTYyNitDZm1YQ2NzL1ZVY2xyNXdBZXlNbi8rMndN?=
 =?utf-8?Q?Nr9Lmk05f5YnSwmHA7a92LQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f4f8e2-f486-43a6-dff8-08da00dbd451
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 08:15:38.7569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+DrAxw0Uc9PAorn3NoeTViKiAi0ih2N+fCql5qnkI4cYfxdp2ASWyfMio+cjiPUck0sEp4OOTFjnBWyGX9Meg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6294

On 07.03.2022 21:53, Andrew Cooper wrote:
> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -156,6 +156,16 @@ void machine_kexec(struct kexec_image *image)
>       */
>      local_irq_disable();
>  
> +    /* Reset CPUID masking and faulting to the host's default. */
> +    ctxt_switch_levelling(NULL);
> +
> +    /* Disable CET. */
> +    if ( read_cr4() & X86_CR4_CET )
> +    {
> +        wrmsrl(MSR_S_CET, 0);
> +        write_cr4(read_cr4() & ~X86_CR4_CET);
> +    }
> +
>      /* Now regular interrupts are disabled, we need to reduce the impact
>       * of interrupts not disabled by 'cli'.
>       *

Besides introducing somewhat of a disconnect between the comment in
context here and the earlier local_irq_disable(), is it really
necessary to do both actions with IRQs off?

Jan


