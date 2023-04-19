Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1D6E78DC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 13:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523366.813347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6FL-0006ym-Hu; Wed, 19 Apr 2023 11:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523366.813347; Wed, 19 Apr 2023 11:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6FL-0006w5-Es; Wed, 19 Apr 2023 11:45:11 +0000
Received: by outflank-mailman (input) for mailman id 523366;
 Wed, 19 Apr 2023 11:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp6FJ-0006vz-VY
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 11:45:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0cfbf22-dea7-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 13:45:07 +0200 (CEST)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 07:44:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BN8PR03MB5121.namprd03.prod.outlook.com (2603:10b6:408:7e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 11:44:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 11:44:56 +0000
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
X-Inumbo-ID: a0cfbf22-dea7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681904707;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Y8BGdEJ3QQnufhepIT7ms4V5yYFycjifquAfuOhsTK4=;
  b=Cz+RO03QXv849c+5vnIiIkUF1ZVp6l9tTUtXXn0ka/DuVX4IsXod0JhI
   jyDErCI1ilkbokM6F5eBCfALcfHV5UIGstMp4+JBA7Gq77pwxBqKV2ujy
   BjDtv/YYACyjDZMLhy+YHG1ZJaTh0vgxKbv61bDtf1izHu8+1amlGfZXR
   Y=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 104864156
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E3eQzK51az3gxTr1IEECJwxRtB/GchMFZxGqfqrLsTDasY5as4F+v
 mRJUT+FO6mOZmHxeN4ia9/j80wO65aDz9NkTgtl/yhnHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPawS7QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 K0CMXcmXAq6vePmxbubcOAyh8QtM5y+VG8fkikIITDxK98DGcyGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MkEotjNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXwXOlBNtPStVU8NZ20W2IxTIRFycVbgS8ntSL12+7SoxQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBRw1V5dDm+N03lkiXEoolF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Nj5zL6vpEmCDALHKQxQcltoC7skDUdV00zEX/kB9WHVpm5Sj5q
 WTdYcgpHvJYVcqKQodcL+7WZVoLUmwyXcx2/hyAV7AZnidhILLFuFfBOLZqlWKcREWtNQttp
 uIGJITNDSENzZHZLHBjzVQWOxQp+VvuJrY49v23jNmFhhwbatt9R10BwCBHCRNNXF77LQCZe
 Oh2vY=
X-Talos-CUID: 9a23:agrXrG6Vvvnl1drGidss3R8OA4cOQGfk9naAJkaYM283Sb2bVgrF
X-Talos-MUID: 9a23:1fRN8QvQq4gspw/CdM2nmGBSL8Q24buUC3tSlqoriZSlMD0uNGLI
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="104864156"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjH70qYoosI1RLRxb+BUoy5DAUlN2UIL1R5R9XzbskWQFCmWBVucma/eT0hUk5WK3B9uf0u3vyGgOceg6C491tlxZCZK36e3na3BnIbpDAaOjjmM8XHNZcZB6bnB7GR9A0pA2lz2QWSucuKHo3+2CoVHeTLBTpqxj9FaNTkdsLyC4sqpvdnTmwyizCFGw9tSXYYwKs/e2AK0KCrYz5YrqqmYVM32d1IPy6HOPxAw+tkrwpIN26LBYLUW+sZBXc1FBkizg2ciTzspjk8Glb1W8ML+kyvKopgZ7F5xOn/Pvn1JkHQMGyt+iKiyh5XdxAPevzgugsTYsNFF6Xl1F3lezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3isFPEO9Mtsln/cHqi8ql12EhebXSOOgUxQ4vgrp4nQ=;
 b=Xkj3Xd8jgASV2i6QMKcQDAWlBOc2jztfnU/sU6cmbrTukbLNpnqC2gyX+yLhaxiQptilepdcqQLFSXyqMPGwai+NhsY397HFvBjbTyJgFrsW3+9G9oPm5sMcaFOKlJ4jsoQ3qbnJE8Ib1RJOd2gMOA9D40WKCRA50spgzfibyU/DiFpgrdbIQgcJNydgLCcsg1LicNOTkXrioZF3xMSy9yIMuSyf3cJnMmq8h//jLNnv5/d909EoCPXUX9Hn0C8rh5N7vTwxBVEA0Kh8UdTS1k3XW0yFPglPIu7gYMYx5ZlcswnMSv+KcRIO1K4lwqP8QjjJUjNivwYpuYTW1OlhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3isFPEO9Mtsln/cHqi8ql12EhebXSOOgUxQ4vgrp4nQ=;
 b=N2iHYDP5bRapSoQIfWXkOec6AkkWjNKOuOlWEL4sapqFtVZZRpF4o7fE6Q/VCE8di+/GLoAp6zv7Zr9Kudtn/IXHvmvpULv0zZUn9BevL4IKZYRCWEFZ0SRT1V9rgJwX4weznkYnIOEf+w6O+hjz0NY00X/7WQkwEWb5Ldbs0AM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 13:44:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZD/UMyeckvCq0ivf@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
X-ClientProxiedBy: LNXP265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BN8PR03MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: a9dd60d1-6814-44b6-f7e7-08db40cb7f13
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N3E8TBwdErulZ0O1uEcXXp3SjtVv9TnNjtM3p0Uo0CPITUuxDetyT53BBKfW1ZpQHuhU+/ZS4ZcwLycPKE9j7Tih+/APfqwL6/+dIoLCvTBsE+uGtwZtcEXRYzBz0u4yxCT0AgnXpXpMlTC8qo2B8PScHck3iicLBPAK3EP028QMjD0NDg/8JkerPLBLqxBNSWb5maG5Qq5P2hzM4Vdjoua1foZSll+4z0maQa9PeD5zqLTDDuh9c/4Yvw+kzEfWSPGKYk6Cq4WN4KxDsIrps34fYQKw5ttCOhsSK+J+Ak+GboQJWjjYcwCInXh4PRmfdvRjAY6Nbl+yNOG5GNa0dj8uTUU6EupqmUJ9FCBF2K1WydO7OlqRkRRxrkBXvSUrSZDn1rQba0MyGXh9O6EZjiMtKMGEHw2zzUelLeylKBivFlLF4fNB7wk5QsZJXFbEtHWMI86q0nMHAnfMp/1+w0lSFepLyB7u2W2S8BPZhaOooI/z3VyfEeOfHDVlMBH/gadru2dZtNG+dh3pjc7/Mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(6486002)(33716001)(54906003)(966005)(478600001)(186003)(6666004)(9686003)(6512007)(6506007)(26005)(53546011)(5660300002)(2906002)(66946007)(6916009)(66476007)(66556008)(4326008)(8936002)(8676002)(41300700001)(86362001)(38100700002)(85182001)(316002)(83380400001)(82960400001)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxGVVQ4UmVhUUVvWlFjK1htS1lzVXR1RkhKSXQ5YlQxL093a1ZBRXB4MTdM?=
 =?utf-8?B?STA0Q3hZSkQrOVYvTkpLY3VMdEFJODc2akIyZGVyais2djN2eVNpWVlrMGZl?=
 =?utf-8?B?WXo4NEQ5di9MQ2FVaDc2L01tdXdhcDc2ZFlwQ1huVkpZdEQydzFHb1Bodm9l?=
 =?utf-8?B?ZFZXUWovOVdmVGVDajFtaEdyOHNTSndXc0dTMU9leVFoVGErcVhtMGFjZm9x?=
 =?utf-8?B?QjZGcWd5WHV0UFQwR0t0dFNNbDFhajZHSUUzRUdldFdpU1hvUjRtSm1QOWtw?=
 =?utf-8?B?MlBtQzlTS0pQUm1VYzBidFJ6VTRjTU1tekZTQ2RqSWh0Ym9HSTdsQVpuSkNT?=
 =?utf-8?B?bEdJaGN4a0JDdEQ5NDdYeWZxYzdFOFBWcTFtT3ROOUJRRjdyQS9lWWhydldN?=
 =?utf-8?B?V3ZPY0x0YlN6ZlNRY2k3dDNWRjNiL21aQ0ZzWXVxT2dzdU5yemZuNDlHT3ZJ?=
 =?utf-8?B?d2EwWk5sZWtvSmZFS0VWSW8yeFc4L09ZRElQL1ZHTUd4a2M2U1NjSWR5VnVF?=
 =?utf-8?B?djZEWVNlVHJrK0tuSTkxelJUeTBuZGhIb0VZN2lTd3NQTGRkZEdLc29CQzdP?=
 =?utf-8?B?ZHVoMTlGdkNVSFBuaHdZVnJFN2hNUG1UaERIMm9mbnJrMEJQQ1A5d1hLQ25h?=
 =?utf-8?B?RGhjSFFhNHZRMGNGaVRJTXV5YzUwaHdOVmJPUnBSVjdscTRHRE50RWVkVUpC?=
 =?utf-8?B?aTY5Zkt5bE54K2VHMTl0Y1NMYVBuMnRTMFF0bWpYWGlBSlQ4MmViNFBjbE1G?=
 =?utf-8?B?dGsxU2NlbXQvMFM5SUhhZ2lhNGpBT2FHQ2ZVVFk5NVAxbjBkaSs0QTdrVVo3?=
 =?utf-8?B?eHh1Zm5uemVjelBRNnJEQXdwSkZjUFlKek5FRmJaT3E5WndnbThUazhSaVdu?=
 =?utf-8?B?U0ppcHExMUhlVjRTWkUrek9ZWUZKbkdyYlZUZk5NZ0I3RXF1UlJJZ3d6YjVJ?=
 =?utf-8?B?bk9HcmFkMEsxR0oyNTVSZ04yZ1A1Z1IxSlhBblVZTzNwYStqUGJ0clhIVnky?=
 =?utf-8?B?dVBTVko0bFJiYXFKVVFNRkFaaHArbXZObnpENlB0cU1HRGV3RkVmOXhnaEl4?=
 =?utf-8?B?dmRhYUdPRW1uaWM1ckllNVlDVmhtQ2FKZDIraHlkcTZVdlhieWNnUWRMaEhi?=
 =?utf-8?B?ZlNIeWRuQ2R5RVRkVnlRRGxROHF6VFJuOTNqcGdTUXYwMVFUdytlbVdheUJt?=
 =?utf-8?B?NE9MNW1VQW1UWEl3K1FVWUlSRmY3SWtyZGlZRkQ1Vmw4Y3RaNVVlc0pOSGVL?=
 =?utf-8?B?M1pENGtrQVNpeExtMjBISGhIZEphWUNzL3BWUE1RZzN1STY1TE1ENndjMWNX?=
 =?utf-8?B?blBzZWo1b1h4ZEhtVStKNnZmeDdBd3dKZDl2dkZIOWMyVTZEQ1VmVncrYndj?=
 =?utf-8?B?ajVxUFdFVjFwdHRXRGJ4YXV5Y2FKUWdBUEp5bFJOOGlxbjRQUWNWeHRldE5j?=
 =?utf-8?B?NE1rczVYcFpZK2xWQTlMaEpkNFZGdnpQWWlCallFUXlLOW1aSTdBSVlFL3gv?=
 =?utf-8?B?Y2JSVW95VlN1WXQ5NTlhWHJhL3Y2ek4rMUNWNmw3TG1FKzlnRzIzZDNsRHFV?=
 =?utf-8?B?cFBmSFcrZ2k0dzhVVzJLY1BwYnZTRDgyQ3pWekNMYVZBTTU2OFd2UXIyOURz?=
 =?utf-8?B?ZnpDckpTVzRjVjFWaUJtVnRnUzFTd01RdDMrODI3djJpR0dEUmo2YWhaVzRq?=
 =?utf-8?B?d2dDbXg5YVF5U3hvR1I5UFozbUVUMktxNmhiRFFERXlwd0dhendGVXYyU2hi?=
 =?utf-8?B?MjBLVjV3dmVxKytvTEZtYkdKU2JBSUp1aHVwSHdHRjhiNnZHL2ZKeFN1RG84?=
 =?utf-8?B?QmZ2V0J4M0daSG9zUEphdUJNdlJ4TzBpNkZiVTBtbFJEdTRMTjlVUDJnUndZ?=
 =?utf-8?B?Skk4eDIzbDNMVTFwQnl5ODFoTTRoN2tGV2YxQzhadjFJbElzaEo4Wkl1RjU2?=
 =?utf-8?B?dlJiSENPZ3R3bW5tQm5wTDhrZmVydUh5aDZKRFJBa2RIcnpBTERMN1Bad3A1?=
 =?utf-8?B?b1FIS2RhWHhMUVRGUmFQMnRwMDdpd1AzajBLeU9BTDYwZURacWxWUFlVcWE5?=
 =?utf-8?B?dENRa2dQdkFQTmg0MkFienJEWXlFdDY3TnVkZVNjeUdVeTdyUFRIYW9sNnA1?=
 =?utf-8?B?bmJqdHZvQlFSMGRvVUhTRWR6TlRZcUdiM0FlamRIYjllYldSN01wN3RGZkpG?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wIheP3Wxm2hae8X33YssYFBFgb1a9lAy/GO1mb87hvFvN+ENGpT7qzCuAo73Myfd7AEhZ5QN0aIEWhZ1g8DqU9uQzwJUAivakwjn9BQdWdymWnxUCmVIhBqjc6fIb9ueE0Q06fYzXMp7+zPMlmHriBMrOnrs15nehIr864bWYVWDqU7ezCC3ESR4ANp9Rikm7lBC4V+/VS2WQQTIyXUPyKuhsKpNOOfEJA9TTtGqT2KGY0zBR9CaF04Hn/7ltmbJ3U0yisT4wbmYodN6zQ02KnbUtLAP8RfoNK8tW+8Z2umsrCea0cIQH2lNQbssZuijkZCDEJUm6HK2zt/h6WkLplKJk+wCtesi0ODLwYWkxuIZf4pqFkYBVAJatTVTcVKVA9x6jbw6l0yTzCf8VBS2imAY1in37/yL5SFeJJom9I35wbhCqgf7o+vu8HD/5PoM/ofghNWw93O1IWmB8JESKK3Tb5O6rPLqHRkKV/FLVRE2BBK2ltphTrEUCyN4NlO7U0vfTb00LRAqFlV9CuNFw8glXOMkUto48IbisgYGsn3TbS7QdtNpFBQjbXFvrH8wWL921WXSWRZUWSn6L4ptQzSwqZH+rvtW0kzAOT1xYF+XRg325IVqe0rzAco4t6W/vmJOrUdJnDPiO+B5Fya/Li4U63BTmo92hv3kA3Cox9aiC8g/CDFh57SRuQ/Ym0HK4F5Q+W0itB6ag36mCldtj0H9qc/EOutarBJJdGAeyvIizVjJy61Kf1nW1NeIEGzql3Gat63uWp6rNnp/HfTYbPynZQ5keM92ceKkmEOeOuV6fbSNUzVzhqEmR0jrARQi7fVDESCTLOO1nbwIN1mCUA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dd60d1-6814-44b6-f7e7-08db40cb7f13
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 11:44:56.0654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxvMMriiAHCInlCRZDVt0ngz8zTrWfuwKnDfDgNWdBvEgmBm2fTJIRSow00UDHNc48WRuJ95/xSUIcPsCjt9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5121

On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
> On 19.04.2023 10:25, Roger Pau Monné wrote:
> > On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
> >> On 18.04.2023 15:06, Roger Pau Monné wrote:
> >>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
> >>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
> >>>>> --- a/xen/arch/x86/include/asm/config.h
> >>>>> +++ b/xen/arch/x86/include/asm/config.h
> >>>>> @@ -44,6 +44,20 @@
> >>>>>  /* Linkage for x86 */
> >>>>>  #ifdef __ASSEMBLY__
> >>>>>  #define ALIGN .align 16,0x90
> >>>>> +#ifdef CONFIG_LIVEPATCH
> >>>>> +#define START_LP(name)                          \
> >>>>> +  jmp name;                                     \
> >>>>> +  .pushsection .text.name, "ax", @progbits;     \
> >>>>> +  name:
> >>>>> +#define END_LP(name)                            \
> >>>>> +  .size name, . - name;                         \
> >>>>> +  .type name, @function;                        \
> >>>>> +  .popsection
> >>>>> +#else
> >>>>> +#define START_LP(name)                          \
> >>>>> +  name:
> >>>>> +#define END_LP(name)
> >>>>> +#endif
> >>>>>  #define ENTRY(name)                             \
> >>>>>    .globl name;                                  \
> >>>>>    ALIGN;                                        \
> >>>>
> >>>> Couldn't END_LP() set type and size unconditionally? (But see also
> >>>> below.)
> >>>
> >>> I see, so that we could also use it for debug purposes.  I guess at
> >>> that point it might be better to use {START,END}_FUNC() to note that
> >>> the macros also have an effect beyond that of livepatching.
> >>>
> >>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
> >>> find START_ENTRY a weird name.
> >>
> >> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
> >> I take it that you're aware that we meanwhile have two or even three
> >> concurring proposals on a general scheme of such annotations, and we
> >> don't seem to be able to agree on one. (I guess I'll make a design
> >> session proposal on this topic for Prague.)
> > 
> > Oh, I wasn't aware we had other proposals, I've been away on an off
> > quite a lot recently, and haven't been able to keep up with all
> > xen-devel email.  Do you have any references at hand?
> 
> Andrew said he had posted something long ago, but I didn't recall and
> hence have no reference. My posting from about a year ago is
> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
> Subsequently Jane went kind of the Linux route:
> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
> 
> >> One thing needs to be clear though: Macros doing things solely needed
> >> for LP need to not have extra effects with it disabled, and such
> >> macros also better wouldn't e.g. insert stray JMP when not really
> >> needed. Hence I expect we still want (some) LP-specific macros besides
> >> whatever we settle on as the generic ones.
> > 
> > The stray jmp can be inserted only in the livepatch case, if we end up
> > having to add it.
> > 
> > Maybe we should just go with Linux names, so initially I would like to
> > use:
> > 
> > SYM_FUNC_START{_NOALIGN}(name)
> > SYM_FUNC_START_LOCAL{_NOALIGN}(name)
> > SYM_FUNC_END(name)
> 
> As said in replies on the earlier threads, I think these are overly
> verbose and come in overly many variations.

Right, I would only introduce the ones above and as lonog as I have at
least one user for them. I don't think there's much value in importing
the file wholesale if we have no use case for a lot of the imported
macros.

The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
need a tag for local function-like entry point labels, would you then
use PROC() for those? ENTRY_LOCAL()?

I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
think it's clearer.  I would agree on dropping the SYM_ prefix from
the Linux ones if there's consensus.

I would ideally like to be able to make progress on this before the
XenSummit.  I think we all agree we want those annotations, being
blocked on the names of the helpers seems absurd.

Thanks, Roger.

