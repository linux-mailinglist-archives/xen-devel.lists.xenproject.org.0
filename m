Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B94610FFF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431984.684660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrs-0000dA-UT; Fri, 28 Oct 2022 11:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431984.684660; Fri, 28 Oct 2022 11:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNrs-0000aQ-Qt; Fri, 28 Oct 2022 11:49:44 +0000
Received: by outflank-mailman (input) for mailman id 431984;
 Fri, 28 Oct 2022 11:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jk72=25=citrix.com=prvs=293452418=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ooNrr-0000Hb-GX
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:49:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b321491-56b6-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 13:49:42 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 07:49:35 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:49:33 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:49:33 +0000
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
X-Inumbo-ID: 9b321491-56b6-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666957782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eD9s7tMFJPWGtYhi6CBv1Q1gNHmSZ5TKTBfwsmgeB58=;
  b=fg7tTu7C0rlvJG/us/PvSH+lR1lwRWaEX1Ms1gJ5kd5bltNpkTGXcGkr
   I0TJG/P0JNkiUOvq6XRRwOHwJz+727CLvG1fPN0sqgZYTCuJgwf6HYAFh
   5Q1BVikv5dk0IGkXC5/IcSSWypz6dDbKq8Uu2md2bH6aLAtR8MyXXEql7
   Y=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 82799954
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R7VaFK7wnexZUBMAGe2HBwxRtAvGchMFZxGqfqrLsTDasY5as4F+v
 jNKXjyOPfiNNjP9c9onboy+p08FvMCBmNZgTgNorC1jHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 NYUOmkjaxC4v/Pnkb2lEuRmqf4gFZy+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojumF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efx3yqCdNPSNVU8NZA3AzJx3IXFCc5akS8ur63jkKcVPxAf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LFae0ipj/H2H2y
 jXT9Swm3exN3IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2toji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:3l3id6kwo8yuOWt3+DB5Uy6o5ynpDfIG3DAbv31ZSRFFG/Fwz/
 re+Mjy1XfP5Ar5K0tQ/uxoWZPwOU80mqQU3WB8B92ftUzdyQ6VxeJZnPDfKl/bak7DH4dmvM
 9dmupFeb/N5DNB4voSlTPYLz9W+re6Gc6T6Ns2yU0HceggUdAH0+4wMHfjLnFL
X-IronPort-AV: E=Sophos;i="5.95,221,1661832000"; 
   d="scan'208";a="82799954"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfsaWNSW8+Hxdm+T8f8OFRQYTjziH34LsIDURS5z+nzN5FabxO0obtmm73P3zbYaDa4WpHfwcbV3uK90/VLHffcXUKgct8ypOy3bXdPjXdYZk+NasJJyNo6Hb3meGcfXEvBf5q8KdFOvfFcXTNyMLAISH8GK2Gn0CbLG4LSz0o8vMCWovrb8vkZkXlTEBRmD9v4uSCA817Id+5nXKqK8mrTbd3oOJYvEafcnW3mMmfxHAAXLdDd1n/lV7mzjGvSQZEYeRFv4R3BVH0e4asS7bsrO42DDoMs1J87+iKiC7Bb4IHJjWitjxOAKYay6HSTVmPDH4qIbVAO5j+uh58kFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYDw1ju4VK98mCmtSho12wDHfRMXymvoyrYvMdxnUp0=;
 b=ErNn+qzqxZ+eLWN4gSJ9UOLqbLM6I4IfB1H5x9IBG8Gk0VM2pieBGmaWS+WU+lMgUqcqhZ1HlXZIbg8I8/x0OUgUdUC7j4+nyNa1muegGQX42BF+6t4z3AE8vHrTtIsX3O28ScBlWJ1GQilU3bUkxCN1RITWR+3EYgjta7CjjhJnavWJTYcUcOS5lnWJ2REzoLa7s2kAgC+5AjhUXZV/gOqpledi/MvqJb5lcR2z0UzxQNOZUaFuj9BHqGg2jBW4VB+E2ufZqeqfngyMWIM9zbBFaf9jAgefEz7kzF3RK0GDIm7SMVVzifHaWJEHFjaqFz9GCCQIQJlIwqS4OT5QIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYDw1ju4VK98mCmtSho12wDHfRMXymvoyrYvMdxnUp0=;
 b=VAVyxaLx+xvSX0FMKib1/AEBHD2hByvwIxmcpaeWFYNpwHg35K2B/rboDVSPnrt7L70WUQdxlacSROkWoQnCUQcGuucFRU50Z/G0M8Zq9TpLQHeMaFNwFZkm2mXSJ/oxVlCxC16Wp1BGErQw6jHbzr3Y5qk7aHaa7yQIGJp7BcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v2 1/3] hvm/msr: load VIRT_SPEC_CTRL
Date: Fri, 28 Oct 2022 13:49:11 +0200
Message-Id: <20221028114913.88921-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028114913.88921-1-roger.pau@citrix.com>
References: <20221028114913.88921-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cd866b-b8e9-4ff7-622a-08dab8da7ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	04yvv3SCXZnmIUWo3pPDo5wxE1nlQzlqlhQzE5mSvsagOG5+cDlaGEa59f24NfTW+JeaV0THlgnh+Lg4t8PDhmYIYFHAIrZnNJLDRHHfPsc+4Bl3rTFyD6M89Bqj8jaDO6DwPNHPyPp9juFWF65VdHjlDjH/mTI7KtNOed19pdQKrt5NKU2ape+Inw9+zfXGLTCXzG/FGAIvZuAh1l4z9bCKNu+fcvfAc+8UOgReoPf9ztJJ3RsAF+Lx7lqNgd21Ui7F2c5ImlPwEvH5oUX63LEaD9gcqOPCtLPHJGF28MyNvXHNIbGQQHkRmqxirPpbxO/oxDFpdIK+cXp+wLdt60J17pabX6qp0luXtp94VeeLOpKE8N5eFp89706DH4Chsb6ihLfsa2RSbksFg+g7DtkwOV+3Q+mO5IRSBXTTk6+wCOM8Ch2KOwfZReP75sruAt8KQ2qpv6eEKbHpORa7Vvp0tnI8gFOHtxh4HtFj6LKW23lYX5Q9MBCSpPArqLfjzfD45wO80d6xl3Xma2QtD5/UPge6kvqwQWFyc90x6iBsk16Ua1lJ5oHX4RiA+yzalM7SXtvwgu0L3PsRgwEZzW4QZ1FKtcIBwVzQ+uOKohbL2MQL1+73qYA2bIbAwBEQ8iZEEvlZESTzYYzYvYR0bVklB/lhb8ON5g4sx2qbdhkSljoALe8jNbk9CnTLPsp0q8nqOS62sV3BSH80GrbdVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(1076003)(186003)(2616005)(6666004)(26005)(6512007)(6506007)(2906002)(5660300002)(54906003)(66476007)(6486002)(316002)(6916009)(478600001)(41300700001)(8936002)(66556008)(8676002)(4326008)(66946007)(36756003)(86362001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHRaMlFJeXNWSWM0VTBrQWpTc0hkNXI4UDBON1JhTGhrcWs1bUNOSkduNHMy?=
 =?utf-8?B?RjFHaFhFVkRPNVpRbVM3Nmo4WVZHTDRtbFZIVEhLWkE1WmZzWWdEeUplZVRX?=
 =?utf-8?B?dWFWZWRpNTRnNXZJNEo3OVloU0NNakgyQUxwb2ZPTElZVkhQV05rSzZPUXpl?=
 =?utf-8?B?R3BDQXBQWjZMbW9KZEo5dm9SMDFHZWFZUVVyZzBJWXNTUTBNOWJ2UXBIcjFM?=
 =?utf-8?B?WStrTUtubFFoM2d0RTlxT0JQVzNJMjBvU3FNUEV3MEhaR2FMelZEa0ZSa054?=
 =?utf-8?B?bTdZTUJMVUFjU1A2TDhRK3ZoZEt2bjl2VXlUMU9ZUjZpSDFMb0hPenJiRWRr?=
 =?utf-8?B?MHBwaG9iSUpqT3BndTFyWmhMZjNRL09mTmtBNGtoT3VuaHh2OWRpSjVjcFpl?=
 =?utf-8?B?V3JmekRzeXRrZFg2SGpLYm51bzdiUG1uU0VhZS9mSEJBY2VmYTdQMVZZUFRW?=
 =?utf-8?B?UXVDMGI1MFFrUDlGY2NYM1lITDlGK2pYVGFnaWh0MzRDdmRsb0xIWnlOaUFs?=
 =?utf-8?B?b2IzeEpIREFWaGhEZk5OcDBYUFVKRTgwTnNIYXMrUFlFblB2L2lCTUYyc25P?=
 =?utf-8?B?QXVyMVVidXBjbnlhYU5JdUZpK3lXd0FTVFFEZWRDcU5mNWlpTVJBN1BYbkdp?=
 =?utf-8?B?QlRld2lLNmkwQ2Z6WmtLNzd2OWZrbjYwZTJpaWdsTUJ5UnM2TXR6V2xvNmZi?=
 =?utf-8?B?bU9wMVVVbVQ5VS9VelBRUlNhYkgwT3ZOL0FZNjNMbDlPa0tVbEM5bDVUM1RG?=
 =?utf-8?B?NDR1TmJOMG5USXpWYU5nb2xEblhnaDNPeHhXaUpYUGJZZk4zWVdRNTZuVFR5?=
 =?utf-8?B?ZlB2K1hqdmZjYjBRUCtZZ0tqVXIyTEY2ZDNYTVYxTkUrWHhzUkVYYXlBZTE1?=
 =?utf-8?B?RGQ5VTYrMVpzbjNraHRmUjJ4ZldwT3psSEl3eFErd1pZTkZQN1FOT055eEFz?=
 =?utf-8?B?UmVzTEpPTDk2SUdSMkgwNVRBeVZLc21yUmFNby9FcGJnSWw3dDBKZ3NCRVNX?=
 =?utf-8?B?dkR0UFZhc254K3B3QUtoMWtoUWdjWW82MU5ybjBEZUxCSktEVkdzYTdOVExB?=
 =?utf-8?B?NXZobkN6RnAyTHZSUU5tMnAydzhTNHZBc3ptWWFtRXRDQ3BlYjBwZ3VQYkpZ?=
 =?utf-8?B?SXlSbVhCZG91NGRKeE5vU1ZxaXdFVTV4N1ZZRVRqTWlIblR0RFdUMjhjYnd2?=
 =?utf-8?B?aGdRaDZSYkcrWEtjY1hHNXJDTzRDY3dJdnJHNmdmVTlBSjJVYVVuSmFWNEtS?=
 =?utf-8?B?S0lyUTJ1enJFVG9Fb0s4WFdpSHpxT21xeDlqUkxoTnJvb1FwR3FvdHh2cFZP?=
 =?utf-8?B?Y0NEUEVSV2Y3bzlCTTN4WGJjd3JnYW9WZzNHa0lVNTZncmdEOWV3VTFXTDl2?=
 =?utf-8?B?Tzc4WmQ0Z3RrSGY1QURha1daeU1nYWV0ZXhsVVdSRFNSekR0UjhJVGpNUENI?=
 =?utf-8?B?RHBwSzFLYW1PeHZ6aFc0NzZ6K1l1Zk5keEdqMmhKUlE3NXhEU0hvRUNtVHlh?=
 =?utf-8?B?bURJcXc4YnlEQ1c5RDFWTU1SYXdWZEZtYXpDUDhsT1FYdUNBNXlzNlAyd0tv?=
 =?utf-8?B?M2lITlNhVGN2a3VnMURBUDV1Vlc0ckxDa0I2VjcyMFhGYmtyOGkzUlRqVXN1?=
 =?utf-8?B?OFhaRi9DZGRXcmFONkZuTm9qWElIWmIwNk94V1RiQllhN3ExcmczRCs5dUVk?=
 =?utf-8?B?SW1QemtoOWppNHdPYTl0WUZ2dWF3UUNWRkt6a2xsaXdiVTlUL2l1d1IxRUNI?=
 =?utf-8?B?OUR5eTVHTFN0cXROemFIdGpOVVQxNnUvT2VZeW1Sbk1Cd1RKbjdwUk8xTUpw?=
 =?utf-8?B?a25YVWp0TFVBREZlN29JMGgzNXBQUG85LzBmTjNiaDYvR3Y1eGxuY2dMN2RR?=
 =?utf-8?B?QXFSN2lsVTF2Si9ISjU5MGRFUUxQSDVCNksxQUNsNWdEOVdWdTJkQnVjYVpD?=
 =?utf-8?B?amZvS1loVWk3eEpnaThxZ0g4MW1jVjNxLzZqM1Nka1Y3ZExkYitsVkxXK1o4?=
 =?utf-8?B?MUxxUnF2YjBUaUpvRk0xaU95eFdPMmVtZnU0dzF5U0RNOU8yQllrRjZWWDRH?=
 =?utf-8?B?VVBBbHliVU9ITW5FZ0tDT3drQ0dGdTYvMk9nSDlXRU5nbXNpRStzUCtETjRr?=
 =?utf-8?Q?hMPx62gxdFD/R0QzjfRNRHkMX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cd866b-b8e9-4ff7-622a-08dab8da7ae8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:49:33.3290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dpw77xJQ1CdITUDY0fCMiKykD6cFGIARF7XN8o8hKk2eC1JCzYDyF7lZQO+oXsS3z9OP4xEwvD6E5i8oQzKWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Add MSR_VIRT_SPEC_CTRL to the list of MSRs handled by
hvm_load_cpu_msrs(), or else it would be lost.

Fixes: 8ffd5496f4 ('amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm confused as to why we have two different list of MSR to send and
load, one in msrs_to_send[] and the other open-coded in
hvm_load_cpu_msrs(), but given the release status it's no time to
clean that up.
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/hvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 44b432ec5a..15a9b34c59 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1498,6 +1498,7 @@ static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
         case MSR_INTEL_MISC_FEATURES_ENABLES:
         case MSR_IA32_BNDCFGS:
         case MSR_IA32_XSS:
+        case MSR_VIRT_SPEC_CTRL:
         case MSR_AMD64_DR0_ADDRESS_MASK:
         case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
             rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
-- 
2.37.3


