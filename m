Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAE46E4C4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 10:02:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242807.419906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFJY-0002RD-Rp; Thu, 09 Dec 2021 09:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242807.419906; Thu, 09 Dec 2021 09:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvFJY-0002Oo-O6; Thu, 09 Dec 2021 09:02:08 +0000
Received: by outflank-mailman (input) for mailman id 242807;
 Thu, 09 Dec 2021 09:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvFJX-0002OS-Mv
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 09:02:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aef227b3-58ce-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 10:02:06 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-e8BKpD9GMJuFf2XarmuA4g-2; Thu, 09 Dec 2021 10:02:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 09:02:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 09:02:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 09:02:00 +0000
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
X-Inumbo-ID: aef227b3-58ce-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639040526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGu1CLprgMe9Q5Hwb6tSAmfWu2jafsaNacWPAlqKvyU=;
	b=jq1hXTiEi4YoZ3workPrMXWwsWxkMSi4PKZXkUG4tPB9+NE4V73BeNJPw55lPAnQkGmIPl
	N21u49bAN5Kp7Ssyt6fBkACOyh8GZvcJnoQ8hH2IJwOLG4zi2h8SJOJnBL6bBPDTN3HwBD
	ZJYD3bIJ/B1vmURTYvramRyHD7zURFA=
X-MC-Unique: e8BKpD9GMJuFf2XarmuA4g-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSOCr4FRrPhMeFd+815E7vqdiKrmuIZUT7nJZMPHcXyemeHGA485MVunbVqW+d8wHIYSUWiyZdt+bdclQcxyksRtaqIhM3NCppUEkle7LzuXpQiS21kRr5qsr3nzlO/Dc0hzztHHsMZlB0DAD2aVdEF8SVT7THZgnPVaTmDlmwn6V25xsAYdq7L3wxSx38rfaW++24JDadfX1tmO1y+ofGDCj1OoBxSmMs6yKP94don9Z8a5j08wUPLcWhAIslQTxiRqUlCezjc5qYuqVGjbgdJTye8cm6ovFHG/9PLCZ4B6UeQXkgnLnA0KqjjKr7tcEePdqXRmOQ99dc7w0Jduzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGu1CLprgMe9Q5Hwb6tSAmfWu2jafsaNacWPAlqKvyU=;
 b=oSpuOlskMfzmBBqGjyTBtpaTL8im5EAls+VcNrOhO/IcfE7lL/EPk1021ezsZj3J/w5jEfjbIYgM7wdbR0lLqGzNRJlGW5qnK55p2ONQuJDFQQJJqTWRmniKJPFajhEVwCKbvtFKEs2MB/dPxCwfvvGsdCHe+yZRhyFKKUfgUVpre+ExaodoizFwIxAZMp4ogyBDLa7F2u2WtoyNdXfmQ0owx1bNzPvgiZvJyEBJF36Pmy/D2OT8vWZTMnb6Vs6A83Up3LfaowBGtVVmqv00mws+79XP3oOTswm2iHFDN7xXbq/lKsWiBB1SQtOe6/kjgtuASeSPTn5KXJHq+dPPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0108a556-cf03-9402-73ea-be8a358c6fa5@suse.com>
Date: Thu, 9 Dec 2021 10:01:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 04/13] xen: include compat/platform.h from hypercall.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211208155606.20029-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66555034-fb26-41f2-8bc0-08d9baf28f98
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43528019D6722860BB5212F1B3709@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bGICjtga6qHSzyBQyzTwoJH+9B11S9qngZ31a8n4fG7jxwxX3vUsn13quqs7qEujlA0FBHlQt9mm061+X8BkpnVgUy9DK2VWnT9A7xzwNL+Ak7Jh3Y9DaXUG6MhHLoSCdoBe+L8BeazEabxl8vJHnuwJ0mmjaUw/jB2KaMEPBdvuNWcb8YLZfb0EWVIphiL9goL3MsN0hE8SREJbvFo1xq8CC1Rc/LVZkMGXhS6Qost0x5V77TyhStTIeYziQ8PKgfCPDExon5iD1ZhLHg4py4vBWe6f4Oa6uzOc68w+7Rr1Yqv/92sON6pgafQcdDNgaX2Ch964iK8aqEiy2ig/Vg4YX4RtmuuOh3eGDEW3pnldls87bRUDTAgO8M6fPuVAWFZX+Sz91LXz+EQbrXA7hsZwFY6Vs8a8OBvMigX1vxbZEqrIImI7DPuArJm04VucUj1tvTXCfa0ApmfL3YnmcVEWy6t9H0ipOhcojWF13f72ermV7Jc63l7UyIiAERj4jIoFFFBKW9KxIxOvbjZCt/NaTSToAAGwVEGy9qwpUXIY/J1QGn1/Hld5UVb4AO1DSi/B3F6MMyV70xXwrWACfl6CVVj9UmG4JL38VIqiBLkwcMacAv7sZvGad8w5OgKQBSaM3u1iWdMUrTEyYfzx3Wv0gv/yZ79HUkJeoRrU8nDZfpFfnFG/NFxIbVB3dsdJUKI4CobEl6RyWh4uglpJH29C6oXqinekKXYZF7rios=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(26005)(4326008)(54906003)(66556008)(186003)(38100700002)(508600001)(4744005)(86362001)(53546011)(6636002)(956004)(5660300002)(16576012)(31686004)(2616005)(316002)(8936002)(8676002)(2906002)(6486002)(66476007)(31696002)(36756003)(37006003)(6862004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnljbllEa3JwaGRla0k2SVNXbzh2WmJwdnRIV1hDaWFlWkh0c05yYnpzZHRt?=
 =?utf-8?B?KzhpeE1QTjFXNXBNRU5DVTR6UnlVajY0dFloK21RV3JtWU8yb0d1ZE5YSnIx?=
 =?utf-8?B?Qkc0WHV6eExmMkk1S3NxTU9JM0tOZ3loYjk1NFFORWNzMjhrRXRQaDNvMkhW?=
 =?utf-8?B?S29MdVc3RVMvL3V5UGJYUHdpQW11YTQ1cTJBVnFWUzhjRFl4bUxjM0JaMWdZ?=
 =?utf-8?B?NTFHOTBmeEUvNlRxK245OXE5cXB3TXduVmkrcWc5YUY3NHNzNEUySHpBWWcy?=
 =?utf-8?B?NStkeW01RGhpN0xMUHBZT3pOUlBuUGJwb3FIUHNKRmE4N2hvTHB1SDNUb2xQ?=
 =?utf-8?B?ZHNqb1RxbkFyL1BUcDRxZ0pVQ1ZxeVZrRmk2elEzVWYxeFlUYmlmUzJWbVVV?=
 =?utf-8?B?UmswdjB4SVQ0akNFUXgzUEJ6djVvQWh3WGE5RHRuRE9kb3JCRExJbDNQMnVj?=
 =?utf-8?B?ZmZ3QWdEejdMaFpGWFhZR3FGUEptb0Y3NnhVaXlKaWs2b3JkZTNtL1NQWTY1?=
 =?utf-8?B?Q3d5aWNQOUV2eWNzNTRQNERMUEFxSnBlNm1DUlRPWThWQU9wR0ZQd1l5bFpr?=
 =?utf-8?B?QnFyeGowLzRWQ255MGM2NDhUUlRRSVJ4cENGNmdkL1dRdFpweG9zYk9iVjZW?=
 =?utf-8?B?UjNyRVNUUElXMGtYTXhYU3g4QWl6dUhSeE8wVG9TZkZ0NVdIMHFZZVByWkJ6?=
 =?utf-8?B?OGYrWVBHaHpubGdOUWlTdEE1VXA4N1lKR3ZSTHRSQ0xSSkliSXZKbTNRVjdI?=
 =?utf-8?B?MTFkNE5relRNWURxWFJLOEQzaEcrbFRxSDlzK2srbm85aDdUdVFHMEJyWk9q?=
 =?utf-8?B?RnkyNlBxTkpKOExuQlNUL1BiaU9vZS82ZEdQaXpKay9iMllKaVY0SHVuaVNF?=
 =?utf-8?B?d2RmTVlvdk8xTm9CZHRmYVZ5ZmJqVkFTNGlzR0ZoUkEzZ21iSkhzcjlsRGtK?=
 =?utf-8?B?aGo3emUxSGZEaTlKZE1qUFVYU1Zta2FRQUZDRzcxVVpFdHJWdlljZW9VM05m?=
 =?utf-8?B?YXE1bnVMVEswdnV4L2JidWtXMjhBaDhTUXhXQnkxR1FNaEFPdm9YbGs0RjU0?=
 =?utf-8?B?U09DOFJqbUJXVDFzOFUvLzBYRzZ2eERCZTk1YzJ2cy85NnhNYjh0UTd4OE15?=
 =?utf-8?B?WUEwTDBYTTB5OElQd2JyY2FybG9yWTBRdGVUVVk5bWVDMDdvTW4rb1dLdlQz?=
 =?utf-8?B?cEhIVTgrajNKcEpxNWwvdXE5L2hxSGgxWWhwTnBrMGU5SHBQNWxsaFJtVlhn?=
 =?utf-8?B?T0FmYmVaWktFN1dDOGIvT2UyNzlPS0hEd0drL1dRNG53TTlDa1NNK3dMV1dh?=
 =?utf-8?B?dVlxSzd3K3NUOXRETk8vMlBJUTRmVUpVaUZaY0c2QXN4K1pOQkozanI1a1k2?=
 =?utf-8?B?TEI3RkVBWTgrQ3QwQzVVL2h6UkY2MzJURmhpcUF2V0xiRXhEZEZtRnZ1a2Mw?=
 =?utf-8?B?ZmVSaXU2OHh2T3JvN0lTZjBMRngwMXpJRjE3eFNSekdodUNaSFdvTHFnemVL?=
 =?utf-8?B?dWJpb1VVSjF1RllrcjZ6bUQyZnhWc280dGVWT00yMzAvaFpyUWxMZkY4T1Ax?=
 =?utf-8?B?NE14M09lT2ticU5yL0h0YW1PRXh4dXFSN0RzSUVkOWFEb1pPcWZwYW5sTzFl?=
 =?utf-8?B?cmdLVVpHQ0crRWt0VTZSY3E4bWhFMENxL0UxTGdnenNmUERPWUwydkxRK1lM?=
 =?utf-8?B?VWpOQVlKMGp0bnlhU3Z2TEt2cml0T0FJTFhWcTlSUHRaYVlVSlcxT21VUUk3?=
 =?utf-8?B?ajNPalRLNHVFTTF5WkR4VSs4dW42WW4zdngzSFlVOWpZdUhQL0JBYlhMU3pU?=
 =?utf-8?B?Y0o0YlZXeVJZQk0zQkY2MFdHeXBKRlNEVy82ZE9TblJLOFlOc0lBNVhLTXF0?=
 =?utf-8?B?Y3ZmRkRtdFZqakNGTlUxVThFK0NkUDV4UFJ5MllRbUdqUE9uWHRiVzBvQlBC?=
 =?utf-8?B?Vmd2bXg5ZER4UE9XNWRQY01QdGtLdDVtZ3ZUYnhNZjRHeVYrd3BDUUlXcHFS?=
 =?utf-8?B?WkgwUWx1Rnh6OTJXTUlEMFlJU3FEbjI1NkI0VDNFenhSVnpLajJhT0ljeTE0?=
 =?utf-8?B?SkE0a3BqSmRjYnlYWWYzTVhhSUp0WHpleU1tUFpvQnJYZTJ2VFBlaGpVdWdX?=
 =?utf-8?B?N0pPQS8vdStrbWtldlZxRnNSY0VCZHRTUjF0dXVqY3Nlc3dnalFvaG5xTVgv?=
 =?utf-8?Q?X4DBNvJeR+zU1BzNwW41/E4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66555034-fb26-41f2-8bc0-08d9baf28f98
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 09:02:00.4916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/aHv5Zf2t6sauevjyqf+f/5ymZfRKwWcHDudkPl0dUB8VYXHahH1rJn9tOCl+YygaJhi0sutQX43axe9qQUzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

On 08.12.2021 16:55, Juergen Gross wrote:
> The definition of compat_platform_op_t is in compat/platform.h
> already, so include that file from hypercall.h instead of repeating
> the typedef.
> 
> This allows to remove the related include statement from
> arch/x86/x86_64/platform_hypercall.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> ---
> V3:
> - new patch

I was actually puzzled by the cover letter stating two already applied
patches when my record said three, yet total patch count having gone
down by just two. Then I came to spot this new patch ...

Jan


