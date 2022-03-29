Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3C14EA7DC
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 08:28:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295682.503272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ5KH-000293-S4; Tue, 29 Mar 2022 06:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295682.503272; Tue, 29 Mar 2022 06:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ5KH-00026b-Ow; Tue, 29 Mar 2022 06:27:33 +0000
Received: by outflank-mailman (input) for mailman id 295682;
 Tue, 29 Mar 2022 06:27:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kdRh=UI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZ5KF-00026N-IK
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 06:27:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e238729-af29-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 08:27:30 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-2-hEB0PjMcytQpirvwA0pw-1; Tue, 29 Mar 2022 08:27:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR0401MB2661.eurprd04.prod.outlook.com (2603:10a6:4:3a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 06:27:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 06:27:26 +0000
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
X-Inumbo-ID: 4e238729-af29-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648535248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YK4sQpKDPL1Sp//4fffv09vTWoI6q01E0+8prpZ5QEY=;
	b=BTn+EzP29FvoLrPJjym1d4jJoPELnxCm386xZ/xXVwOfD6ScLJWGc5MuoW86oWKQQOk5x7
	AKdA+SRTtPZUn7xL/Z4bkcp91fePKDof1Xz0cbWdvjo+Ivihw2SjoAhoJxup6cefAJzw5t
	qxOWCZYagBFGm++UdjzZsp/v7APiDtY=
X-MC-Unique: 2-hEB0PjMcytQpirvwA0pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaPftp2JF8JP952dfj78e8Lnc+R0atTFfTVavJdJrCM9tQu3Ogek+KtnZ8pOzM3lypn6AbVOirva39Wk22D3MzpbeJ36snJGEQKKuT/qZ4uO/joSkH8oj0O1sRilyG35TjCZYFY9OiVIgFB7Wep0l+hhRm0h286ZoGFiOPvlxqOkbTdUpBwi6gEXqi47afrRG8kPV0731tGI+f9SPTHzGMMucIIvEj0oGSllnrDpED95Kpcwmli92Jya+1GAwh49gr22Fb8roXhclLlQssklhVo26zvFAgCNaeorAinjVKS32O5I3rUIi4Q6du27Sll1a4rqYBxb4/UfE+elZso/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK4sQpKDPL1Sp//4fffv09vTWoI6q01E0+8prpZ5QEY=;
 b=afvEyhVEvyvlmRzj9kYYSTGTBhTjkFXN1V3aaZq/gQpYhEyDPGN+oZH5QinjZ2c1UA86Ocm8iNuDohcz+4kN4r+qyMNwH1uCZmuI+C5SFL4NG46oW8jR6TttbLF0lrjVmNH1eHiVCS04jyUbuLttOeFg51DZhCGAO7mNKS0gSLnCJRWzz03ZNeYJNnTnx5DzBWKCNetoLQEebonb24sbnfpFVWYF26GjP2Pe7s+kCNjZEXgFkuR+AkajZwCyhqj1z4GCQqXjMyynBUFDbEci6smy2cAOIeh6MliL2bCJWrq9rVoiktmToRwEDrNKVKyMyR4TzUhI0QF3OnucQgWX7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c999faa3-ded7-64af-7bf1-f6b8e5620425@suse.com>
Date: Tue, 29 Mar 2022 08:27:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: OS Headers hypercall.h/hypervisor.h
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Elliott Mitchell <ehem+xen@m5p.com>
References: <Yj+ekdLdRa9U7dfa@mattapan.m5p.com>
 <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2203281523230.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::27) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02884178-e79f-4a79-322f-08da114d3134
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2661:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB266124C7BAF2F8C7A10E3C06B31E9@DB6PR0401MB2661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	voH0mf+AlHvuFHbe6lZedrbWesdhkbXRBc4pqQBhE8PSIqK0aWfbVeNJqmaclD0A6CvVUsKtWSBobCld+XjQmQlHYDJ316hi9MBeZjzTkj/hQBmj+w/Bz8ClwOBAnyfDPeGZTk3tkvuYN5pnVXpfxoilnUk22E/M61q6r3u2A97A10h5A0MqNFhEl9625Tcu8tR9ag1jmcJV/U+KwGVOghFjSGKChvlzs0YiUicAAbZEwvKIOJCTShkpT9B3JgOsDCA38IU01iAA7ASqhienrvwbIbBtlutXayi2WDdrUNTyRFX10MMNRfJZ06vmJCKNJ4BvPhZ1Tttt9KtSBJYj6vZkMbpB2c5ss6659sgL69MqlkDWfgX1hltvEjr47on9+U1KtQPXaI4unnfmkDG1NDiydWap9fhrvEKONQYNWhLRoU9eXIhs3LcZqFi2oTjIM0N/a2D+hWmPR+KU6FrS+sXhOy7wWBRqi2iFvkWwHcbwh4pp4WaX1IRK5fIDmLZMCPZiFkuO9/oVOk1q5Xg8EKnmxVEC/UKY55umxjFKw++gGjAbj3lrE5sS0o/kzCWbE3yAmb4jm5YHCFrg21rNKokCq91+DKLh8RhOtXTc0e72qDv8mXnIUStiNByZnWnmBzmTJ2tKN/mM7pg+rbBCmWajiCzSQAsuv7I0Hfi4iRUVOJ5FsItcqun22PtUZi3LfgK+d1oKfAkP/d1I2ZTt+02ENVDkznUYhKeUgO97FJjEkHnC6zOLIAnF7+ujMWBs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(83380400001)(4326008)(8676002)(6486002)(508600001)(6512007)(26005)(186003)(2616005)(31696002)(86362001)(6506007)(2906002)(53546011)(38100700002)(6916009)(31686004)(316002)(66946007)(66556008)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzJ5SkIrK1N6TmhhT1NPbDdYL05EUGtvblN6L01zMUlqeXJnSExQWUhDMEFj?=
 =?utf-8?B?T0o1OTZ5VDVzTEFXVmQ5Z2dDNExjZmNxQmgvR1hZSkZMbHJSN2FoREFDcFBa?=
 =?utf-8?B?akRuV09hYkd3TnNzMThoNlErS3F3QzNxL0xlbmF0Ly92TDBXVHFyQ0pGS2pQ?=
 =?utf-8?B?eU1xdW1oZWl5VWxQMzgrNjA4TTJDZUhYN3ozZTBMK3Nma1lhMlc3aVUrbDBk?=
 =?utf-8?B?RTQxUUF3dHRhMG0wNEhOWGs5VEl4V25hek9kZ09wWjlGREtVNWpLUG43QVZp?=
 =?utf-8?B?SG96QThkRzlhb1BwOXdYcVlxRXN3c0hReUlEUGUwL05wRHczdnRtY3QrUjhO?=
 =?utf-8?B?T3RrbHBEZEVZeTFUSEFVNU9QUHpkNjNTUEl2MzUyNUdNQXBWaC80RnFvS1JL?=
 =?utf-8?B?M3VXbExSb0RlNi9vOFlwTW5LNHlITDIvMTdpaWVPdU5xMmpxaXVJcG4yNHM2?=
 =?utf-8?B?dCtKUUtncjVlbTVkVnhSWWdSNnFoUUVveDRhbUdPRHRJUE1GZCtSaEoyZ0Fk?=
 =?utf-8?B?ZnlOMXo0QUMzcVhyc08zKzFtR1J2OGVjSitGRm5RUHM4NUFlMVpVd25uRnRY?=
 =?utf-8?B?eTVhSm5YL2F4Vnd0MDd6UkNRTVorUDFqVEM2YnduNHRHQXVYMHIzOEpLTFpV?=
 =?utf-8?B?ZmlObnczSDZLcW1hKzRZbmhWNUFHZzlaY052RnRUY2l4WXlmNi9vZW0yVUVI?=
 =?utf-8?B?Y0pqd1FWNmgzTW1HNFBUMUtJdUdmeS82a3JvOHdlU3BGN1VlMDJiSFlJU3RK?=
 =?utf-8?B?ektsVUVPV0Z6Ui9uaXFMUEs3aTZlV0JOV01GZjBVd1NEaW1Rc2RHUFBPRVVN?=
 =?utf-8?B?bHAyQlo0ZTVmYWMrNktpQzJMbGhhdkd6YXJPbkFTbnZnaUI4Y3pSK3ZsdWRJ?=
 =?utf-8?B?NTkvZ2xXYTB1eEEzUmtLelVuYkgzc3Q4VEtFV2dxcGE1TS9GcmhKWmVGVlN5?=
 =?utf-8?B?eEdRbUtnU2ZyODdaMFlaS096YmtIRGNkUHNpbUlGQkVFV2lPU0RuMGxsVE9R?=
 =?utf-8?B?NjM1UFQ4MzBZSkNZcTdQdElBUzEzUWVsMTZja1NmZEhxTmtPMXMwekVMcnFJ?=
 =?utf-8?B?OW1UYmJuajJDKzV0Zjl5OG9raUVUa3JMdEhyOHdKTHpUclhCSnowd3hySllL?=
 =?utf-8?B?WDVoUFdjQUpEY0xYWWgxOHl4bXBGMGxwZzVCRzl4MXpTYzV2ak9Jd2lVT0Vl?=
 =?utf-8?B?eGFWb1JCWkRETWw2NXpFTkRyYlJWUitNYmY2dkJsSE9PRUJERzlGVTRGZHJE?=
 =?utf-8?B?Yys3M0ZxemZKZ3QrVDU5elhZRmI5U2Z3QUgzL3FnZ256K1hkSEV0c2FaUW5J?=
 =?utf-8?B?NVg4ZHJzZWwzL2JvT3N5LzY1eDJvVmZrWk5iVmE3WkZyQXZXSEJNaGF1QjZ5?=
 =?utf-8?B?cXR6TjlQMlBmVTRDOUtmNUJzd3V0eDNPK2VOeHpaZDBsQ0ZGdjJnMTBka3cw?=
 =?utf-8?B?eVVDNjBSVDFpWGdMTDYwdlVnVU1KajhCN0lSMWlDa1N2OGtkcHNLVlZkMWl4?=
 =?utf-8?B?TGJtYlhURXNqKzg3YVgyN2doUi8rdTlCcjg1MGg5TzRjcndWRzhyS3M3Qnpx?=
 =?utf-8?B?cnd0WWhHWVRvVDVLN3RkbXJBOWV2VUlFUmRUTWhOajQ2T3FDK2FqdFowMVc5?=
 =?utf-8?B?K2MwLytRbDZqM0pkRkx4eTFOTk1EZkNvRFI0enpSUTFjMkVpS1ZsdHZRc1Nz?=
 =?utf-8?B?c0MySldyUnk5cUdzVHhFWXo5Y21hY2I2NmxmRXg4a1oyK3ZwamJqOVA2SXFY?=
 =?utf-8?B?R2Nib2JROGk4NXFqODZybzVhVEFBNjQvZGdWc2ZuS3lQL3cwNnNCempxWmNS?=
 =?utf-8?B?ak5GRUVjQWlHdnB2TlhvZm5nT3BwdnFSMUZKUlNGa1BTcnYvOEtxOVR1N2I2?=
 =?utf-8?B?bU5vU1IxbHhrejV0MGVsdEVudHFRdngxNENFQkd3MWFYcU54V0oxOEdBeW9k?=
 =?utf-8?B?bG5wNmpTcDZPLytTN28xcktNWkZzQWlRTkYrQlhDS0tEZ3JhT2hlMUxXckt1?=
 =?utf-8?B?MUlqVHhkZmhJOWpvMEtMRGZqT1NpUGZmYWpVUWcwbFpacWNHZk5jc29FSWJp?=
 =?utf-8?B?UTNsVWZuUjZpbk9RNHZPaTZTMGhCdlUzVnlnRkpHZXdkQjdJUTZaOWNWTTgx?=
 =?utf-8?B?MEl2SjFyS0pBUUVyN25wUm5kYzJYelcwNE42aFZQVFpMVG5uODRZUTh0Y2hr?=
 =?utf-8?B?clVwLy9vNHdlYTVMU280MUxvVFl5WWk0Vlh1Ymo4eHVTbTZSY29Xb0tvRjNR?=
 =?utf-8?B?R1ZOQ1hBNktiY3ZQaDJwcWM1WW91U1kwUlRzNEJjZXNpd1JySStNTnlLYmV4?=
 =?utf-8?B?a2RXOHhMWHkzVUJIdlhPVTJVRUhhWVZlR1ZzcjhGMjN4VXgzbHFuZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02884178-e79f-4a79-322f-08da114d3134
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 06:27:26.3410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUg/sAJlJ1BsPufH9SS1SSqxhy+ktcHUwBrTCILDLatNcRUThDiX8em60i6IcLBIqZmV4hZ7p4WhMyf5M5t6pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2661

On 29.03.2022 00:25, Stefano Stabellini wrote:
> On Sat, 26 Mar 2022, Elliott Mitchell wrote:
>> The hypercalls implementation for Linux and FreeBSD have two key headers,
>> hypercall.h and hypervisor.h.  I'm curious why the implementations for
>> x86 and ARM* are so distinct.
>>
>> I found it fairly straightforward to implement ARM* versions of the x86
>> _hypercall#() macros.  Once that is done, most of the wrappers in the x86
>> hypercall.h can be moved to a shared hypervisor.h header.
>>
>> Why does Xen/ARM on Linux still have hypercall.S when merging the
>> headers should reduce maintainance?
>>
>> Was GCC extended inline assembly language for ARM* thought too awful?
>>
>> I'm also curious why these headers are part of the Linux kernel, instead
>> of being maintained by the Xen Project?
> 
> I would have to dig through ancient archives to give you a full answer
> but the reason was that the asm inline on ARM didn't provide enough
> guarantees on ordering and registers it would use and clobber.

While there may be ordering issues (albeit most ought to be taken care
of by marking the asm() volatile and having it have a memory clobber),
registers used / clobbered ought to always be expressable by asm() -
if not by constraints covering just a single register (such frequently
simply don't exist), then by using register variables tied to a
particular register. Of course in all of this there's an assumption of
no bugs in this area in the compilers claimed as being supported ...

Jan


