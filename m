Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01C215396
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 09:56:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsLyR-00074m-NO; Mon, 06 Jul 2020 07:55:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOOe=AR=virtuozzo.com=vsementsov@srs-us1.protection.inumbo.net>)
 id 1jsLyP-000741-G0
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 07:55:34 +0000
X-Inumbo-ID: 106114f2-bf5e-11ea-8c46-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.125]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 106114f2-bf5e-11ea-8c46-12813bfff9fa;
 Mon, 06 Jul 2020 07:55:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgR+fe+AmtzhnxVCbvFi2L++DHx/za/86x5IVNyFkA8BqKs2JUsQBSIILCDjgzp5vI2QSUA8skoYzsXusvQhoxGT2dCCgLC0MvXQGer+OyXyxZlHgBOGKjbmktoeyUaail1sSbLJygSBGtpWBOIORL8/S+ylsVHdweT/6UdsefqHIWwcyU1qdDbbDQJEeEzo0/JeN42Scq1UyuxWs4qXerSQvPjS9FbTtllasreKMVj4bztznkA7MasroA0p9wned1D0RGAX2VmFcuiFcpAOJNZcUzHNyLeAeSDPAWUN4AZHBubpFlpzHjUbpYHmPyRRCDQEkyTyi75h6I4u/P7uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S//TxT9x7uU5Xs1uhQ4nTZq8S4gzQYjvdmeX06IP9OI=;
 b=LJcBTC2EhzOmV267toCmAq8TrtYn7FZeUJuXkWbb4c7hCjcFrEBbfqHPo3QqOXk0CYybICXlAUvPl2H3rO0yTGUJYii46pgt5YjDDO70cxZQ5pxH76MhIz5s+yZBYJIezY3zTpIXYj2/B3qaYrX/S5RjdmyYmRNnLEiIRrIi4vTbjvRuA6SNHI6F2E0PSFcw2xbhHSivvZf6JjuEnxgBefbFqd+RQ+DrnPjuVD9xgNgV7Ywo4wiKVdjtJBgCn6LiOwd2/jBAwh3sPo/okxqBCRnRwv7JVeY1IlvlWGj3k3sAclIheD+5r5yznf1ItTjIlMJWmlwhyMcGG/SYHx+Xkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S//TxT9x7uU5Xs1uhQ4nTZq8S4gzQYjvdmeX06IP9OI=;
 b=EN36SukXAShOcdQZEJ4ZoNqNZLperACzvAhoXRvsPBXtclHjMLRj2uZCjbK4gpNulWLtgxOr2/PqBI7+PBOwiVg+lJoL2U+NDX5+3wjwtHzlT214lUoovH30drs5BGsDSMbmg8zp/leA97QDGObBAKOhj0PdvI1ZnW43N2oIzRM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Mon, 6 Jul
 2020 07:55:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::a408:2f0f:bc6c:d312%4]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 07:55:29 +0000
Subject: Re: [PATCH v11 8/8] xen: introduce ERRP_AUTO_PROPAGATE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
 <20200703090816.3295-9-vsementsov@virtuozzo.com>
 <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <be7bd5ba-8cee-3b9c-7869-95cdd37bdb5f@virtuozzo.com>
Date: Mon, 6 Jul 2020 10:55:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0006.eurprd04.prod.outlook.com
 (2603:10a6:208:122::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.2] (185.215.60.58) by
 AM0PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:208:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Mon, 6 Jul 2020 07:55:28 +0000
X-Originating-IP: [185.215.60.58]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8dff763-d15c-42f5-0ba6-08d82181f3ba
X-MS-TrafficTypeDiagnostic: AM6PR08MB5079:
X-Microsoft-Antispam-PRVS: <AM6PR08MB50796BB580726F4BF2B27EDEC1690@AM6PR08MB5079.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Sn/oHz8fvlJAw4YJSvEq4xKcy/sJeolaYETy40Ug8p7amP29Wa48qC1Pv/mZCe05FSlu3SmKIsNr/Ykcw5ORd6hCtqOrOIhkRUkmU9Y5+lOW33F39rqWmvlp3TL4hiByOVhPCmh+8RDoE6GAU1uS5UeCLPWkOsB794EdFmVTjl2JcbTS2dfOXAz9rrON4HfK0bEr7Vf4sZS5i0k4ayl/n/vQiQwlXXu9tvkf/TypMWDhjlXc+PqnpT0hJj1/Ckskcy7s2JU9bTCvaC3m9hhqAQ9WoLkQGWUybLOYOGI37fx0I8ggH9ls2zUo9bLYFhMHLqGbfDI85pKyJUgUFctC+zTcNRPckd9mYskH/DwpWUY+Lu4WYdds0WtQpLOmwLE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39830400003)(366004)(5660300002)(8936002)(2616005)(956004)(316002)(16576012)(66946007)(31696002)(36756003)(86362001)(66476007)(66556008)(16526019)(6486002)(186003)(8676002)(2906002)(54906003)(478600001)(31686004)(83380400001)(52116002)(7416002)(53546011)(4326008)(26005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: lMRCyFxBJ5fLNkwNw6qTRlTU3porKgG81JM6/w4ArMLtTBvY1X7Nbr6grh3jnqj31K/aXw2aq4zZERIC3FNa9D+CnsudasA2k/8Ml5nlK+h02dy8mgjh7Tl6ErFr6dXxPmthUEDFX/VAETr5MAAigGknZ5ntpGWMSV7St7A+aOoMI9IkpaqSPVqsYrnt0uKTn4YZnvAY64yvW6C3GMxj7C8aIEdphMzdO+B7qg3HrdWMVX8ay3VtUv+27/ZmnE+QL3rjfq165bf11EpGAxoA9gOWizH77cj3KFbKpsuZ3wFEJ0LHc8iij81cP3AUyOn2NZFTBAQUXtwXiXEnfQn5GHBtKBipybAI+VGp35o6icxT+Z7sg1Ly00YzXvuj3C9sDbaX7CiGMVn+CIHRSOnqaZPgHnDvdILoDhI4GtUeRFLDQ1rELLhNU5S91IbOA9eW5ooJHyk2TN1NcIhKzMYtsghFR+jI4KvzKVbRGm0eBt0=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dff763-d15c-42f5-0ba6-08d82181f3ba
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 07:55:29.8510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8GZ5M3N8ZrMTlKELjAyZZzzz3NVMz/Qu+dKaJdjWQbOyCP8O7rJX2B9UriIzABzYLus4YNQXDx5uaRgFEvhtMmA2XAYJU6sLY11/XWYGfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, groug@kaod.org,
 armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

04.07.2020 19:36, Philippe Mathieu-Daudé wrote:
> On 7/3/20 11:08 AM, Vladimir Sementsov-Ogievskiy wrote:
>> If we want to add some info to errp (by error_prepend() or
>> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
>> Otherwise, this info will not be added when errp == &error_fatal
>> (the program will exit prior to the error_append_hint() or
>> error_prepend() call).  Fix such cases.
>>
>> If we want to check error after errp-function call, we need to
>> introduce local_err and then propagate it to errp. Instead, use
>> ERRP_AUTO_PROPAGATE macro, benefits are:
>> 1. No need of explicit error_propagate call
>> 2. No need of explicit local_err variable: use errp directly
>> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>>     &error_fatal, this means that we don't break error_abort
>>     (we'll abort on error_set, not on error_propagate)
>>
>> This commit is generated by command
>>
>>      sed -n '/^X86 Xen CPUs$/,/^$/{s/^F: //p}' MAINTAINERS | \
>>      xargs git ls-files | grep '\.[hc]$' | \
>>      xargs spatch \
>>          --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>          --macro-file scripts/cocci-macro-file.h \
>>          --in-place --no-show-diff --max-width 80
>>
>> Reported-by: Kevin Wolf <kwolf@redhat.com>
>> Reported-by: Greg Kurz <groug@kaod.org>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   hw/block/dataplane/xen-block.c |  17 +++---
>>   hw/block/xen-block.c           | 102 ++++++++++++++-------------------
>>   hw/pci-host/xen_igd_pt.c       |   7 +--
>>   hw/xen/xen-backend.c           |   7 +--
>>   hw/xen/xen-bus.c               |  92 +++++++++++++----------------
>>   hw/xen/xen-host-pci-device.c   |  27 +++++----
>>   hw/xen/xen_pt.c                |  25 ++++----
>>   hw/xen/xen_pt_config_init.c    |  17 +++---
>>   8 files changed, 128 insertions(+), 166 deletions(-)
> 
> Without the description, this patch has 800 lines of diff...
> It killed me, I don't have the energy to review patch #7 of this
> series after that, sorry.

Sorry for that! I really understand you, take a look at Markus's
"[PATCH v2 00/44] Less clumsy error checking", which I'm trying to review
currently..

Still, the patch exists in such form since
"[RFC v5 000/126] error: auto propagated local_err", where it was reviewed
by Anthony, and I suggested to split it, but it was not needed.
Unfortunately, I've dropped r-bs due to changes..

> Consider splitting such mechanical patches next time. Here it
> could have been hw/block, hw/pci-host, hw/xen.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Thanks a lot!

-- 
Best regards,
Vladimir

