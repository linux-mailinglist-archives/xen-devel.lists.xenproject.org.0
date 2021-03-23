Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C5345BAA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100603.191859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdxB-0001B2-So; Tue, 23 Mar 2021 10:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100603.191859; Tue, 23 Mar 2021 10:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdxB-00018z-Er; Tue, 23 Mar 2021 10:08:01 +0000
Received: by outflank-mailman (input) for mailman id 100603;
 Tue, 23 Mar 2021 10:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqA-0006c2-VI
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:00:47 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78e0421b-df95-4e63-96f9-dcac87299447;
 Tue, 23 Mar 2021 10:00:22 +0000 (UTC)
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
X-Inumbo-ID: 78e0421b-df95-4e63-96f9-dcac87299447
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=/SoEDPLw6OxZ/qntLzfu2J9mHJByb6j4475FehVwXTs=;
  b=FO68J3vGdBIIWHC8k+PPS44Z4N5yi3HDicoPWA+SZr/P03afMmWf29En
   gX3yD3qUvtO0ujU/Qtc5mK4oZhkDqoC0tntEosg0TnSr5vFdqMaLnwu/L
   EMLNxKU8V5qI9/mC8b5ZaEG49zx22KMFFPFcMugLeCh7yQgoEMAIpzC81
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: znpTRrcwkN3GyJeu2IbTnAlnmzqQVx91BMnditoywYrMNVxTgHxjf/stJf0SzxMA83BzJa6GFl
 MrSolfFM7bPnfT89b16p3MN4VND/bo2OF0VYWttYjsg3Wh6D7HMc1VpfxTR/tEZJVP4qW0TKqi
 RQaNWew3hv+gIk6F36QaBtvsIvaC1OaYMPn02IXSQfPbJqu0zPZU0Rf+hHYhExwCY4S3zxc1MY
 RX1q8xk7IxwR7JMvdldSqbctdsCzGYuG0oey4l3PLH/x9XRYh/WlSs85XhGL37GEAFUta60Ijo
 85Y=
X-SBRS: 5.2
X-MesageID: 39779569
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:gdbciqlGkYzyQci6dTuz8InH9L/pDfPKj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCmiGpfm4ZYt/+Kn4OWeXCoNOjruOaXTctARk75A6SyQ658bKSKWnj4j4ycRNqhY0j/2
 /MjhDj6syY0s2T5xfA2wbonu1rsfT7zN8rPr3otuEwChHBzjmlf55gXbrqhkFFnMiK5EwxmN
 fB5zcMVv4Dk0/5RW2+rRvz1wSI6l9HgBWOuDzo4wqRneXDSC8nEM0EvIpFc3LimjQdleth26
 FG1X/xjeswMTr8mk3Glrz1fiAvvE+1rX0+qPUUnnxSXKAPAYUh0rA3zQd7FowNEzn9751iOO
 5yDNvE7PITSl+CaWvF11MfjeCEbzAWJFOrU0ICssua33x/m2149VIRwIg6km0b/JwwZpFY74
 3/Q+hVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOlrWwqSHoYkd1aWPQtgl3ZEykJ
 POXBdzrmgpYX/jDsWIwdli7g3NemOgRj7go/suqaRRi/nZfv7GICeDQFchn4+LuPMEGPDWXP
 61JdZ4GPnmAWzyGZtY/gH3VpVIQENuE/E9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfeDx
 I4LXrODfQFynrudm7zgRDXVX+oUFf454hMHK/T+PVW7IAMM4ZLozUEkFjR3LDPFRRy9ogNOG
 duKrLula224UOs+3zT0mlvMh1BSmFY/avnSHEPgQMRKUv7ffIitrykCC9v9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iFHmbgXsVrHejVIwdhaWH2MfgdvoDf9YbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgsIYZH9jFd953gB6iJOldrX63jzTZmegfAl8gGxK+W8+ehggjAx5ZnE
 d4/aMkjL2cojq3MmckjOMkMFpDVXSPDNt9fXS4TbQRvoquVBB7TG+MizDfsR01d2bw32g5h2
 DqL0SvCLn2K2sYnkod/rfh8VtyeGnYQll5bWpit5ZhUU7cvGxo7OONbq2v8meYZ1cY2NsBOD
 XdbTZ6GHIo+/mHkDqu3BqSH3QvwZsjetHHBLM4arfJxzeDLpaLmaxuJY4iwL9VcPTV9skFXu
 KUd1XLcHfWC+Y11xeUoXhgEi9us3Ugme7p3hqgzGXQ5g9LPdPiZHBdA5ccKJWgykKhYdCi+p
 Bwl8g0suu9KX+ZUK/O9YjnKxp4birOqmu3RdwyoZ9avagOpKJ+dqOrIwfg5TVi5lECN8/6m0
 MVfbRj7J3AMoFpedYOeygxxCtcqP2/aG8isgn7GYYFDCoQpk6eG9OC+LzTr7UzRmWHuQvrIF
 GamhcttMvtbm+m1bQADbg3LnkTQE8g6G569OfHU4HLEg2le6Vi+1W9W0XNOoN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVhABFGMt1ghCaaPL3JhmNF+5O+8G7PlrJopLC2r/OsB7HDR2ha0oZgo
 VZc1c3dcorsEhlsLEK
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="39779569"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnEIJv55ftMJjvHDkYirmUykjyBXVTIy83GbsXW3ADDA4QElKrqoD1/BO0Ln2xPpvuRndC39HoE4LxgOVKBy6scus4Wxp88yAtX6p04NVi9Mf1HcdP6OKkCZOiPQSt2uqJrbKgnXML3HBnmFpcLP/dEpC/Eq/sX3LJuJ0wz6c0qmF3wAKGJMTY235UolnA7FLR9MWCmTz2flyPwTw52ypL8ITmWl+zLyF5LQp0MXeWPdBOLRj1cOf1S+YGvJax0aDpqLQJKBiZjiez0jwfAAWd11TEzUp9PQw4lES7yhCza6VJk3Nra5lUxHUFm/0cmEbVXbFyyh+30HIfhjuNo8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPrkBWw3F27B97CCbixdNkftOso/WmqluwfllC0ExZQ=;
 b=bDNf/fvkqETQgCgdpR2CpVdx0lTt4TRnkoWb+rVre02MEpfkSwV7u0ApeA0Wqcz0O9MRs3nSLfYLP3d9oSwGC9j3ZInmqGVrLG3mO4eZM+TLkDEm5Ncx/Gz6Ka58u3f4Ftt9sYfHNid9rPS0Lvr205zvnQX12W1oyr/xzrXPxmoGDBJl2bGH4UGhhtcX3Oa8JIx48QEj3e+mjGWPb17++a7TA4EInnSLRHcJ6Eay/vZvMtHp1TCuSwbUp/qikIyJB6/JtsuPj/Y5m5q9iXRfFFeRYE3N8p8NiOvGiwVKMdY4LK3owmpNzes5xbf9Pcvupc1Xxnj8g451uTHweSYFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPrkBWw3F27B97CCbixdNkftOso/WmqluwfllC0ExZQ=;
 b=AE3jEwtbQ9LymVeSmG6gOHVVQC1bkBWyM+LdjlbAopi4wpPTbqieWv4gU5BrRxU51/dRAIpGFWgxMrcugzv0frPgiv31L6W7fpSUTpNNDUsVoCziW3fTkT7VQ/RAHQt9sYoFmulOpBaeP3OzmwfU+HoyUzhnPpu/LJBYd62+QAQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 07/21] tools: switch existing users of xc_get_{system,domain}_cpu_policy
Date: Tue, 23 Mar 2021 10:58:35 +0100
Message-ID: <20210323095849.37858-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 261d4e70-d194-4247-a751-08d8ede27719
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49694B432D966583C27E1CA68F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/W/Imvlo7O+hFU6uoGyjd+K5zuMSmYHenMQQW0YUr887rcVjFYnvEy12oNYbmp5N7uwdJkamIBsRc0j9Q9/083gE8uIS48paHJxGDPcY6Weuz0/o5EkAiaDlpVRLuvT5uDrjd1xnYy9P21XaznFoou4p+WlrkjI/WuHVFSoYgQziY5wk4skXAQZ0lDM2fBQsMi/ajs4E0b2cyKq2uJc8eU9JolKJBM2pdGYyz2ZzL3xQ7quJqUGrdFbjQT9lHDyeaxxRpbU8JrAtKaianREkNN42a8XJyq12mh5PqB+iOPq1PTiZBbqsqa9ZHIcje/UurVSLGwWIZQp59hpDw5AWfFzojOGYo6v5Um6I17ES0CQVjPIZul2uhnoaKzXrpbu8dQKTx5v0mrUWTmLgUJQmarCMc3Ji82k4yoWbYNvKWhDNbTFbA4gRI52X4KS5TBuuB9tN3jHNVGW38RGvgg3mCW0hjDHmpGj3+PnC90R3p1Z0iJlLAl/aFDYj3Nyovy4DQEOgytUqg9hEdFMGUuICl/skysS+qb+xyInz9FDgj5M6Pw13BLxM49KBrK0f9Q0Iz28IWIkt9XXyaI4BaZLw7rwhqqshyJ2rW+RaS/PPZhhN/23NtkVbwhzfGJ4IurJLJ8FZG4wbvGpM7xBnaiSDkH/HfGlOL7mhmQ9IwQuSpc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWF2Zzh6Y0c4emtpOUhOU3V6eTl5OTQySkZTWDJHTVpGQS9vTXJpYUZWSmd3?=
 =?utf-8?B?OXByQS9QeEw3Qzl3dktiY29OdDdIdVR5NW91Y3RybzdLVTlXRm83RVcxV3I3?=
 =?utf-8?B?R0szVkFGUmtnbEZKandTeVdJbXFFUGN6UFQ1WEtsbmttbEgyTFhSSVF1a0t3?=
 =?utf-8?B?aWF1UWFGd3pDUTVzRVlkQVNUaVpvdzBScmgrZW5xeVBMS2NNYVFESmtHSWwy?=
 =?utf-8?B?VFIwanAyOU9sL2FacWVEVktwY21HSXNYT1ZnMWwxR1BLbHpGWGNKeDVOak1F?=
 =?utf-8?B?d2ZrK1lsdnBPNXJ3aExsSkhWY0VONlkrU1hCMFFxRUt3WFZGUlBRbFNKUTN4?=
 =?utf-8?B?R3Z5YVBSNmptbzE4ZUp1Q1VNTWN0L2NLbWZZTkFHQTJ4a0hRaTVuWDUvNkZE?=
 =?utf-8?B?L2hFWW1RQkwwdFJyR0wvNTNsVTlIOVg0bzArbGdqWTg0YlhGcUxXM2ZTcVhu?=
 =?utf-8?B?VUR0azdVWGxOOG1sRzJJMXdVNEcydE5OTEVXaVNrV2gwbEcxTFY4ZVZ3a0FN?=
 =?utf-8?B?VmFHRFJQdTZOdklhTGpvOHBFWmFPNUNPU0tJNnhJYlhjQTFod2diaTZHWS9z?=
 =?utf-8?B?MkQ0YTFLNnM2SEpadDJLMWNWQXpyL3N1Ti9yTHpKMmJiZm9VcEZHRUNIaFlW?=
 =?utf-8?B?eVovRGh4VERvZGVLWTVmMFMvcElHcnlBejM2d3RPWVJlcHdzNFpQMFB6TEJV?=
 =?utf-8?B?RklFYnJaeFJoOFB4RzVrQy9ESzd5QXc5K3V4emhVY04rVkRQYy90Z3grRDNH?=
 =?utf-8?B?MVh1NzNDOHh2LzJiVHA5MXBxcFh4Y2dWR1gzT3pZTnhtK3J5RFo5eStuTWxT?=
 =?utf-8?B?RHErU3huWG1WcWtuVmR2S0FLWlM5UzJXQk03cmdCV2l2UnFOV1Y4TC9zRjY1?=
 =?utf-8?B?TlNIWFBBMnMwNHlOMzZHRjN4Ym1rVFpCT1JvMkJQb3VyU002Wml3VjZBY3Rz?=
 =?utf-8?B?ZjN0UnJBQmVJVnlZUlJOWEdWbmlyN2cyT1dBdGJZN01BMTZZRVNXV1VNaEMx?=
 =?utf-8?B?TVpPa25qWW5XbXo3MngwU3dnTUpncjl3by9nS1VKTDg4NWJhNlJWOGJPWXBs?=
 =?utf-8?B?RWN5RjcwZk83UlRVREUxUE53dnNYQW5Ka3VCdEJ0cWUxUTRtbjgzN2Rvdldn?=
 =?utf-8?B?WVkxb3VONEppZ3oyMHBidFVQWldqeXNxTmhFWEtqQ0NSUFhKc2RhL0s1MGZq?=
 =?utf-8?B?Umw4M20rS2QzNm5GakRSYjk4K2d2R3NCMlgzRUlpNWJPUUdvZXpqSjdZZTRS?=
 =?utf-8?B?ZEpycUkxdmpTc0Nmb1A5VDZqUWc2T2pmc2VMNDhLM1JINDI5NlBqUi9sU3pj?=
 =?utf-8?B?MllkYUxJQ2JHdEhTU1pHZUdYdGh0VUd3ek9XdGxrR2wyZU5aMWNRN1NNbTkw?=
 =?utf-8?B?NjNkaUNIYlZDWi9ZWXlOaXRPTXQ5Y09VQVFRMUJlQ2hXWUlRcEdycVY1M1Mw?=
 =?utf-8?B?VUtvTkVhZ09GRE1MNFJIVHYzWFpFcXJoQUNSem5hS1RWV2N6TFI2eUwyYlMz?=
 =?utf-8?B?T3V5bzhvUGxlZGxHSEhObFRDenlkcWg3TXV3MkJNL01JZkZmWUNzdTVWWXJ2?=
 =?utf-8?B?Snlwa3ptOXhJYmR2Nm01ZDJZdXVLeVpXeTcyNGM3b2NkNmVsaXZLbS9wYnR4?=
 =?utf-8?B?Uyt1dXdLTWZzd3dKOE4vNERzaThmYTZ4NzdSRU9RVHdPRCtydEErY3hBVENx?=
 =?utf-8?B?RjRiTklQUWxGdUkvdkNJeklSOXEyazJYaEw2NXJTeUdZL2Y3ODdmYzZpcTBO?=
 =?utf-8?Q?fT+RwddS4f7CCT+Tubt0YAUPsuYMzgf3/+ktgCr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 261d4e70-d194-4247-a751-08d8ede27719
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:19.0711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyOdeCe2URk9KUb2+1G5lIpo1UITYeKOiLysyekLfFHjxA6lFrsnTMn9nLss6hO8szI8s+ah3mRaIFcIZAih0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

With the introduction of xc_cpu_policy_get_{system,domain} and
xc_cpu_policy_serialise the current users of
xc_get_{system,domain}_cpu_policy can be switched to the new
interface.

Note that xc_get_{system,domain}_cpu_policy is removed from the public
interface and the functions are made static, since there are still
internal consumers in xg_cpuid_x86.c

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h             |  6 -----
 tools/libs/guest/xg_cpuid_x86.c     | 36 ++++++++++++++---------------
 tools/libs/guest/xg_sr_common_x86.c | 15 +++++++++---
 tools/misc/xen-cpuid.c              | 21 +++++++++++------
 4 files changed, 44 insertions(+), 34 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 983bb027a04..161dafd234b 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2613,12 +2613,6 @@ int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
 
 int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs);
-int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs);
-int xc_get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs);
 int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
                              uint32_t nr_leaves, xen_cpuid_leaf_t *leaves,
                              uint32_t nr_msrs, xen_msr_entry_t *msrs,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 812ef14fbcd..a8133d5cd3f 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -128,9 +128,9 @@ int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
     return ret;
 }
 
-int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_system_cpu_policy(xc_interface *xch, uint32_t index,
+                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
+                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
 {
     struct xen_sysctl sysctl = {};
     DECLARE_HYPERCALL_BOUNCE(leaves,
@@ -166,9 +166,9 @@ int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
     return ret;
 }
 
-int xc_get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
-                             uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
-                             uint32_t *nr_msrs, xen_msr_entry_t *msrs)
+static int get_domain_cpu_policy(xc_interface *xch, uint32_t domid,
+                                 uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
+                                 uint32_t *nr_msrs, xen_msr_entry_t *msrs)
 {
     DECLARE_DOMCTL;
     DECLARE_HYPERCALL_BOUNCE(leaves,
@@ -322,7 +322,7 @@ static int xc_cpuid_xend_policy(
     /* Get the domain's current policy. */
     nr_msrs = 0;
     nr_cur = nr_leaves;
-    rc = xc_get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
+    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain d%d current policy", domid);
@@ -333,9 +333,9 @@ static int xc_cpuid_xend_policy(
     /* Get the domain's max policy. */
     nr_msrs = 0;
     nr_max = nr_leaves;
-    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
-                                              : XEN_SYSCTL_cpu_policy_pv_max,
-                                  &nr_max, max, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
+                                           : XEN_SYSCTL_cpu_policy_pv_max,
+                               &nr_max, max, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s max policy", di.hvm ? "hvm" : "pv");
@@ -346,8 +346,8 @@ static int xc_cpuid_xend_policy(
     /* Get the host policy. */
     nr_msrs = 0;
     nr_host = nr_leaves;
-    rc = xc_get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                                  &nr_host, host, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
+                               &nr_host, host, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain host policy");
@@ -478,9 +478,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     /* Get the domain's default policy. */
     nr_msrs = 0;
-    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                              : XEN_SYSCTL_cpu_policy_pv_default,
-                                  &nr_leaves, leaves, &nr_msrs, NULL);
+    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                           : XEN_SYSCTL_cpu_policy_pv_default,
+                               &nr_leaves, leaves, &nr_msrs, NULL);
     if ( rc )
     {
         PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
@@ -760,7 +760,7 @@ int xc_cpu_policy_get_system(xc_interface *xch, unsigned int idx,
         return -1;
     }
 
-    rc = xc_get_system_cpu_policy(xch, idx, &nr_leaves, leaves, &nr_msrs, msrs);
+    rc = get_system_cpu_policy(xch, idx, &nr_leaves, leaves, &nr_msrs, msrs);
     if ( rc )
     {
         PERROR("Failed to obtain %u policy", idx);
@@ -793,8 +793,8 @@ int xc_cpu_policy_get_domain(xc_interface *xch, uint32_t domid,
         return -1;
     }
 
-    rc = xc_get_domain_cpu_policy(xch, domid, &nr_leaves, leaves, &nr_msrs,
-                                  msrs);
+    rc = get_domain_cpu_policy(xch, domid, &nr_leaves, leaves, &nr_msrs,
+                               msrs);
     if ( rc )
     {
         PERROR("Failed to obtain domain %u policy", domid);
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 4982519e055..15265e7a331 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -48,6 +48,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     struct xc_sr_record cpuid = { .type = REC_TYPE_X86_CPUID_POLICY, };
     struct xc_sr_record msrs  = { .type = REC_TYPE_X86_MSR_POLICY, };
     uint32_t nr_leaves = 0, nr_msrs = 0;
+    xc_cpu_policy_t policy = NULL;
     int rc;
 
     if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
@@ -58,20 +59,27 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 
     cpuid.data = malloc(nr_leaves * sizeof(xen_cpuid_leaf_t));
     msrs.data  = malloc(nr_msrs   * sizeof(xen_msr_entry_t));
-    if ( !cpuid.data || !msrs.data )
+    policy = xc_cpu_policy_init();
+    if ( !cpuid.data || !msrs.data || !policy )
     {
         ERROR("Cannot allocate memory for CPU Policy");
         rc = -1;
         goto out;
     }
 
-    if ( xc_get_domain_cpu_policy(xch, ctx->domid, &nr_leaves, cpuid.data,
-                                  &nr_msrs, msrs.data) )
+    if ( xc_cpu_policy_get_domain(xch, ctx->domid, policy) )
     {
         PERROR("Unable to get d%d CPU Policy", ctx->domid);
         rc = -1;
         goto out;
     }
+    if ( xc_cpu_policy_serialise(xch, policy, cpuid.data, &nr_leaves,
+                                 msrs.data, &nr_msrs) )
+    {
+        PERROR("Unable to serialize d%d CPU Policy", ctx->domid);
+        rc = -1;
+        goto out;
+    }
 
     cpuid.length = nr_leaves * sizeof(xen_cpuid_leaf_t);
     if ( cpuid.length )
@@ -94,6 +102,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
  out:
     free(cpuid.data);
     free(msrs.data);
+    xc_cpu_policy_destroy(policy);
 
     return rc;
 }
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 52596c08c90..8ac25581d68 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -458,9 +458,12 @@ int main(int argc, char **argv)
         uint32_t i, max_leaves, max_msrs;
 
         xc_interface *xch = xc_interface_open(0, 0, 0);
+        xc_cpu_policy_t policy = xc_cpu_policy_init();
 
         if ( !xch )
             err(1, "xc_interface_open");
+        if ( !policy )
+            err(1, "xc_cpu_policy_init");
 
         if ( xc_cpu_policy_get_size(xch, &max_leaves, &max_msrs) )
             err(1, "xc_get_cpu_policy_size(...)");
@@ -481,10 +484,11 @@ int main(int argc, char **argv)
             uint32_t nr_leaves = max_leaves;
             uint32_t nr_msrs = max_msrs;
 
-            if ( xc_get_domain_cpu_policy(xch, domid, &nr_leaves, leaves,
-                                          &nr_msrs, msrs) )
-                err(1, "xc_get_domain_cpu_policy(, %d, %d,, %d,)",
-                    domid, nr_leaves, nr_msrs);
+            if ( xc_cpu_policy_get_domain(xch, domid, policy) )
+                err(1, "xc_cpu_policy_get_domain(, %d, )", domid);
+            if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
+                                         msrs, &nr_msrs) )
+                err(1, "xc_cpu_policy_serialise");
 
             snprintf(name, sizeof(name), "Domain %d", domid);
             print_policy(name, leaves, nr_leaves, msrs, nr_msrs);
@@ -497,8 +501,7 @@ int main(int argc, char **argv)
                 uint32_t nr_leaves = max_leaves;
                 uint32_t nr_msrs = max_msrs;
 
-                if ( xc_get_system_cpu_policy(xch, i, &nr_leaves, leaves,
-                                              &nr_msrs, msrs) )
+                if ( xc_cpu_policy_get_system(xch, i, policy) )
                 {
                     if ( errno == EOPNOTSUPP )
                     {
@@ -507,14 +510,18 @@ int main(int argc, char **argv)
                         continue;
                     }
 
-                    err(1, "xc_get_system_cpu_policy(, %s,,)", sys_policies[i]);
+                    err(1, "xc_cpu_policy_get_system(, %s, )", sys_policies[i]);
                 }
+                if ( xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves,
+                                             msrs, &nr_msrs) )
+                    err(1, "xc_cpu_policy_serialise");
 
                 print_policy(sys_policies[i], leaves, nr_leaves,
                              msrs, nr_msrs);
             }
         }
 
+        xc_cpu_policy_destroy(policy);
         free(leaves);
         free(msrs);
         xc_interface_close(xch);
-- 
2.30.1


