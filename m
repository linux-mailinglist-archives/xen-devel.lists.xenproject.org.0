Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7C2A417C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18187.43078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtNm-0000i0-2O; Tue, 03 Nov 2020 10:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18187.43078; Tue, 03 Nov 2020 10:17:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtNl-0000hd-VL; Tue, 03 Nov 2020 10:17:41 +0000
Received: by outflank-mailman (input) for mailman id 18187;
 Tue, 03 Nov 2020 10:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRwk=EJ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1kZtNl-0000hS-1P
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:17:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.116]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e353be96-bd4c-463e-a2a6-db10b76f7ae8;
 Tue, 03 Nov 2020 10:17:35 +0000 (UTC)
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com (2603:10a6:10:eb::10)
 by DB9PR02MB6555.eurprd02.prod.outlook.com (2603:10a6:10:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 10:17:29 +0000
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::502:48a4:c75a:b6e4]) by DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::502:48a4:c75a:b6e4%7]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 10:17:29 +0000
Received: from [192.168.1.109] (86.120.241.86) by
 VI1PR07CA0140.eurprd07.prod.outlook.com (2603:10a6:802:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 10:17:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NRwk=EJ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
	id 1kZtNl-0000hS-1P
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:17:41 +0000
X-Inumbo-ID: e353be96-bd4c-463e-a2a6-db10b76f7ae8
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown [40.107.0.116])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e353be96-bd4c-463e-a2a6-db10b76f7ae8;
	Tue, 03 Nov 2020 10:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdRfrLQjnCs7vEULZAvq0vfyQuszTRi5bDIR0CPD4TIW2TG+Dft7bxd3xC53yVQcxGs0SniAudIxoBNPZ1QhOWUeoEtzuVuzQ3l4i0n34fFg5zoEFpwP/LQiI0cVqN2tIHOYukeEd+KCJ/YqStLOM5ygavXhAcTl3TO0CpMCPjxCAKyufOKu3bszsiAZhIQL8HLQhKqjfAsvmbR7ocAq5CEV7KPZdjiT7wjhyxdT2cL2ZBWKLxD5dKgFTXDr7mMRSj0PtduU7W6xzaERR/vcY6uklrF0WZ4O3ZyMzMuhdOWWA+VvWmQuDurrb7azj2AxiE8P+qMICy+tbCX22E9cyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdIG85fWpAj0fad0Dj93K+NaZxGc7Fyc4sDoc28mt6M=;
 b=OdqFTNVDY1kBRjqUJHSKne7iULzCboy9iAb0t+JU6r3VSYx9tQylOag8WskMT8NUYiz+XoYKhB4HrwFpXcjVIIjqhEq1IqPJTIedMc3KoulJTF5oBY9+1y8NHD5eEgzPy87ynXFU1HWMNZDr1FDfCVLSQ9v7W22s/Gl8iwzdOh8eLEoAH6nSX9Hzp9YsXcQL5CpK8nqx0Iy80cOzvbjIiaRhdaBI2LXeHl4f0k04BVIvI+A2BFJJx1BcPkVBRbF6w37RAA71iyNjPUst5hwMxlMyQj+7DohOqPoKJyvpPMBjzCu/D99AzSKB8KAk17lLjP8+Lxmuc7yC/pUevsR3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdIG85fWpAj0fad0Dj93K+NaZxGc7Fyc4sDoc28mt6M=;
 b=Op/LYqd7dbl21OTx25fa7zno0KVJsmXn8se22OTijSj8+qvqVhYtRN28P6+yZill7+L+5ypHTaXqY/7NC5NdI95RUZIk2qn+BddofHNEgHtO3JlL7xDSktypagVA81oEJP2Ab0LXQYvyC/HpJwyh1rhpEE1jwDzUFusuYi2P3Ws=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bitdefender.com;
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com (2603:10a6:10:eb::10)
 by DB9PR02MB6555.eurprd02.prod.outlook.com (2603:10a6:10:214::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 10:17:29 +0000
Received: from DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::502:48a4:c75a:b6e4]) by DB8PR02MB5740.eurprd02.prod.outlook.com
 ([fe80::502:48a4:c75a:b6e4%7]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 10:17:29 +0000
Subject: Re: [PATCH RFC v2 8/8] evtchn: don't call Xen consumer callback with
 per-channel lock held
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <247f0d77-9447-47d0-4fa6-8e17b3e6a6de@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <60302534-1dfb-af5f-4974-1790edcb2f17@bitdefender.com>
Date: Tue, 3 Nov 2020 12:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <247f0d77-9447-47d0-4fa6-8e17b3e6a6de@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.120.241.86]
X-ClientProxiedBy: VI1PR07CA0140.eurprd07.prod.outlook.com
 (2603:10a6:802:16::27) To DB8PR02MB5740.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.109] (86.120.241.86) by VI1PR07CA0140.eurprd07.prod.outlook.com (2603:10a6:802:16::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend Transport; Tue, 3 Nov 2020 10:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80a74515-4496-43cd-280f-08d87fe1ab5c
X-MS-TrafficTypeDiagnostic: DB9PR02MB6555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR02MB65558A83DE2CC948608ED058AB110@DB9PR02MB6555.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MaxMyOG933V3HljAGaY4tbLFp6IDjjUPpGoRGn0nC6RInzOHwhFruUSroOATwc8T/wJWV4XFH0+KGW2wufdzZWaI5JyYH2itcUbbnht7UZDmx+fOJsM92fyMQuIIwbAClHqk1GVqzDg9YjlZWLNFbTRDfOPd3emiwjxdlgHMrHhOrchD7eKbc2ZYJmBvaNesdduLU9m+jSpRJjhDhmdsSfme6J4l0DWtGk+F8mU5TDwkB+yjztxgJDmqo0NJZ5ZgfTS25eUoocxUy7LDDV7K818au7ED+3N5o8J5GRRAsGa/2TdhPSU8Xib+lowUeHdOgKXYiuL+6VPC8MafRGJShcpfocOFi87VK/UqcLyUd1WQqI7VbGoorjDRibQPDDU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5740.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39850400004)(366004)(396003)(6636002)(8676002)(8936002)(4326008)(2906002)(86362001)(478600001)(5660300002)(31696002)(66556008)(36916002)(83380400001)(110136005)(316002)(54906003)(16576012)(6486002)(956004)(16526019)(26005)(31686004)(36756003)(53546011)(2616005)(66946007)(66476007)(52116002)(186003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	x8WBTT0m2mE4s/QApjnkVou1kE3rX5w4udgCbOR/CjMgfGe2l4brL5f2MFAs4Txc6FIeZzXkKfaolgSRvwzMFSlIY3L48o+rO3FH4fQXwhdCd6f6BFzcAhjG7A1AWyiTPM1S6Zksbh9wbBPMdT4JpEYahHtc+l0zqytslFg7bS5tbbFiKuF0CNlANYD6lGkHRvBgp4CqSwG3bkxfYFIR7rLHI9LHaXPEbHASXMv4EkwB/6kBOk/qWyXMvJnTqb3zq7HoA3Uh2fxJxRPT2Tn4fWyR9V3GG+u/dpi/y36Jk8vmn5UNmvPEdmTsNtO0CkjyJA7rX9RmsrBVHKwqMifVpYtDZj8YgPl9Dm5hh9HWULEinqb8P6hWXouPX5dHP6PzvHs+uNJs1AIIY5vP71yZ6nEli22aZsVgSlr1c0Ee3LF+dQSc8vSayCHr811l00YLkOtJWsjRsizQlD7XF5hCoHDS7STA0lcmpWqIw1Ew+WNjeON7zd5qaLX3e/LFntAFSq9Kh55+9h+2J7FKa6QoGO+szaAeHVHnRMhhwiSpzgRbudAAa5sVmgpieWGTxJgPzeg8g/VTTOnv8VwaR4BS7HlPETB3PY47kNbs+TFyWy/vOPLs8EzoVLh9Gp16JVNSqgX8fsQXVt1aUMpC/j5P+w==
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a74515-4496-43cd-280f-08d87fe1ab5c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5740.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 10:17:29.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xVwgcXQXHeqO53BVqBTs3vw68C426+sHZiKWjM7QGF5L9bSRaKiPx6r1xn1025PVq4KvLrODHhSVP3iwGdWyLvYRa+rXkaPAIDTVW4eqd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6555


Hi Jan and sorry for the late reply,

On 20.10.2020 17:13, Jan Beulich wrote:
> While there don't look to be any problems with this right now, the lock
> order implications from holding the lock can be very difficult to follow
> (and may be easy to violate unknowingly). The present callbacks don't
> (and no such callback should) have any need for the lock to be held.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TODO: vm_event_disable() frees the structures used by respective
>        callbacks - need to either use call_rcu() for freeing, or maintain
>        a count of in-progress calls, for evtchn_close() to wait to drop
>        to zero before dropping the lock / returning.

I would go with the second solution and maintain a count of in-progress 
calls.

Tamas, Petre how does this sound?

Alex

> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -763,9 +763,18 @@ int evtchn_send(struct domain *ld, unsig
>           rport = lchn->u.interdomain.remote_port;
>           rchn  = evtchn_from_port(rd, rport);
>           if ( consumer_is_xen(rchn) )
> -            xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
> -        else
> -            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
> +        {
> +            /* Don't keep holding the lock for the call below. */
> +            xen_event_channel_notification_t fn = xen_notification_fn(rchn);
> +            struct vcpu *rv = rd->vcpu[rchn->notify_vcpu_id];
> +
> +            rcu_lock_domain(rd);
> +            spin_unlock_irqrestore(&lchn->lock, flags);
> +            fn(rv, rport);
> +            rcu_unlock_domain(rd);
> +            return 0;
> +        }
> +        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
>           break;
>       case ECS_IPI:
>           evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);
> 

