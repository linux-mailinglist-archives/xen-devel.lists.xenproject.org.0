Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553323F8526
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172876.315454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCOY-0000hw-Um; Thu, 26 Aug 2021 10:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172876.315454; Thu, 26 Aug 2021 10:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCOY-0000ex-RD; Thu, 26 Aug 2021 10:14:02 +0000
Received: by outflank-mailman (input) for mailman id 172876;
 Thu, 26 Aug 2021 10:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCOX-0000dT-4N
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:14:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5466032a-0656-11ec-a9e0-12813bfff9fa;
 Thu, 26 Aug 2021 10:14:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-i49Y-KK4OwukeEZ5QkEZMg-1; Thu, 26 Aug 2021 12:13:58 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:13:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:13:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR01CA0133.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 10:13:56 +0000
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
X-Inumbo-ID: 5466032a-0656-11ec-a9e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgAjYnxDFUYlslYtdTTLHtg23PGbrK/JGOw7bwR967o=;
	b=YBITU7XQSV7PwYE4wM9snD+EWDJ8usdJMXA8R1HjHGVacLklUILQ9wp04vOaTTS8GZNIFG
	AObBc3Gje/cyQLswIpbffgVe9XsYXKwtOAQrbGJxeFTdzjJFT5V2kyzwMln1HyNxNWHr6o
	qWl+8McSUZ564YrcpeKZWMWZayI+QAE=
X-MC-Unique: i49Y-KK4OwukeEZ5QkEZMg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j95Jty9ROLgnQteQkxFlJQemBXJ6yYU7bYlY3eVv1YXZlmSXhmY8wk5pv3PmY+aFPpK+4XGkSLruLkN9mRtoLCDRCQuy7PzxNAWmXie0MGaCmf6OVpaQaNF58oRMJJuIx6mDzMpbEItdhCpmqnmsvuGaBTwmBr2GTBkczhy5M2ZwfFgbhO1mWvwxtrOT4J14F5KtnNO35NVrD5S3acRdKKjDQ7/eXiTS5/hci8p5O6AcjUdyjKJazQimlj6rjeqvYt/v9mExXRCMM+JL/T9F1EBCTcHcQLqe9u7GxNCMkJclRtm+HgX6Pkq90cmoU+4Pv3AEo5VZbG1o0mRtXnKJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgAjYnxDFUYlslYtdTTLHtg23PGbrK/JGOw7bwR967o=;
 b=QISyScaBeCeN8vSabzq/62BIEf+3LQ+TAt2IqbGXux5nW+l9bB1jNGjp3romS0L0MJ1NgKIqBdvN4uxEq/04xk3PPQpdYSmejrVa78/SUOWUPf+MNCGyLYwM4M/MabarIBqVLr6arBvlooMKXPgCwxoUoIOdLpqa7th9lAv2zhaX4mlGlWRkJ4uMNdEFNrFmEj5WR33KBw2atP4uRlOrbBh9uKAV6CwkhN2DCXxOu2h5lCmcLuQ6iNqcBnx+D3RBS2eN7JBBbe/Jh61ZOV67m2ZchSPvfSKqeN3L0MF5Jq3MfTg3oYs0+GFaedJ5uJqRRLKWIWMJRyWcNqR1lK/78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 6/9] gnttab: check handle early in gnttab_get_status_frames()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <049c4f02-2af6-542e-cc51-5c245f33341c@suse.com>
Date: Thu, 26 Aug 2021 12:13:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc5b4c60-3f3d-4734-9dc9-08d9687a3716
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942773468A5F80A07C5F366B3C79@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fv8pX/CwJ59DNDdJVmJzlkCWtGofqLLGotMOc0cpslBJ4vWeINZ2+azgYCJ8+n7u8f4Yx3FjZ930pLmrNk8X5TB1iicwIhjnS1uCwVWepaegxulQm0Cz2erhnFpZuun1wuRtljXM9rmebyA5TEtmC+6uBBg5cNP1uWN05ThPTVz9RrbVcIRRGBDNVaoWvgjQF1wJJKuQu7lk6eyYoZwoRzcTWRBAxAHbEiy0181ueANDtmWm7H3D03VCp746dCSTy2C+8g5ol9YdWZkK4iDDy7COwiakCmA7a1PJIG6YeprcNMdqmEYPND4+bvA/sTb6dvJ6yy64UtgNNiFMUK4AwswVYTwwCL3IWPOOSBs4F+m7IxHyfKQZqTLjCda2SKFzCAKVb3PXFeuF5u4nZgrxoImNPOe+Z/uiPdNGqvYJgPLtVIb8BkThW8kQwclUtgOEDyEUrRlXoJbguZo+1mkUxFIoumqbkMPn/nJGXHBHs69LownrlBfX+bQ9SxRADP/n63lOPYHd5IdL15byyFXygr4Pz0gs5wUay8i78VlecdqW1xoAALTI0eLyaLLdRAEVbDJHaYV9yp3V804CtwSuMl8z5ytgH3jQWpvE1FrqElN2ZNCFM3rXoW0HtoGDjtMfAjq8SghE5ss0b449inwhs00FJvCJI+3sRAJge2M74aXyLyd9gkdr7xIb0PqMcac+LaezBBV/U6iGiRXX82FRvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(396003)(39850400004)(2906002)(2616005)(36756003)(31686004)(8676002)(54906003)(26005)(6916009)(5660300002)(956004)(186003)(4326008)(66476007)(316002)(8936002)(4744005)(86362001)(478600001)(16576012)(31696002)(38100700002)(83380400001)(66556008)(6486002)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVdBWFgxb3Rmb1J1WTFnQzYyTy90S1VLZXBOYXdZK2tsSi9hQVhWTE1BZWRG?=
 =?utf-8?B?ZXo1Qk9hb3Q3WGVWcnY0d2J3UHdZeEpvUHJzdW1XdnpZQUZRcnhBWUJjcDRH?=
 =?utf-8?B?anV6YVdQMGYzS0hjSTNZcFVIdEhKVW5YTkg2RWMyenBGbVF3NUx4bCtlUTFk?=
 =?utf-8?B?TW1yeHByU3RVMlh3WWVSTC9pa3NndEVRU3I4MTEvelNLWjVIcG9iZEVhZ0hD?=
 =?utf-8?B?WHFHanhoU2JSb3ovYjJPRmJyd2MvUnQ4SVErak5Tc2Uyc2VmWmIvV0ZYZCtn?=
 =?utf-8?B?V2VQR1l5Mi9MUEp1d0VsUG93YlFlK2hHYlM3NTVhVkEySjBjREF4QVdOanh2?=
 =?utf-8?B?emYzb0haQnp6Tm9XemRCREhsYUx1QXhFSW1EQTMrb1E1NUpnRWl2VTBNZ0tB?=
 =?utf-8?B?Q0l2YmY1cFdydGFZdGR4cmpyVUFjU3RteWJDN3RFNStDVzZtSmJnbmk0dzBP?=
 =?utf-8?B?TlFudXFQMWc3WHhUZGx6QzlGZ2sxV0MyM21jK2lhcjNoVytWaFB1UXRuU3Z2?=
 =?utf-8?B?UWdsVzBXS2NoYUxPM1BaVU1jR0FZZXVJZTVsVmJua0FzdTJ2QXJzVmhzMklM?=
 =?utf-8?B?YkFMOXVUSnhmRHhIMU5LQ3JIOGlKVkR0Y251dmN6NEJsSHFjZzFHdmxCVWl1?=
 =?utf-8?B?emhKajZHQXpkVVU0ekRvQStQdzZJYTV4SFVDQnRPa1MweWJmTG9KY2xWd1Iy?=
 =?utf-8?B?TFhSUVFxU1dtbjY4VjFTcVNKQlNudDNuSUIvcXBJcUVYMU0rblhwNzNvQUtG?=
 =?utf-8?B?UU9KL0VGdVNnWkl2UCtjKzdDakljY1pJMzZ4NEhxVVBSNUVqcFhGZlhQNFZx?=
 =?utf-8?B?T2JFa0o3cm40bnUvcVJlMjdoS1ZGZUFUS1FEUEZqSE1TRzByTEcwTXZ2WnB1?=
 =?utf-8?B?M1ZFeUluclFLNzVwaGJUK3lrY1NEUVhKdkx4bGZta3crb2NOeWgwMktzUklr?=
 =?utf-8?B?b3ZkTUhtenUvZ1RORXZ6SFFYcWx5OVVkdnRHV2lnd0wydzQrYmUzN2pKRFBE?=
 =?utf-8?B?Z1hxMjdWdXlzRW50VTdNdGdjR1BCbjFOYlNhdmZDZmQzekhDc0xGUmhhaVpv?=
 =?utf-8?B?Ym1DNW4wQmRyTTFoWFY0ME9xVmVrUGlvcXNQT3QyRHViZUJiU0hwU0NZdWhR?=
 =?utf-8?B?Tk9JM01xbWdNMFVDVkhvZS9mTTNRRjVGZ3p6RXZZQ2Z1aTVPcXorTmx3bTRt?=
 =?utf-8?B?Y1d4KzUrOHFhVUtTdzlaL3lsYUQzTUQwazFLdm5aZEFFMm9sZnk5MU9wdmMv?=
 =?utf-8?B?V1FENDVESTVFS2ZldFZkSmFvVW1wT25ucnU1cTN3SDJFQytyWElEaS8zeUNR?=
 =?utf-8?B?MzRHNDdZSDFGM3FMZUN6Q3ZnT3NzdU1rN2dVVmNGOWQrL082RG9oTGY3dTVP?=
 =?utf-8?B?SGcveXA0QjBpL2hVK054UW0wYzBGRTZMT0MrL3hncGxMemlOVmxHd2taWkxL?=
 =?utf-8?B?WGdPU3IrODE2V3BRaHVPN001OVJMdnJUQ2ZnQkFEL2VGeWtWcnpyWjU4QUYx?=
 =?utf-8?B?ZFU4Q0ZsVUxhK3o0cVZybUJ6aERic0F5alI2WFk4THFKU0R6UVBlVlJyaTVT?=
 =?utf-8?B?Um82bnBveFU4WHZnSnhzYm96RU9DbVhLMnk1WWlVUjRnSnlIYVBnRDJmdEFP?=
 =?utf-8?B?OVdUZXlNMFovSzNhVjE5Snl1NEJlOEFkTkVSV2phYzRwRjM0bWl5eHB2dkxs?=
 =?utf-8?B?d1VuS3FPSEk1K2U1bnp5Z21jTnFxTnNoTmVYcnJrNXdSWW9vOTVLck5UQWJI?=
 =?utf-8?Q?5+4nSySr/CEt0ozIdmOcVOQHJBTuy6hd4AMzQjR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5b4c60-3f3d-4734-9dc9-08d9687a3716
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:13:57.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwckOBqNmcdm1soUuR2pH3UplxTFOmAM903fjczmIB+9EawJk93/BeEMVj/D6t0+UjfwoD5XHXhWSIK7FVJz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

Like done in gnttab_setup_table(), check the handle once early in the
function and use the lighter-weight (for PV) copying function in the
loop.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3261,6 +3261,9 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
         return -EFAULT;
     }
 
+    if ( !guest_handle_okay(op.frame_list, op.nr_frames) )
+        return -EFAULT;
+
     d = rcu_lock_domain_by_any_id(op.dom);
     if ( d == NULL )
     {
@@ -3301,7 +3304,7 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
     for ( i = 0; i < op.nr_frames; i++ )
     {
         gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
-        if ( copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
+        if ( __copy_to_guest_offset(op.frame_list, i, &gmfn, 1) )
             op.status = GNTST_bad_virt_addr;
     }
 


