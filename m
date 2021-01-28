Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62A30747C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76915.139019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55G2-0000rl-Gq; Thu, 28 Jan 2021 11:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76915.139019; Thu, 28 Jan 2021 11:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l55G2-0000rP-DI; Thu, 28 Jan 2021 11:14:38 +0000
Received: by outflank-mailman (input) for mailman id 76915;
 Thu, 28 Jan 2021 11:14:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umji=G7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l55G1-0000rK-9A
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:14:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41cee408-cc26-4b1f-bc31-2b6c0b0fe272;
 Thu, 28 Jan 2021 11:14:35 +0000 (UTC)
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
X-Inumbo-ID: 41cee408-cc26-4b1f-bc31-2b6c0b0fe272
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611832475;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1ux2TGwHmk3ufEj8WUHkuR60u7X4NUPW92hdxdNpAWQ=;
  b=MpdJmLqmDX5/nxPWtad2xZn7qV9ttyhOl98lkfW9q0vy7vxhH3md0S6O
   0PSOKk54uNEjYU9d0c2yFytSDzx1V9n2OR9b7vzWI5/zsAV6r9L7fqrbs
   Fy7H+BYyh/Y2pnpNDay9jvXU7H/Aw+6lYvaoIbZ1ClHUR7gAsvpqVSXM3
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nEyNvEUCYovYMRYN7Vu7U0oiCMkwCQdNP4IMYPEp1G80qkG308OMT42bKi2hdF/f6TzkfqCQ0r
 QgHn7lsa5lZXHmPHtDpmYDpLaqqJg/9FQh0nI+u3cF1y5qEj7pJS9M1WN8sg7REo5cXIDiwmsg
 vxN/4RFofU8VXYmRuZ3UwBcsz5AioQy3mmjEliVSfkGJKUTUZSnw5ZaRN1e4UXZb3odwEngbQG
 GSlWiG2ONziW7AIWXMhTtuFRN4kgAck15K3FSA1y72jXQTvrt32S+7t0Z+pzVP4feWGGlht4PE
 oRA=
X-SBRS: 5.2
X-MesageID: 36091251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,382,1602561600"; 
   d="scan'208";a="36091251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xaj7qZu8HnLJsH3ZnwOG12M284TwX9e19GjzH+ng8LZpEIuXLm5dkWwxVI6mm4ZlEQGHhHQmf1Om7GLpa+to0e1L85SCbjRabFi+4z5D5XZGuPxkQ28iVFAfq6YnQLDNPQLVxfPsEuiiYHGfdei+e02oSDZo5t0b6QiZzzTwpKksqQ0ly1EYfjrVFdPsps2zk7mcbuaF749kU8DSi3Ar2U00eqpmihBqvliGPQyekHiUCIX3sjYcR6ZRX4g/lGh7QWM9vlSncOKy6EnfkacB3Cte7g0VPnAvSMqS50nFLH5fdTT8feqAsD4848foheiVTIcJNk0j3WysbhwbyoeaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa240Lnfp/ltQ2I8Ds9sL3mxXzP7ps/H3ZJFxDyPERo=;
 b=GkoBMUl+Dgz3q5xXyavp916t/AdDHar2fI41am+8fkDh4wF0MTRmreF54Hx/fSrF2LiMWkO80KrFScrH2F4/9EVLLafRHsj+WfNtwrp0So6yJhqjcP2gApQoKAg7Gj2Dziwu/ZpBCJb0Z3wm42R0aciROAcHoCWKgCDQctOTKhMVQ93kmHjNIXFSXxBhFLruOs8mNaPQXDWJNrPaj9YY0OXHpXyXrnGRCP4xIOCM9kARgA3hVDicdW8kj55X1mcpXJWh9+xdoi3rcN4sT+m6xDr8v8s+m2wxQe8Lvl3AdS6C/owkeS6TMNoJHkmgEuS6la4/ckD8B8gd5OVKwhEkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa240Lnfp/ltQ2I8Ds9sL3mxXzP7ps/H3ZJFxDyPERo=;
 b=jDohnUvUuRDJLRiWmVzRpg0mt/jzOYkwFJsyGmGd2QQsBRxJRtZ35t4JbtTji6sU4j38msTnwq4JfeX0jsktnUJQyIn0dZ1TCl8lp1HdJJ1eVXU85+RGdEhgx7V71VULHuHNmjE3a7EXsQvvCxFppXdokd+YwTyai/rWmy6/ZmQ=
Date: Thu, 28 Jan 2021 12:14:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] libs/gnttab: implement on NetBSD
Message-ID: <YBKckSPrDenZy1rK@Air-de-Roger>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-7-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210126224800.1246-7-bouyer@netbsd.org>
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 523d2fdd-0925-46d0-008f-08d8c37de24c
X-MS-TrafficTypeDiagnostic: DM5PR03MB3372:
X-Microsoft-Antispam-PRVS: <DM5PR03MB33727A9055EC727557C796488FBA9@DM5PR03MB3372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAp9aZmlmjqKl4NgIaiu60FDTg4PXfXfjUgJDEN8C259zYxNUbHkiOkWEhdPtYIliYsqe8UvoS6GQ5yzz8/Onva6zZv5jFQrxhW3c+PXHTItWaGPpAXrrCRYALfC6PtQft/p6uYMzhM7rBLO5Au+xABQOsbeeK4Ed2bKa7rK3JBrr6TpzMqrCWYCThaZ8RrR9UUKTXuwklO9FKG7ccreP5pE5N8puouPEW77ASQj/WT/SJmMVLsSahShz3dKPAeowsASXgVcQ3AuE/yHyr1CIyezBUPCIGg5nYgL7lHyx3OjWaHn6RER2KY6EnV/Db0BefFlYYrwvFi14uNxlhdMiNwI4VgEFBaZLRNyGSJc6Ia1zesoRrwzImKzuBceXU76LD1tprAV8jhHhBVhz/0W+Pbqnh/9GmyDKHgLlP7i1MLIrfTZ/wf+BaPaw4yYP7XpluRy9VdgYVFWqS9DHxUwcq+2ue+FtPfVc3qGdtT6jquhohMNnzpFEf0XJzVw/smaNRYjHQfWyet73GQMSTUbFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(6666004)(478600001)(316002)(6486002)(9686003)(66946007)(85182001)(66476007)(66556008)(6496006)(86362001)(5660300002)(4326008)(8676002)(16526019)(4744005)(956004)(8936002)(6916009)(2906002)(186003)(26005)(54906003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVQ3S2doM1NBbm9hTS9TbDhYTElHOVV1a0NFekN5SHNmWUd5RGM4K0tCUWxn?=
 =?utf-8?B?eTFzKzNXc1FVdkk5WTZxOWU0RUU5Umdqa0dQbkJPWTluVkd1UFpqNVhmdG1k?=
 =?utf-8?B?VlIwMTA0MkpUOElOaDN4cENzcXFPazVSMDRjOHgrMGZPZzZWNG5DbjJuMEk5?=
 =?utf-8?B?R0hMTnV4bnVIMitIUzk4b1VXK0NyTkwvZmxYNEZjOVdBaE0vWVVWMUlwalVh?=
 =?utf-8?B?RGhmeHI0cDZKd3pFUUxueDFTM1FMendSbWhqd2tGZGJuV0Z5RFIwL0x5VHlk?=
 =?utf-8?B?UnArdWQ0SzBmZlNBS0h0WnNHVGg0d0x4L1hDTjFaanBFNW9qb0NHeGpob0h4?=
 =?utf-8?B?b3lvM29TNHV1SXVlVjlra3RpT0xUK3FQa1VGTmJkWitIT0JRKy9zWWlXVXVu?=
 =?utf-8?B?WURhbTYwTW95U0k2NjZmWlRYNTJDSWNyMEdaaDVrZERyaHFOK1ZzaWlqYWNn?=
 =?utf-8?B?TnNVZ2d2OUJYYlQ0RGVIOFdnOEZtQVZCQXg2RFpBZEUydGJ2a3pKMkR4WW5J?=
 =?utf-8?B?dHVLSGdnV1lpSy82dmIreXh5aUprYmU1eldOOTdITWd3eGJkTUNhKzl6Q0lJ?=
 =?utf-8?B?MDZqUElzaDFhZ3BreGRsOEo5dEFzUk95WldzNm5DczE2UWlUS0RoOG4xNGUv?=
 =?utf-8?B?M2Y3QWVSVTRhTmNkbnlFcDczV1NqaE8vdmNXa0JMTDN5bHhKRk90MGg4c3J0?=
 =?utf-8?B?eGV3V2lSRVgzN3NuSWcxNnRBb1hvTVZSR29oNXllelgyM2VLK25KenZSSHlt?=
 =?utf-8?B?RC9VK2d0dEcwTVRocmVNZTRFdkVSUk9mT1ByMEZXUENiOFJLQmY2eXJ6cXIw?=
 =?utf-8?B?aFBiZzRWZWxOMnpPaUt6OU9KY1dFWW1YYXIrRHBHRkJweElWZDhpT1Jid0dF?=
 =?utf-8?B?bGE2VHFMc0QvRlkzM1Z0NjZ4OFVwQkpURERuOUtpalRleG1pS1hpS2o0UWc2?=
 =?utf-8?B?YU9JdUJ0OW5HOTJVOWQrMW95RkNUblgzeW45N2VGYy80OVMrRC9uT3FHcGFJ?=
 =?utf-8?B?M1FEUHQ3MzkvUXIzRWhYZk4xTHFiZkJJczNFV0pJc0E1VFliT0FHcE9lalpj?=
 =?utf-8?B?bXpDaUN4SklrenM0dnZYa1hYWnk0NUlzamplQXVHTk9uUGwya2VQa2F0cENi?=
 =?utf-8?B?Q3ZsRWNWTVA1UmNuSjhMSGhXYnVsRmpRUUQ3US85RUEzVmtleWVDMXdrbS8w?=
 =?utf-8?B?U0lKR2dITEpLZ3dnVEtHRHdNYmh6dVhDNzVtMy9TWHgrMWNENmFiSE55djQw?=
 =?utf-8?B?SnFKRWhrZTVoMEZHakx1TGU0TldWZlUxOWd0RnFHRzhhb0ZWa2hZZFlGZFYw?=
 =?utf-8?B?OEFOck9hRW1YUXcwQzg4VElEaW9ZeU1RWVdOK3hqUEtlZ05EQit1MklFZXBp?=
 =?utf-8?B?cGN1N2U5V1BpNGF1WXBnbzJBampSa1BxZExoSEErM2ozU0RyYUJVRXEwWVB4?=
 =?utf-8?B?NjgrRlhtS2t2d0ZOVEVYcWJxLzhuSWFhS090cGpRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 523d2fdd-0925-46d0-008f-08d8c37de24c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2021 11:14:30.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaOTGZrE0kvrkom80LNA0eUxP1xBYlcVL8r6UuT51wY4XScZZvuhmxZRPab4W0Pu6i97HAXIvHEgAVhK6VG5Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3372
X-OriginatorOrg: citrix.com

On Tue, Jan 26, 2021 at 11:47:53PM +0100, Manuel Bouyer wrote:
> +int osdep_gntshr_unshare(xengntshr_handle *xgs,
> +                         void *start_address, uint32_t count)
> +{
> +    return munmap(start_address, count * PAGE_SIZE);
> +}
> +
> +/*
> + * The functions below are Linux-isms that will likely never be implemented
> + * on FreeBSD unless FreeBSD also implements something akin to Linux dmabuf.

You might want to s/FreeBSD/NetBSD/ in the line above.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger

