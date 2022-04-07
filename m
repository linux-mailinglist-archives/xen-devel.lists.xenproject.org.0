Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85F4F7A8B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 10:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300539.512688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNum-0000fu-Ae; Thu, 07 Apr 2022 08:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300539.512688; Thu, 07 Apr 2022 08:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncNum-0000dJ-7O; Thu, 07 Apr 2022 08:54:52 +0000
Received: by outflank-mailman (input) for mailman id 300539;
 Thu, 07 Apr 2022 08:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncNul-0000dD-Ca
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 08:54:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62081fc4-b650-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 10:54:50 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-tHo1w9lCP5WA6Zf1ufORMQ-1; Thu, 07 Apr 2022 10:54:48 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8741.eurprd04.prod.outlook.com (2603:10a6:10:2df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 08:54:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:54:47 +0000
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
X-Inumbo-ID: 62081fc4-b650-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649321689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=auJkAJgRObzvD3bsusK4L+BaHYhaa6APSHZn8u3t2KQ=;
	b=LydjGquHgF72V3yvhtQ/cf+Z9otqSl23Hc7WbYLOiLlw6emw57FajDeJxQl4Onu0G6RS5m
	FatDkBsTWxraB8kVTjXWh7KvaFYw0BX5u3SpIfFXbDbURnOiWdqqVGjZvhogI4DeiCN7KK
	66fg6Xh/gyoUey/Zjs0OF0DpiSOlxF8=
X-MC-Unique: tHo1w9lCP5WA6Zf1ufORMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg6ZwaUds0svrnZQB875WhbXGNmVj7fxcXoodoNb6/CL8g5JTmgUxPTPeveqoiqckfJ+4zF8lBKprOBtEPW8gigvNgddSxDXW8eWG4WDxmgKKP1vSBsJMCt2m44PlYcGhrX2qsUTMeWZMeh+GvBPovTRQkNqiwoW48jxMzvxuBku9VqVK4ox8xjyKEKP8vvrujXx+0B0sWFcQL7N7+cUTwx/Bn/CTy2piPQsTjkSCuRITzNz3Et3mQMFhnS2T65rs4idQPGoplGb/FqiDT61e3qhBFPlRLj/0Nwc3PC/Jnpatumu5Qg7GUqt0CHp+ceQkU+6zj3jO1Ndv+Wty/cbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9Nglw6eE4Dsn6wn+HpgWD0PvY6JLqpvnlu7/OBr0kM=;
 b=QAZ5sJWGx/YyHCy6vUnCArYzeS+GsNYBiBQTCLQRhK08jXKifQLf5Y/vq9tHkNEyKlLWGdYsSZP5VLvj3vKOdL50JGIpv/yawVsDpPUKj2D2i5rm7FJfxMYeu/3fc6UpJGBCpZaZn3xIkwquV7WKKcO2LMXGw9P3iDH8mqfbcNcEsmq5pKBB7Q8cq+v0CCiHv2hRHUlBiiv1aouu5raaegrosf6ZuavHkFgaNNnCfmRGFTXDVxGPyX7vajn9uCp6aNvPnxcfnSmCWVmtF/DFfZ/CjjUBo9k3KB9sKmyxtc3knavQCrb3RqBy3aoxj0Z/g1K/2OQ+w/SCee8JKttQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ab13efd-c4ca-43ff-05e8-1d29b3c438ab@suse.com>
Date: Thu, 7 Apr 2022 10:54:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] VT-d: avoid infinite recursion on
 domain_context_mapping_one() error path
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <fcc51df9-0896-247b-d4ad-0de4db6c2a9c@suse.com>
 <Yk6YAoxuOZ4Ejosm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk6YAoxuOZ4Ejosm@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0037.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0082f328-f4e2-415b-5612-08da187444a1
X-MS-TrafficTypeDiagnostic: DU2PR04MB8741:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8741BD622FEE04A06C452F94B3E69@DU2PR04MB8741.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SR69YHHZqQUlcR1cqznWhZ+404+Ri210oXTSfN9SEJiVBQ33oUk6wItOzHypmg18TnqIkttjb1y8cn1vY9xGOxxpjpXfu9M6WszePnAfRnTXmurQaCa++igGftj4uPd0faG6Yb8WBvlmiYgblT0GyaS2Twe4/dWKnzC1B3EPbPPSD+qohcWgxXbiOmtqVhzehPECzJBUa4E9F3Y4DDOzvKi2AvWjHaH6/83P1waRO3ce0LtpX3wbObQbQMEJAPVGy0MmnV+prXao142ffIlMVoQAmizhKQ0ImpxMPv4xb8mMfwsNEzLQ7fRPlxmn8S1xE9HeS3P0bHAq9XvHfHsw9oAa9eZv1YbeAPYN0I+eEZctT+/U7ETKvpe8g+1EwkxhT3XiXFL+VXNS2OBkyrC1eN6nb1uqBKJ3myfDf2M1zQueBPLf3we2xZzqa+GFsSLGCnif/linwkKbqui+1M8L1BWGoZVhKPs5wINVyVJMmKI17HePe65vKgX2gzJ50RkrgvfSF5mgwXLmKOXAQNoF43IuZZGk91uRn1LDrHMfVp4ZCC96vOQrBLeo4d2qlWCwUq1lBvK//h1a5vqvqIli/wmkdHBXQkD7eoGlGzU1Q95DFa2FT7FelJWTXIiJ+aGFoLE8Pp4tSMvG6gsU9HISheubdxWaCuLOj/7zerjOzbJ1GRkGRYuW7TToU/odBVARPaU6RAVycWQ5xQ8uwX23sM/Y33TycZF3HlQJ/wUdXT7+W+nvGMm6N5eCmjnkKU9x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(4326008)(66946007)(8676002)(31686004)(8936002)(31696002)(6486002)(66556008)(66476007)(2616005)(86362001)(6512007)(186003)(5660300002)(316002)(36756003)(54906003)(508600001)(6916009)(53546011)(2906002)(6506007)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tmm4ybXWYHK6k80b1g+TLiPZ/eL4+b1Yf1m/nJDEq7iYBZTTm+uPVtEXKpCV?=
 =?us-ascii?Q?w0vfTpO5NzS7nrXvA60pD4XFwewXOYFX74cjHlE2rTCtJoJEDQ2lXubUnofF?=
 =?us-ascii?Q?u5+vY1iBeyg2Jrvh6AKZ5H1DLrHq0tkOsm/ZLTlAkkgsvNQl6a41QMMIjNDc?=
 =?us-ascii?Q?IHOO8wYRhnvXp1HnakTn6/dqigBR+d/wG6j2EWl8+vy+jay8QIXN5fFNeNim?=
 =?us-ascii?Q?H6UCxlQ9exP5rvB6BGXh5kDXBwLOIKJFaL5EjqoX2a7EAJdw5+J+bBUaQlDs?=
 =?us-ascii?Q?nkNxnw3hv/+WVkoTi5tt42x9JZl1FMLZE+j51rCXsMp9CfTex1FoZEIO+Q0k?=
 =?us-ascii?Q?YDIVvfI+YnpLtffkeB+tcxYMw7wzxCSRjjxreDMahAKW3FWuKlwIPLCNW/Ra?=
 =?us-ascii?Q?sZnfvSUX7VK77LWbvednp0rC+wFMMqiSZehwT/kwcBaAKyyFOkrcyxYF3d/e?=
 =?us-ascii?Q?A0MM5ArAfZEhqvJifAjugqVd4eA5yPjTnSRt0AgUipQDItXT1Tks+NMIcig9?=
 =?us-ascii?Q?gWIo5Oy8mA0/o/KuMTeVJy46ViPjS3ptbsEpGP8VqevRLui4S0J3C6oZSo+B?=
 =?us-ascii?Q?A/Z4CGgWxsaz52GTcf1LoFW/4fQuXzIMDbQM4fRlqmMDZHLJlEirbXvj/qtL?=
 =?us-ascii?Q?T8/tGxzQIgHs34XkZl+CsnSDVHr4LJ3pK/BDX0cjehkP7cxm+rmzJn6JoEhm?=
 =?us-ascii?Q?+oHIfsW5+MG1PHzxgeSmqL+RlJ3eadScgfG5EtmkbY8Qch4pYNifeTYMUFfZ?=
 =?us-ascii?Q?+/fdr50x15rr/072AZK7+JGBrvpmBx6OR9Kb2xToeIa3qRJo5m/bHXwQc3M7?=
 =?us-ascii?Q?kS9sPpKneYJAwSx1C+3j6XxvPBckoDc1O7Y1xaTnR6eQBw1f6aEJcJCQQ41Q?=
 =?us-ascii?Q?aR94diWUbtSwIQaLnQRNw86tmaldxAGuxPcp7rfQ6mtkHaxvI5BDBqm5fzZ7?=
 =?us-ascii?Q?VOm7bFXf07b1xgWTVQkY6ij8yTNSe7KXVOdwRc0AyheIIsm2O1l8/HwPc0q5?=
 =?us-ascii?Q?4ddrAo2T04xZTt0zboZoUIIb98EoVhW+ULkbsLkZ3N8+1Y3nop5L7pccs/ZC?=
 =?us-ascii?Q?koqxeDv2d14AumaJ2DVbAOi5lv1Qi5hJ0ip9zkDd2JdxZtO/FP/vNu8ktjHo?=
 =?us-ascii?Q?am7ROVfvKdRVjfEHMV7dJzoSZ2gq8lI8Kl5EJ43g25PsKLjFe855i2AwCWcb?=
 =?us-ascii?Q?4cZwI5ujJHX7RXLu9bpeiLPm+ERJc2BZVzfSAcSWcaJi9v2oaceuVMgsUhTz?=
 =?us-ascii?Q?JLViByeqfVHCSYt9SjKsKyyxIyRzZSjgtcIm7zR4Uwk69PS1zixlkCe5t5GU?=
 =?us-ascii?Q?AxHBLZTzFd69R1bZbIbWpGha2qQHge0tRffxsuNho8ruJEgg2WgBds5Xmb7Y?=
 =?us-ascii?Q?EAQbjxTTk/YdERkiDq427l4tq7edT52Q9g/ifchszVeKm2Pens4KaZoay1Id?=
 =?us-ascii?Q?oVj2IV+WtbCJsFX6LEmGS5NIc2W1lwRljDa6cbuFbd0+3lqj39Rahh+se961?=
 =?us-ascii?Q?+HMYssQlxq4F8EEz3IRNb4+q9s1jmSzFQICHg2o3q34MGyvyaCGAnEM6TOXl?=
 =?us-ascii?Q?RrjC82+NoYK4owdz4PX6UHqNEult/iSVoBzQNc8M5cU36lmPTolkHaiy/WYO?=
 =?us-ascii?Q?2s423mUD0ZemvdikBmXqwRW0+hk8R+aujCP0/N+ga+Fr281MhbAIsfUw5HtC?=
 =?us-ascii?Q?IGQNG3TGFFiuG5hEZRCMNXuYqv2RE0OlcJdPaR/m73+1oGNm3rwebj4So+DE?=
 =?us-ascii?Q?lAhQmo7Giw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0082f328-f4e2-415b-5612-08da187444a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:54:47.7430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSvMDB9/3MeYXpGP3W4Q94MKulhRqWUFdrPGF5IqjCLRCiDVFkboi+qVoBTp5Y+AnxN3DVo6lOU99n8fOPYHww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8741

On 07.04.2022 09:51, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 07, 2022 at 08:11:45AM +0200, Jan Beulich wrote:
>> Despite the comment there infinite recursion was still possible, by
>> flip-flopping between two domains. This is because prev_dom is derived
>> from the DID found in the context entry, which was already updated by
>> the time error recovery is invoked. Simply introduce yet another mode
>> flag to prevent rolling back an in-progress roll-back of a prior
>> mapping attempt.
>>
>> Also drop the existing recursion prevention for having been dead anyway:
>> Earlier in the function we already bail when prev_dom =3D=3D domain.
>=20
> I wonder whether it would be cleaner to stash the previous context
> entry if present and try to (re)set that one instead of recurring into
> ourselves.

I'm not sure this would be cleaner (it might be easier): The entry
may have had modifications which we want to undo by a clean
establishing of the "new" (really original) mapping. Otoh roll-back
can certainly mean simply going back to what was there. But that
would likely want to be a separate change, for likely coming with
a lot of code churn: I'd see the function gaining a two-iteration
loop then, which would mean re-indenting fair parts of it. But
maybe it could also be dealt with by other means, while still not
introducing a fake loop via adding a "goto" back to the top of the
function ...

>> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

Jan


