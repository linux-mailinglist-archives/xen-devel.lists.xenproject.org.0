Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19005BA80A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 10:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407855.650499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6Zh-0002jt-I8; Fri, 16 Sep 2022 08:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407855.650499; Fri, 16 Sep 2022 08:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ6Zh-0002hR-Da; Fri, 16 Sep 2022 08:19:49 +0000
Received: by outflank-mailman (input) for mailman id 407855;
 Fri, 16 Sep 2022 08:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHCK=ZT=citrix.com=prvs=251a9f4e5=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oZ6Zf-0002hL-D4
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 08:19:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50a212b9-3598-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 10:19:44 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2022 04:19:39 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5497.namprd03.prod.outlook.com (2603:10b6:806:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Fri, 16 Sep
 2022 08:19:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%4]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 08:19:35 +0000
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
X-Inumbo-ID: 50a212b9-3598-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663316383;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PtBnnS74mlK43yJvaSjYBuOYgj9NwQ/gJSj829EeLmI=;
  b=cNZ3FRDD5OmL3c8RSJ/l1UoAW/iHtPcADjltix+9lyxf4Etu4/4/6yXo
   zExXeY02yI+Ocn1eINpHU+I1c45fpVkWAp6PNk0yOAlKlnn1Ul/ZbskUi
   O4CsPtEg3wL4OHWnsbyk0qRrtgAIzpQKz7z385A0kkw03Wac6brMtWQNr
   I=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 80338946
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SwRbsa2wPPqW69M4H/bD5f9wkn2cJEfYwER7XKvMYLTBsI5bp2RWn
 2JNCGGFbquKZjPxftF0Pd61pENUv8KAm4JlHQA6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrS8U035ZwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/9KCmQ6Y5wpwe00Plh10
 e1fJTMtSTnW0opawJrjIgVtruIKCZCxeak56jRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2yS5KmIAwL6WjfNfD2z71gt+3aKrKNPIUteLWd9UjgCTo
 WeuE2HRUklBb4zOlWTtHnSEh+juzSX0ZK0pLeep7vF1x1aP+0cvF0hDPbe8ibzj4qKkYPpeK
 UUf+TEpq4A59E2iVNq7UAe1rXiJuBJaXMBfVfA5gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmL+ITXOQ8J+EoDX0PjIaRVLufgcBRAoBptPl8Ic6i0uVSs45SfHtyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:cqPALKjp/o3C4+q02RZ+vvmaFnBQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nGPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SuV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A7eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1whq7VBaM0pd
 gsCZ4Y5I2mfvVmE56VO91xMPdfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.93,320,1654574400"; 
   d="scan'208";a="80338946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzdOaPSDQ4ALuwbRS1oH5LjU48RU2BBW7PjN+hVHAOeMJf7FQ71BXdVb+IgBeWyQ/XbiTk4ETyarkrLac5a6LAeaeGbapHq3/AZsNobRz+OZg7uV55OmBrKEaIFaRt8LioSQvAvkkzV+WOPhqMs1uJvZ6DtxYm9VHrP7YaN/ODmvX2gCvZ/SzsRSNzv+j/lCkn2G1ATGAA45fa/cVOyuORWGcCEZRECYgczjc72/HHpSKlFwhrhOY+2BtB110JYzI5casvE+AqTggxqXRqzu7m1mNk9Dcabnx+k17UrE8ZZ7xBs9+kajU+ZLqOyBCt5PWnUQ6TspUFh43zDiiHfaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuY1MuLzIfClvyxlgwYR0xCJDqZXV4AXvdQHK3qP7HI=;
 b=aAU2ZePBaI4MD81B8+EOJ+0l3OLRJyN+moomPaNc0Xa4lVhSTapQ5OI8DnsvdC7fbArS3mpD03bMm6BDxL9qiWtSDDY5mNql7wnFqAgiT/AAnWPkB0e37s/bq1MOoI4bYtiRUFht6g0chMxb3qKjIkZ1ykxGVdS1uZxvpvtrPfG1uMwrdNSxK4SLqy1rlosy9kFEFFrS1YU0PJIi6RgS+JWJKVucuqAgTQZ6+fYk4i2gcU1+zO8S9FyHtAgSDEdo+2peaHIf/6nD0E+buLKWj/vb8QkXHsjoE3c3zHX92NV0/vD31kYU6guWIXp4RVQsefEEBrd9mnQRdoetxRI+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuY1MuLzIfClvyxlgwYR0xCJDqZXV4AXvdQHK3qP7HI=;
 b=wAxF6BFC0ZcDLvBXkVvqeRfY4G/zZrn0X7a8bp/9i3vDAHuwtVzs0ORTbPsv2PWmat+iVqeaFF7o6yfzEaOqhUi6t0tQvxXmgheBg1F8/a0tImxWynSCleGCAqRi+GVF3j4LWWuRp7L6WuabiHGKuOvoZrQ4sumN8Pl/iUyngEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 16 Sep 2022 10:19:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ijackson@chiark.greenend.org.uk>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] libvirt: disable Werror for non-libvirt flights
Message-ID: <YyQxkCLU9CLnO1M+@MacBook-Air-de-Roger.local>
References: <20220913100328.27771-1-roger.pau@citrix.com>
 <YyMyc0O9N9l1NzEZ@perard.uk.xensource.com>
 <YyNJHURbDNeeZhEf@MacBook-Air-de-Roger.local>
 <25379.49467.262316.722608@chiark.greenend.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25379.49467.262316.722608@chiark.greenend.org.uk>
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|SA0PR03MB5497:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb7ff73-c3b9-44f4-aa0b-08da97bc3059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ffWV7middAYDDgqaolmvbI3CLB46smeuhmERZRB2mV/33jSU6zbCiyLVEb8LHC5Vy3BUPb/pZrbPl4XjODSkdUpQbiI/vEwdvzKxgI3zzCIbNx0FzB5l7YiLlujvOY6QsNtIq7W3w9U4TPmW32gq6JWHiazGLhZeRxp2QQl7NgPL1oNH95mqwZd5/9IW+uXM9DyR8ePB7BHhNgmKtZs1EhiMsf9wfkZt6wHIO2+VXvbg+BDAiPhh9NrYw+cRsWxk5mbwXYYEk8bYrnPblS+rVOhsOhXd6zyje687hJs7B65kuP2+3qWe041l5ghl65MXYMk6P47NoVYvcx5+xxO7IIjLLwMXuTrPAUFcMz4RI8YlaPmrsqG41hiZhzNbhmDzKGtXB7XSlpYdHlN0sitcNSJB2llxh3nyVOxyhSTcpTkCDHqEofkLvudAcUCuLxJT2F5qFvFJaXEGfKA0IlJJUYXOj/Km7+cYjqmaym/Eg2sLGiQRk9+FHWU8KkC8DZtmpZUuWXR7JG7SOhgWOAEMs4tiOEEYWwCat8Y2iHlgI+Juf3l+rjLelMM90brgInB18xJ/f0OqrELUqPtMCNNTKEzKPQetzKbCaBZPSIPwGajJQfLzF7jZE3X3aMkNgflN26vynmwwhk/GyDgTidKqS5Igjq3KpJTAX0exp4milBs5s+mRT92iVGTqWURfeYroV7C2+dysyeuuHIOcWhn5dA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(83380400001)(82960400001)(186003)(6512007)(26005)(9686003)(478600001)(41300700001)(6666004)(6486002)(54906003)(6506007)(38100700002)(6916009)(5660300002)(8676002)(316002)(8936002)(2906002)(66556008)(4326008)(66476007)(86362001)(85182001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmlhNTUyRFJCTVVKVVpLVjFoSWMzWTZlL3M1QUl6VXFqSjN5eVNrelhxZ3pW?=
 =?utf-8?B?NDRUNXA4U0ZmS1dBWXRjRFEzZTVyM0FtZ29ITE5YVk9EQi8raDRvelI4eFpt?=
 =?utf-8?B?T1ZSN1RwT052UGxFZGF2aWorb3Z1TTdyNGl6Wm56RTFWV3RHTjRXQkhHeERG?=
 =?utf-8?B?emc2Y1BuVXhoTkFNM2VNdTc1blZWcHVGLzY3ekZxbXVBWjhFVHJ3dXFhdjI5?=
 =?utf-8?B?RVNxTllNYlYvbmtkY043bnpkNTRDWXJDM3VQOWo3OG5oR1ZXVmFYZUQyd1Bv?=
 =?utf-8?B?UUtYZ3hPSGVWZnkrci96d2pnRHpuVldNdmdIWm9HdWRvdGZ4aFBxZWhYRUox?=
 =?utf-8?B?T0J3aFBMdVU5eFhXbXBJS3RyNlJjSUdDdHFjM21RR0lmS1ltcVk5KzlzM2tz?=
 =?utf-8?B?TUxmQnNSZFJYRDcxRnFPUjRCUnFhNmtJbWNIZ2k5WjNRVG9XdFZuY3JLNmVz?=
 =?utf-8?B?Ky8rNFhXKzVKV2V0WFBlRzUxOWljTWNSdFk5RVczSkFWb1EzY0xaaGozNFdM?=
 =?utf-8?B?VW4vR0owT2lGYzlEa2ZORHpOeTZiYmRGQ2NqZUg0MzJyRmxlRTVCSUZTZDRh?=
 =?utf-8?B?NmdkUlFGOUhsWHdEcytQaERETmxxeW1ZR3hsUU1yTUprbWFYcDBiVzVXVEVW?=
 =?utf-8?B?MUd1bjYyVDRhdnpFdmRKa3o4L0lSN2JKb2FaYmVvL1dZY0x6dGQ2c1BYNVdO?=
 =?utf-8?B?ZHFtTS8wbXdPTHFQV2ExK2I1aWo0RWQwckJqZnJJc1EvRThVMmloZnBpaDQ1?=
 =?utf-8?B?R1RCelJ6YmZxR2pYbS95dWlwUk9HSmdLclQxSEF2b2JUYkxJQUpFckY3aDJF?=
 =?utf-8?B?YU9rakdnNExZMzlvSzB4Y29LOFFKYUx5RGVQTm9OaUJ3dHhCRjBTZmdLWlNV?=
 =?utf-8?B?WDJJQVJBOU81Zi9Rcm9mS2gvNmhLWk5mRTNTeE5aeDZTQ1lMdWhXbVJ6bHBC?=
 =?utf-8?B?MFR4MTB5ZUtiZFRDeTRZL0xqTDBFNTdjUjhnWEd5c1o3dkRZbUhjSDZPWkZH?=
 =?utf-8?B?V0JvM1BEci8xNm5VazQ0TDdrOVR0blIxOUs3OW1RS3dFOExTQ0FHdnMyWHFx?=
 =?utf-8?B?Y0lPaFdiekF6WHNrZ21oNE8yOUVhcVY5T0ZoeDJLYldhSGJOT0xRWDNsVE9Y?=
 =?utf-8?B?S2RLWTIrbkxLMGp6RkJ2aW1GYXRIclgvNTlJMFlhdHZFaHBjbTRYeWVyY2Vx?=
 =?utf-8?B?UkFwdnRRaHI4emVpeGtGNmhpenFLcE5oZkJDTDhHeExRa2FFV3ZQMHJnNkQw?=
 =?utf-8?B?bEtqR2swbFdoMmowUFBpOHVFeWZlSUJFTnVISkxYTUxXWjhDNTJXNUdtYTVK?=
 =?utf-8?B?cXhxOHg3L0ltdzR6RnB5L2dwQWhaMENNN2tSMUlVQTNLL3gxeGN6OFJ6WmlX?=
 =?utf-8?B?RUR4cTg2eTFiMTY1ZjJzaDJOVTRjMjNSSlRDOEZsR0lGamg1TWkxSEJDSDFB?=
 =?utf-8?B?N0NMcHc5ZTNGb3UrcUQwdHUwWHZpNHdwbEl2ZEtUT0ttR2p2QnBvcDFWbHln?=
 =?utf-8?B?ZlRZeE54MktwNkpGOHNyRHBOemN1MXFBcTNqYW0wVXRUU2FTY2ZyVlNBWWov?=
 =?utf-8?B?STVlOUphdFE3MVFZNFNSUk91K2RDZWY0bWJGaVVpM3paNEREdDFxaTJvRDRr?=
 =?utf-8?B?MDg3NjE5N2Q0c3RUYjQyR1k3NGtaSUhDRjBXczl2b0ZWZXVOVG9Pa0VUV20z?=
 =?utf-8?B?UFJOd25lUXVPazV2ZGRPekxwQjdyWkU4V0w1OGN2QjVjZVhhOXZWdmxGNlRx?=
 =?utf-8?B?ZXdrdk9VUVJoY2x3YTNTeGVxVzJ6UnBNdDJXS29kWUozQktoWVhhZk5pU2ky?=
 =?utf-8?B?d0RyQUF6cm1tV0FjcDR2RkM4SnVKcDBlbnlnYmhuazFpeU52VmJEQnpNLzZS?=
 =?utf-8?B?YmkzenRIdUhUcWloWTdmaEd5VTNtWjZtVEVCaEZra2Vrejh2K0NFSTYyeE9I?=
 =?utf-8?B?enNHc3JzMStXaEg0WG4wbERRUDB1ckpsT1Q4bURrTWVsNVRCbnVJMWU1VWk0?=
 =?utf-8?B?Nno1Z0NIMWREV1hqZUlGNTloL3htTlZrbkp1UXRVcUVxODYxSHlnUWRTN1lR?=
 =?utf-8?B?MjlEOWdTTGtaMUJYaVM2YjZwcnAxVFdadmQwR3hDQmRxTVhFb0tzOGdwbU4w?=
 =?utf-8?B?UVFRODM5QW1zMFNBSm5jekxhSUxQV05mUkFSQnBBQksyWGsyd1NxcXZuK0Ro?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb7ff73-c3b9-44f4-aa0b-08da97bc3059
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 08:19:35.0299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY8DhgY5EQeSqFNXksl0SvfnMoRQX/XgxtWmv7kX/nhL/vnSRkLBlTeT1iHdUIIJOT4Ib92MK3ptra19h67WGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5497

On Fri, Sep 16, 2022 at 01:20:11AM +0100, Ian Jackson wrote:
> Roger Pau Monné writes ("Re: [PATCH] libvirt: disable Werror for non-libvirt flights"):
> > I don't mind using -Dwerror=false if that's considered better. Ian, do
> > you have an opinion?
> 
> No, I don't think I do.  I think it depends on what kinds of things
> are likely to change, or go wrong, in libvirt.
> 
> -    *)        libvirt_build_runvars+=" make_njobs=1";;
> +    *)        libvirt_build_runvars+=" make_njobs=1 meson_options=-Dwerror=false autogen_options=--disable-werror";;
> 
> I wonder if it would be better to abstract this away and instead have
> a runvar like "libvrit_build_werror=false".  But maybe that is
> gold-plating it.

Did consider this initially, but decided to use specific options for
mesa/autogen in case we need to add further switches to specific
configuration systems (unlikely I guess, because autogen won't be used
anymore).

> If you choose to keep that the way it is, then for either version of
> this patch:
> 
> Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Thanks, Roger.

