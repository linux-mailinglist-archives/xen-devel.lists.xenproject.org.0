Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343AF50A0A2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310177.526885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlF-0006wQ-2C; Thu, 21 Apr 2022 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310177.526885; Thu, 21 Apr 2022 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlE-0006ui-T0; Thu, 21 Apr 2022 13:22:16 +0000
Received: by outflank-mailman (input) for mailman id 310177;
 Thu, 21 Apr 2022 13:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWlC-0006Vx-D9
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c927209-c176-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 15:22:12 +0200 (CEST)
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:22:08 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB3771.namprd03.prod.outlook.com (2603:10b6:5:4e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 13:22:06 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:22:05 +0000
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
X-Inumbo-ID: 0c927209-c176-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7YRqHDhmiB+IydPusKoIgSDWAyO7QgBP+ELxznFDh5c=;
  b=JmIhSHxlm5qiBSlCKzebWCHqqMSLBEsut4GX5tUyCrnTnyWyd5w9ak4m
   mGbcRC/ZLKGlTMH0W/naa3FfLdw/c4wUlUVtYHRpo0vZ0GLK6vaeHJYxk
   k96n6cHoPSnXTKpDvc4iBiUlUPcwc/TuQ7/sH7gXrFLn6heOaHkppiSQJ
   c=;
X-IronPort-RemoteIP: 104.47.58.171
X-IronPort-MID: 70011025
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8RXj2q4tLis4+CHsbRL/UAxRtCjGchMFZxGqfqrLsTDasY5as4F+v
 mMeX2GGbPeKMDbxct11bIm/9xsGuZKGm9FmGlQ5+H81Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSXZTZyGIbPx90MCR9JSw1DJ6JD/+H+dC3XXcy7lyUqclPK6tA3VQQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiao4YHhV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IA8AvM/fBqi4TV5F1IwprGG9bnRtehXZRxn0rE/
 334oU2sV3n2M/Tak1Jp6EmEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVQBmQsHOC+BkGVLJ4EOAk6QfL1qvd5S6YAHQJSnhKb9lOnNc/WDgCx
 lKP2dTzClRSXKa9THuc8vKeq2O0MC1MdGsaP3ZbFE0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:+a/K06MGtWJsGcBcT1z155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj5fZq8z+8N3WB1B9uftWbdyQ+Vxe1ZjbcKoAeQZhEWiNQtsp
 uIGpIWYLOQMbETt7eB3ODSKadE/DDoytHKuQ+IpE0dNj2CJpsQmTuQTW2gYzxLbTgDIaB8OI
 uX58JBqTblUXMLbv6jDn1Ae+TYvdXEmL/vfBZDXnccmUGzpALtzIS/PwmT3x8YXT8K6bA+8V
 Ldmwi8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+4EoAwSprjztSJVqWrWEsjxwiOaz6GwymN
 2JmBskN9Qb0QKlQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgYdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfJsRLQkjQ1o+ao7bWPHANhNKp
 gvMCic3ocdTbqiVQGXgoE1q+bcHUjaHX+9Mzo/U4KuonprdUtCvjQlLfwk7ws9Ha0GOud5Dp
 z/Q8JVfZF1P7srhPFGdZA8qfXeMB28fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="70011025"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yz8tz8/wYqnSSm2dd+E14l3meHqH+KAgQeatEidikiTeuMqdD3ItGR43OSSV2J6wQRQk7LhI9zoacsGtz3lQjjyM/LBwwbq0LQM3T5mhWS+SDIJo3f9HCbHgA/6r0Wuc3YmES/MUxsJm+Ozdw26BHphYE5u8ktSgCIlocx5fj9zsilotpSfKIaTzzSTehpJb8s6rRml9mDwLXjoRmGrp+zD/f7swEVEyzAoIAAajovOrfKTFy0x5CIYGHF4tcQTRK+QcdoySndS7MAmCWA487UoEh1vYgJdO8lxJrMw9a6QHrUEaazY1PoMPd0OUYdoj2OAtwvu0MZFTlO45jiN5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOHBZEpDF09Hk8lNie+2sWfpJc6zb8jWHm0gVWptEBg=;
 b=FnaorujnPZQnF7NWlwqXyTvDuVwOd/BVXzGjkUUp6JKqNkfwaj7MXSNB/mtrIZuAAwiUIsjqCLD7ywk80tA7E27ltEMcRdxD75u0/gD57wkSoBIjaaeXgIahGIghI8E5ANUh/98RxfRlGbUF3po/KoveHOeS3Gzcizcx1eQaCgJxXHw0Xpd4bH9uQHSkMmMbw+AMviWE6bfBXiYrRQONu2DJk+vJiUZcVJtZDp+In1ryrfnOgDlUqwZVnZNJU+F11uX0VUP4DZ4IPa1O3MksTdjLZSvsYMGHJrcMhntC51f6FeCEnTBBYzmTt+1uQ/v056NOn+ClqELz73xMquKEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOHBZEpDF09Hk8lNie+2sWfpJc6zb8jWHm0gVWptEBg=;
 b=xctScZo3c4pVpyBuWmLr8XkWnV2xokWr9gqyXejnuejkrRtG20NicwpTD7vG5vMcfYY5zL9ZurLs7gEP4i1lV85Y2xHIEZGP2o+KNPiBm1SE3kk9VLdodciFFjWo4HFGoY6JKUgNRAELLZx5sUnYLUWSaZBvj96DRGE7MvI61K0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH RFC 4/6] x86/iommu: pass full IO-APIC RTE for remapping table update
Date: Thu, 21 Apr 2022 15:21:12 +0200
Message-Id: <20220421132114.35118-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0082.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e04b4fd-75a6-4d76-19b7-08da2399ee05
X-MS-TrafficTypeDiagnostic: DM6PR03MB3771:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB377123953A733FA3A6F4068C8FF49@DM6PR03MB3771.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gdR8h9qMAnOoKhH5lTxbtJ1I1ck2zoVcA0v0GL9WbW9JAG1Wu6IGNHTBTeLcMMZzDlCIzTkW7SMOrEghwq8H1FCmTShASSM9zDC1mKrAx2PSK+xmtIDSnfXIp/b0cDTZFuHmsxgb7Td3iKkkzQQIDTM57LDGwzg3dfQoaRc7bp+jik/fUDIcQ6ICI98OBEe0pUX5mjdFEC8PtaiyTVyxFtIG2ecKptEyd02gPRENLKDk1nBTIcVWm6htkWV8JOesPOfiKOV/QHo5No+BapHMQNliDDhs7O/l1tXrUTmGAFMBheInux6a5WX1Daupo6NaL1TOEJiHLhmZSv7FM+76f4lE1whxqQhJt9JNWfUqeQUL/hkDZil46EA6TxMcGotwGGzxcNVj1y4UDsB6yeVrS++DQ/GeeITqcGOsamWrTEaPSyce6E67R+Eufpgd0b/p/faI+DlbdAiUc46ivHBCYlqk4XyXkQAwinKS1/f86Y6Kqf1P+zxBfu6BlvWaTUOrKxgMEcJIY5OGFYgq5c4U3Rj3ko0XbHKnRaHoM8poLGhW/bURBSY7FX3nW2hrdcIFEp/mEjAu3RTugYj6axo95lHZzlYwzQS4aU3hwJ9hZS5E9LNeim2X0VxStxYvxnD36vgNaa0mo5VgkHQJVVwmgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(82960400001)(316002)(186003)(2616005)(26005)(5660300002)(30864003)(83380400001)(2906002)(6512007)(4326008)(8936002)(15650500001)(66556008)(6506007)(86362001)(66476007)(38100700002)(1076003)(8676002)(508600001)(54906003)(6486002)(66946007)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGducFVjd2pvbGIvUFJSYTV6Q1pnWHpXekN1Slc3UkdJWEFXRDh0OERncXBu?=
 =?utf-8?B?a1dXRW1TcXVYcGc1dVVxZW9NN2toOWNiYjBvelcwcFZiUmFjLzVKMmdwcHFS?=
 =?utf-8?B?VkZ0b2s4T00zY3huOGl1Y2RBalpHL3pFSWh1cFNVTUdXN2tHUjJ1KzU5aVdU?=
 =?utf-8?B?dG1nTVhHRUR4WnQyOG1wVHVvYVpjK2hUNDYzMWsxNHJEbThQRDZQaUZ5MW1H?=
 =?utf-8?B?dEJmbnpJelZWT2JmQ3A4dlBrcXMxaGFGYUxsWWE1dlZNYmcxRFF4T1E0a1RR?=
 =?utf-8?B?ekZ3eFpaNHZYdHFWR0JFWjJVV3lJWU85R1hUTFVDWEFWNnQ0SjZ0WHpGV0V5?=
 =?utf-8?B?MDMwL0QvOWxrcGFSNG16Z3BGSTNNcUhxbEdTNFoyZFgwbmdPYStSTUhnZjV1?=
 =?utf-8?B?MFREaUt3Mno3Y1BiSE9kdnp3L2RMR1hqSzRlcmF0SzZRbkowRXpwNUY1WmRK?=
 =?utf-8?B?SlcxazQwUDN4WTgzc01HZHkyUkd4QWhtUXAvTmx6akI3aFJIYkpyanJWRE4x?=
 =?utf-8?B?VVZnWDA2Y3BySDlEV3NzK2twVGZGVVZDcjFXcDk4Y1NpRTI1NmtpRUE0ZW91?=
 =?utf-8?B?cDFjcktZOWJnVDFCTjZRZXU3cWlyV0lONkxuR1IyQ29HMU02YkoxaUY0NDdl?=
 =?utf-8?B?dWMxbGtNMDFELzg1dkRHNU1zVDF3OE5FSWRmL0xSUS9sTEdBOURyYVVYK2JH?=
 =?utf-8?B?RFA1bzBtbWdCR010b3RuTVJnUkF5bi92cU5hdFhWUVZMTlAyM0src3I1RkJi?=
 =?utf-8?B?bjN0Vy9wRTJKZHI2UUhJcFpFUFVwT2ZjekZyemYvWjNROW55RjEwQTBLZGpH?=
 =?utf-8?B?RTVFclJVU3lGMEpmSDJlcTMxZVY4UXZHRDF4Qy9OaE05TzJIblk1Y3E5em1y?=
 =?utf-8?B?dWVqWVROZGpmb1FzdHpYSnNBMkpqYXhJT1hDY2FWNzJiM2Y5UU1xcjZsNjlh?=
 =?utf-8?B?ZVRVUllVbzR3U24yQVVuSGsxajNVS2xhMTFsVzVYUkl2VlZsaU1DNmMxMlJZ?=
 =?utf-8?B?SWE3T1ZXMFhrb2JxMmszMjRENzNmdXVSQ2kzNVMrY3ZUU2VObkpvRTYvK20v?=
 =?utf-8?B?R2FrcHhYYmN4SzllZmlVbVRoeG5ndTNBZGZnaGd0RE5SQWFBUEZNYlR6UkI4?=
 =?utf-8?B?aTY4UTBDOFVoSFRhVkJzZzJBMHEzdGF0MGl4RzlXOW11Qjh5N21VQXBrdzk1?=
 =?utf-8?B?Q1EzVUVIcm5XVmJPUk45VTA0dS9KQnZyRzFtaU54SWhqYWN5ZTdKVktmVHBn?=
 =?utf-8?B?MDJpbmExdk9PTGk0WEMwaGZrYU1GcG1yYnpidWJZd1ptenpOd0p1cE5EWm9I?=
 =?utf-8?B?amtNMmRCc2ZvOHFUZk42TUtWWTJnWXRLS3A2RjlhMlJMN3FRYllBU2F0dGE3?=
 =?utf-8?B?aTNIUWdSN3JBTUYxUlJuM1FFcDlEWEdaT0VEc3hrQXMxQnBic2hTOXo4Ui80?=
 =?utf-8?B?dVlFVWdDbmdjOWpDU0U0aXk5NUdDZ1FuakxqZFUxV1o3N3lZZ2RqSTRuOGxC?=
 =?utf-8?B?cDF3T3NBOEhiaGNZblhoYTBHS0JxZmppMy80WWE1bGpTQzQ3ZGY3bW1KNGky?=
 =?utf-8?B?MlhrczhDSnZHT093dHNjdWNhaThNYXRPWW5CM0puT0V3dzQ0SzB0SEdkNGxq?=
 =?utf-8?B?QWwrNERLQ1lkOGJZUkVWTGlxcDIreStYQlVXY2xaeWlERms2MGpIektBT0VL?=
 =?utf-8?B?VENhOWtSbkpRNTlMY0wvcTVQZU9XakJQS3hVTXVXdUlXZTdTSWVjZGVUZ09B?=
 =?utf-8?B?eVRCRGQwR2lsTkk0QXkxdHdoaG8vT3E3UmlmSHk5SmIySUloZERZTUdwZC9k?=
 =?utf-8?B?VkFGS21uZ0hzRklOaVhDcDllZkdwZzJuZ3NIOGU0R0FmdG1Wc2Y3TlJ2Vitl?=
 =?utf-8?B?MmFPU1JoemNzb1ZzcnpZWUg1VFdTMkd4SmpNUE9UQ0JQSWxLc3BJRHRScDNj?=
 =?utf-8?B?Z1RScGdORVBLU3h6QUZoekRBbmVuaFpjNVRKL1lzSGU5OVBSQjVDckUvWnNr?=
 =?utf-8?B?L3NIdG0zbWRtQTBYZDRsS0lUeW9USVdUSlFMQTJvN3BFQkNtYlEvbWpERmow?=
 =?utf-8?B?a0lJK3dDTjBWUlQzeDdaTmhlbmpTSnB6YWRyYmU5eU5OVmFhNHZraXVXZlR3?=
 =?utf-8?B?QTVFSWljOFc3bHllUU4wQ1Bhemw5ME40clIybUk0VmZrakxOazRDOExlVVFl?=
 =?utf-8?B?RzJ2YkF5QVU5WGdDV1k0eXU5QXlSZmU1UWMweGcraFZxZklpaGpoQnRmdDNG?=
 =?utf-8?B?S0JFeGxuNnlMVkZBQytGcVNVSU1JNE9SMlhKQVBmWXlCVitpZklZd3lnSEM1?=
 =?utf-8?B?MWtJMTk5WDBOMlFLNHBweFN2SDdOOHUrQ2Z3OXI0N0ZFUXdaVWRNTjZwLys2?=
 =?utf-8?Q?cVRTUMYM8/KvkQ7I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e04b4fd-75a6-4d76-19b7-08da2399ee05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:22:05.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W21p7AyHntu1s7JnHXiU7DvFDxMC9fPryBvgwLWJuPagKFGoNj0f+kmPR0aC3SpXlPjiSWxgBLoMi41sxefL6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3771

So that the remapping entry can be updated atomically when possible.

Doing such update atomically will avoid Xen having to mask the IO-APIC
pin prior to performing any interrupt movements (ie: changing the
destination and vector fields), as the interrupt remapping entry is
always consistent.

This also simplifies some of the logic on both VT-d and AMD-Vi
implementations, as having the full RTE available instead of half of
it avoids to possibly read and update the missing other half from
hardware.

While there remove the explicit zeroing of new_ire fields in
ioapic_rte_to_remap_entry and initialize the variable at definition so
all fields are zeroed.  Note fields could be also initialized with
final values at definition, but I found that likely too much to be
done at this time.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
There's some functional differences between VT-d and AMD-Vi that we
might also want to address: the logic on failure from setting up the
remap entry on VT-d unmasks the previous RTE, while on AMD-Vi the pin
is left masked.

Note that certain combination of changes to the RTE are impossible to
handle atomically. For example changing the vector and/or destination
fields together with the triggering mode is impossible to be performed
atomically (as the destination and vector is set in the IRTE, but the
triggering mode is set in the RTE).  Xen doesn't attempt to perform
such changes in a single update to the RTE anyway, so it's fine.

Since the IOMMU code now also uses __ioapic_write_entry to update the
RTE it might be helpful to introduce an explicit raw version of the
function, as IOMMU always wants to write the provided raw value to the
RTE.
---
 xen/arch/x86/include/asm/iommu.h         |   3 +-
 xen/arch/x86/io_apic.c                   |   5 +-
 xen/drivers/passthrough/amd/iommu.h      |   2 +-
 xen/drivers/passthrough/amd/iommu_intr.c |  84 ++-------------
 xen/drivers/passthrough/vtd/extern.h     |   2 +-
 xen/drivers/passthrough/vtd/intremap.c   | 125 +++++++++++------------
 xen/drivers/passthrough/x86/iommu.c      |   4 +-
 xen/include/xen/iommu.h                  |   3 +-
 8 files changed, 80 insertions(+), 148 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 9ccf4f8bdd..1d62b42e17 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -97,7 +97,8 @@ struct iommu_init_ops {
 
 extern const struct iommu_init_ops *iommu_init_ops;
 
-void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg, unsigned int value);
+void iommu_update_ire_from_apic(unsigned int apic, unsigned int reg,
+                                uint64_t rte);
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg);
 int iommu_setup_hpet_msi(struct msi_desc *);
 
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 3a5e3b7872..f61e56f3d1 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -275,10 +275,7 @@ void __ioapic_write_entry(
         __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
     }
     else
-    {
-        iommu_update_ire_from_apic(apic, 0x11 + 2 * pin, eu.w2);
-        iommu_update_ire_from_apic(apic, 0x10 + 2 * pin, eu.w1);
-    }
+        iommu_update_ire_from_apic(apic, pin, e.raw);
 }
 
 static void ioapic_write_entry(
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 64e4bbf33c..35df504406 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -298,7 +298,7 @@ int cf_check amd_iommu_free_intremap_table(
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int pin, uint64_t raw);
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
 int cf_check amd_iommu_msi_msg_update_ire(
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index cebf9ceca7..feed1d1447 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -247,11 +247,6 @@ static void update_intremap_entry(const struct amd_iommu *iommu,
     }
 }
 
-static inline int get_rte_index(const struct IO_APIC_route_entry *rte)
-{
-    return rte->vector | (rte->delivery_mode << 8);
-}
-
 static inline void set_rte_index(struct IO_APIC_route_entry *rte, int offset)
 {
     rte->vector = (u8)offset;
@@ -267,7 +262,6 @@ static int update_intremap_entry_from_ioapic(
     int bdf,
     struct amd_iommu *iommu,
     struct IO_APIC_route_entry *rte,
-    bool_t lo_update,
     u16 *index)
 {
     unsigned long flags;
@@ -315,31 +309,6 @@ static int update_intremap_entry_from_ioapic(
         spin_lock(lock);
     }
 
-    if ( fresh )
-        /* nothing */;
-    else if ( !lo_update )
-    {
-        /*
-         * Low half of incoming RTE is already in remapped format,
-         * so need to recover vector and delivery mode from IRTE.
-         */
-        ASSERT(get_rte_index(rte) == offset);
-        if ( iommu->ctrl.ga_en )
-            vector = entry.ptr128->full.vector;
-        else
-            vector = entry.ptr32->flds.vector;
-        /* The IntType fields match for both formats. */
-        delivery_mode = entry.ptr32->flds.int_type;
-    }
-    else if ( x2apic_enabled )
-    {
-        /*
-         * High half of incoming RTE was read from the I/O APIC and hence may
-         * not hold the full destination, so need to recover full destination
-         * from IRTE.
-         */
-        dest = get_full_dest(entry.ptr128);
-    }
     update_intremap_entry(iommu, entry, vector, delivery_mode, dest_mode, dest);
 
     spin_unlock_irqrestore(lock, flags);
@@ -350,23 +319,15 @@ static int update_intremap_entry_from_ioapic(
 }
 
 void cf_check amd_iommu_ioapic_update_ire(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int pin, uint64_t raw)
 {
-    struct IO_APIC_route_entry old_rte = { 0 };
-    struct IO_APIC_route_entry new_rte = { 0 };
-    unsigned int rte_lo = (reg & 1) ? reg - 1 : reg;
-    unsigned int pin = (reg - 0x10) / 2;
+    struct IO_APIC_route_entry new_rte = { .raw = raw };
+    struct IO_APIC_route_entry old_rte = { };
     int seg, bdf, rc;
     bool saved_mask, fresh = false;
     struct amd_iommu *iommu;
     unsigned int idx;
 
-    if ( !iommu_intremap )
-    {
-        __io_apic_write(apic, reg, value);
-        return;
-    }
-
     idx = ioapic_id_to_index(IO_APIC_ID(apic));
     if ( idx == MAX_IO_APICS )
         return;
@@ -379,26 +340,14 @@ void cf_check amd_iommu_ioapic_update_ire(
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
                        seg, bdf);
-        __io_apic_write(apic, reg, value);
+        __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
     /* save io-apic rte lower 32 bits */
-    *((u32 *)&old_rte) =  __io_apic_read(apic, rte_lo);
+    old_rte = __ioapic_read_entry(apic, pin, true);
     saved_mask = old_rte.mask;
 
-    if ( reg == rte_lo )
-    {
-        *((u32 *)&new_rte) = value;
-        /* read upper 32 bits from io-apic rte */
-        *(((u32 *)&new_rte) + 1) = __io_apic_read(apic, reg + 1);
-    }
-    else
-    {
-        *((u32 *)&new_rte) = *((u32 *)&old_rte);
-        *(((u32 *)&new_rte) + 1) = value;
-    }
-
     if ( ioapic_sbdf[idx].pin_2_idx[pin] >= INTREMAP_MAX_ENTRIES )
     {
         ASSERT(saved_mask);
@@ -410,7 +359,7 @@ void cf_check amd_iommu_ioapic_update_ire(
          */
         if ( new_rte.mask && !x2apic_enabled )
         {
-            __io_apic_write(apic, reg, value);
+            __ioapic_write_entry(apic, pin, true, new_rte);
             return;
         }
 
@@ -421,16 +370,14 @@ void cf_check amd_iommu_ioapic_update_ire(
     if ( !saved_mask )
     {
         old_rte.mask = 1;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
+        __ioapic_write_entry(apic, pin, true, old_rte);
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte, reg == rte_lo,
+             bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
-    __io_apic_write(apic, reg, ((u32 *)&new_rte)[reg != rte_lo]);
-
     if ( rc )
     {
         /* Keep the entry masked. */
@@ -439,20 +386,7 @@ void cf_check amd_iommu_ioapic_update_ire(
         return;
     }
 
-    /* For lower bits access, return directly to avoid double writes */
-    if ( reg == rte_lo )
-        return;
-
-    /*
-     * Unmask the interrupt after we have updated the intremap table. Also
-     * write the low half if a fresh entry was allocated for a high half
-     * update in x2APIC mode.
-     */
-    if ( !saved_mask || (x2apic_enabled && fresh) )
-    {
-        old_rte.mask = saved_mask;
-        __io_apic_write(apic, rte_lo, *((u32 *)&old_rte));
-    }
+    __ioapic_write_entry(apic, pin, true, new_rte);
 }
 
 unsigned int cf_check amd_iommu_read_ioapic_from_ire(
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 39602d1f88..032a7c3b42 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -92,7 +92,7 @@ int cf_check intel_iommu_get_reserved_device_memory(
 unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg);
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value);
+    unsigned int apic, unsigned int ioapic_pin, uint64_t raw);
 
 struct msi_desc;
 struct msi_msg;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index e6ba89591b..52058efe86 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -328,12 +328,11 @@ static int remap_entry_to_ioapic_rte(
 
 static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     int apic, unsigned int ioapic_pin, struct IO_xAPIC_route_entry *old_rte,
-    unsigned int rte_upper, unsigned int value)
+    struct IO_xAPIC_route_entry new_rte)
 {
     struct iremap_entry *iremap_entry = NULL, *iremap_entries;
-    struct iremap_entry new_ire;
+    struct iremap_entry new_ire = { };
     struct IO_APIC_route_remap_entry *remap_rte;
-    struct IO_xAPIC_route_entry new_rte;
     int index;
     unsigned long flags;
     bool init = false;
@@ -364,48 +363,37 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
 
     new_ire = *iremap_entry;
 
-    if ( rte_upper )
-    {
-        if ( x2apic_enabled )
-            new_ire.remap.dst = value;
-        else
-            new_ire.remap.dst = (value >> 24) << 8;
-    }
+    if ( x2apic_enabled )
+        new_ire.remap.dst = new_rte.dest.dest32;
     else
-    {
-        *(((u32 *)&new_rte) + 0) = value;
-        new_ire.remap.fpd = 0;
-        new_ire.remap.dm = new_rte.dest_mode;
-        new_ire.remap.tm = new_rte.trigger;
-        new_ire.remap.dlm = new_rte.delivery_mode;
-        /* Hardware require RH = 1 for LPR delivery mode */
-        new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
-        new_ire.remap.avail = 0;
-        new_ire.remap.res_1 = 0;
-        new_ire.remap.vector = new_rte.vector;
-        new_ire.remap.res_2 = 0;
-
-        set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
-        new_ire.remap.res_3 = 0;
-        new_ire.remap.res_4 = 0;
-        new_ire.remap.p = 1;     /* finally, set present bit */
-
-        /* now construct new ioapic rte entry */
-        remap_rte->vector = new_rte.vector;
-        remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
-        remap_rte->index_15 = (index >> 15) & 0x1;
-        remap_rte->index_0_14 = index & 0x7fff;
-
-        remap_rte->delivery_status = new_rte.delivery_status;
-        remap_rte->polarity = new_rte.polarity;
-        remap_rte->irr = new_rte.irr;
-        remap_rte->trigger = new_rte.trigger;
-        remap_rte->mask = new_rte.mask;
-        remap_rte->reserved = 0;
-        remap_rte->format = 1;    /* indicate remap format */
-    }
-
-    update_irte(iommu, iremap_entry, &new_ire, !init);
+        new_ire.remap.dst = (new_rte.dest.dest32 >> 24) << 8;
+
+    new_ire.remap.dm = new_rte.dest_mode;
+    new_ire.remap.tm = new_rte.trigger;
+    new_ire.remap.dlm = new_rte.delivery_mode;
+    /* Hardware require RH = 1 for LPR delivery mode */
+    new_ire.remap.rh = (new_ire.remap.dlm == dest_LowestPrio);
+    new_ire.remap.vector = new_rte.vector;
+
+    set_ioapic_source_id(IO_APIC_ID(apic), &new_ire);
+    new_ire.remap.p = 1;     /* finally, set present bit */
+
+    /* now construct new ioapic rte entry */
+    remap_rte->vector = new_rte.vector;
+    remap_rte->delivery_mode = 0;    /* has to be 0 for remap format */
+    remap_rte->index_15 = (index >> 15) & 0x1;
+    remap_rte->index_0_14 = index & 0x7fff;
+
+    remap_rte->delivery_status = new_rte.delivery_status;
+    remap_rte->polarity = new_rte.polarity;
+    remap_rte->irr = new_rte.irr;
+    remap_rte->trigger = new_rte.trigger;
+    remap_rte->mask = new_rte.mask;
+    remap_rte->reserved = 0;
+    remap_rte->format = 1;    /* indicate remap format */
+
+    /* If cmpxchg16b is not available the caller must mask the IO-APIC pin. */
+    update_irte(iommu, iremap_entry, &new_ire, !init && cpu_has_cx16);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
@@ -439,33 +427,44 @@ unsigned int cf_check io_apic_read_remap_rte(
 }
 
 void cf_check io_apic_write_remap_rte(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int ioapic_pin, uint64_t raw)
 {
-    unsigned int ioapic_pin = (reg - 0x10) / 2;
-    struct IO_xAPIC_route_entry old_rte = { 0 };
+    struct IO_APIC_route_entry rte = { .raw = raw };
+    struct IO_xAPIC_route_entry old_rte = { };
     struct IO_APIC_route_remap_entry *remap_rte;
-    unsigned int rte_upper = (reg & 1) ? 1 : 0;
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
-    int saved_mask;
-
-    old_rte = __ioapic_read_entry(apic, ioapic_pin, true);
+    bool masked = true;
+    int rc;
 
     remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
 
-    /* mask the interrupt while we change the intremap table */
-    saved_mask = remap_rte->mask;
-    remap_rte->mask = 1;
-    __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
-    remap_rte->mask = saved_mask;
-
-    if ( ioapic_rte_to_remap_entry(iommu, apic, ioapic_pin,
-                                   &old_rte, rte_upper, value) )
+    if ( !cpu_has_cx16 )
     {
-        __io_apic_write(apic, reg, value);
+       /*
+        * Cannot atomically update the IRTE entry: mask the IO-APIC pin to
+        * avoid interrupts seeing an inconsistent IRTE entry.
+        */
+        old_rte = __ioapic_read_entry(apic, ioapic_pin, true);
+        if ( !old_rte.mask )
+        {
+            masked = false;
+            old_rte.mask = 1;
+            __ioapic_write_entry(apic, ioapic_pin, true, old_rte);
+        }
+    }
 
-        /* Recover the original value of 'mask' bit */
-        if ( rte_upper )
-            __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
+    rc = ioapic_rte_to_remap_entry(iommu, apic, ioapic_pin, &old_rte, rte);
+    if ( rc )
+    {
+        dprintk(XENLOG_ERR,
+                "failed to update IRTE for IO-APIC#%u pin %u: %d\n",
+                apic, ioapic_pin, rc);
+        if ( !masked )
+        {
+            /* Recover the original value of 'mask' bit */
+            old_rte.mask = 0;
+            __ioapic_write_entry(apic, ioapic_pin, true, old_rte);
+        }
     }
     else
         __ioapic_write_entry(apic, ioapic_pin, true, old_rte);
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index d5bf4d3241..e0ad38a09d 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -133,9 +133,9 @@ int iommu_enable_x2apic(void)
 }
 
 void iommu_update_ire_from_apic(
-    unsigned int apic, unsigned int reg, unsigned int value)
+    unsigned int apic, unsigned int idx, uint64_t rte)
 {
-    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, reg, value);
+    iommu_vcall(&iommu_ops, update_ire_from_apic, apic, idx, rte);
 }
 
 unsigned int iommu_read_apic_from_ire(unsigned int apic, unsigned int reg)
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3a83981464..b619cd872b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -262,7 +262,8 @@ struct iommu_ops {
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
 
-    void (*update_ire_from_apic)(unsigned int apic, unsigned int reg, unsigned int value);
+    void (*update_ire_from_apic)(unsigned int apic, unsigned int idx,
+                                 uint64_t rte);
     unsigned int (*read_apic_from_ire)(unsigned int apic, unsigned int reg);
 
     int (*setup_hpet_msi)(struct msi_desc *);
-- 
2.35.1


