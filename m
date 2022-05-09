Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992B51FDF0
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 15:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324537.546636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3Ij-0001ER-VA; Mon, 09 May 2022 13:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324537.546636; Mon, 09 May 2022 13:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no3Ij-0001Bw-SG; Mon, 09 May 2022 13:19:49 +0000
Received: by outflank-mailman (input) for mailman id 324537;
 Mon, 09 May 2022 13:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qz3g=VR=citrix.com=prvs=1216f8a52=roger.pau@srs-se1.protection.inumbo.net>)
 id 1no3Ii-0001Bm-Cf
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 13:19:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b143967b-cf9a-11ec-a406-831a346695d4;
 Mon, 09 May 2022 15:19:46 +0200 (CEST)
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2022 09:19:42 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB3695.namprd03.prod.outlook.com (2603:10b6:805:4b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 13:19:40 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 13:19:40 +0000
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
X-Inumbo-ID: b143967b-cf9a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652102386;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tATOXAnbmdgsf2o/UzATsF1kogSU5808J3WZMNfRTUo=;
  b=WP2hMdiQ9MAEe0Kgf2TuBs5eT80Eoo9Ltw1qslxfKppTdeioUyVRlh61
   XNyw93fwFaCWcU2ATc/D0AH4LjcswkbRaYqgcgCYM+3sdqCXoHI/WtYYS
   SoyEUE2fWyRTs46ammfflUbCRDga9IZAjbAdwnT+HiBEQKH+pK4bgj2pj
   Q=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 70757991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4ayOBaAUBuSpkRVW/+Liw5YqxClBgxIJ4kV8jS/XYbTApDwl12cAy
 TZODDyHaazfY2Wkf4oia9yz8kkDvZPVn9NnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Nh09Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhR0
 YRB7cfoTTsLP/fCybtCfiAFGBNHaPguFL/veRBTsOS15mieKT7G5awrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t/B8yaK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7/32yauImQwRFS95rJ08yvzyxxN7bnkNtmSQ+zWfJRxpxPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fXmRrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZDddgnuckeVTEsk
 FiTkLvBOztrt7GETGOHwZ2dpziyJCs9IHcLYGkPSg5ty9Puup0phxTDCNNqCreoj8bdECv1h
 TuNqUADa647iMcK0+Cx+wnBijf0+ZzRFFZpv0PQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytbFUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:jeDaq6h05L0udvigLsJ+m+tpZnBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="70757991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8tKRAU6NzclfOOrRYBcCChAHOkF8cHOvDwTUBcFweaF9ZBD+8KiTkLGB9z9GCJNlfV7HcYTO2tAmRrCI1JFxQfdLT3J4OgBGj9evJeGsRrpGiiJtjoiqkirvfDMia7+oBetaxYfUl1lOmaq+NzzrEnujs0zkURMrCwbY9GifX3QOyFZ6lBtGTGub8srOxZosZ5FohC0fqFnYU6c09uFQfNTqL3aYo0IawcKVSbH+y3PbVOJT9CFqG1c0tHEfIz1hXjGcs48eSvmhyyZE+4sQXB1NzYwYF1m2cJUpxFOBBQnLDeshANk7+LiXpHzSZG7hS9AOWdv8rSZLFKKiZU+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3J9GGBre8qxJQVjdYz1Xg5oJYU2Mu3jLazozNoGKLI=;
 b=NRibSyhyljOjz4EHLgP9tNjQ1DeNRvMk66pzs4Ov9ioOCCI4DWGUmYqrYLatV3Z+oX1C1q16jFdx2stSw8CLblfLgCxij2UK9J/kZKWi1FvVqQQwrR7lwUem0RRfVL96fAu59F3h6IthG9o4SDUTTUNh8Mlf5sg9zHLtcGGxrKajC3zPxYucqToEwOlIsZ/DB2CEZf7i3GNlpqyEbiDwJDE7jckiDeOW/oyB7vVz6WlPL5CVMCbyga7qcZTE7qo9Vjd3H9INY8hrS2I4JGa4rzdnRBkm5hbI77euDg0GukO4g4xIbNaxRa3rmCcvaeVRRADC/I3b/f3yszGvrlFRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3J9GGBre8qxJQVjdYz1Xg5oJYU2Mu3jLazozNoGKLI=;
 b=a4lzXO/WWmXly4LEn50gRSrzad/gQOCX3d5Iq4GxrjxKM57TON4L6IckKQuR9zSyuA9e18SPWEDD3gJotzKL/C992C0KaKxbibtJzchqj8vfdDdfbISWbfwUYuv0/kHNAJLZwpG0dvtgZkTj0SmQfusXjOOMfsPntAelVsu6zbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 9 May 2022 15:19:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/3] x86/shadow: Don't use signed bitfield in
 sh_emulate_ctxt
Message-ID: <YnkU53/Jm7i1Ic+z@Air-de-Roger>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
 <20220509122409.14184-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509122409.14184-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: febfcbb9-3032-411d-b7e9-08da31be92b5
X-MS-TrafficTypeDiagnostic: SN6PR03MB3695:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB36957131745A7E036D17710F8FC69@SN6PR03MB3695.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GO+kk21inPUXO4OyjiNwLmtuZFgBFbCdAxTkKUq6ynZw4RwKbiYgzeXWE1lJfLV1xwwq8XqatwbuMdwm1kAnxGyNzqoC8aKG4INI1RvQvExbQaURqyIo52Ya/sLdlHiADCtfxjPN9yUX3V9b4ZFUmbw+saRdIIM5WK6LoNRNmv5SAqy0shhd+HEGfcsSW24xJk/4hvxHrCiHN7fiYyjlrh125QGbSPpHO1Ag+s6y6b0GYt74rc8v3qXsT/h60hpN5QBRCv74VfNPzHi4lvvubUShG50Ute191dFe5oaHVhvBARTL78orzMQLbPSM8ZcHZYJgu0f6/GUL8asOcXFeQQt3V2FvxL/wahn+DLDSvSiyXQwHWHBtQubFc6JmBq0xEutBt2tsPqMdTfmkWpIiXVE9DCMl4nrDKNpzSrgZjWPBIgoMj+MP8AsldlrKbqF7V3StixVLUgGg9gSqzefMMt/W07yXKVnIamwT4ts4yc08jSsFHf9TtJMNizVV9IEIGJNojGRIlGUo2JilE7Ami4rdEqT3cvXF/Jp2VBG99zn1DC/NUaqVkF/t7s6hXKoMpKqvwcJQd9rG6xZMitWLkzTjCrSvKV8sZ/+xfmVKDPPPOz55ZwFYEeBIQGvErL57q/pXHPp20iECkHEoEm/FPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6666004)(2906002)(82960400001)(38100700002)(8936002)(6486002)(4744005)(186003)(508600001)(85182001)(86362001)(9686003)(26005)(6506007)(5660300002)(66556008)(6512007)(66476007)(8676002)(6862004)(4326008)(66946007)(54906003)(6636002)(316002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1RKZEZQblEzTEZ4eDhmSVh6aXRsbk0zNnp3UE1wUVJYdnByU3ZIU2VZZW5G?=
 =?utf-8?B?MXFDODBCNGFPSVZTZlBwUTA5RDdETWhJME9qbVY4Ulg0Zk1zaUp0am0xYTU0?=
 =?utf-8?B?K2JpdDdsTms5cm1UR2xKY0ZVU2MrdGRGVHpMZnB2ZFV3N2RIT1E2U3l0U1hx?=
 =?utf-8?B?SFdBT0NjL01Sd3N2aHFjek02YjlwL3QrS0xhdHBUZmc1RnZPakx6d2ZnNDVF?=
 =?utf-8?B?dk1wTkxWOHFaNUdYNTlXNk4xTmUzUWVYUTVHYzMzcTR3MHFhb2FSRjh6QmJs?=
 =?utf-8?B?NzB4eHRlN2M3aUMxNVRGVlVhMm83QlhRVGF2MzEvRkFaT2FoVk9MZ21mUExn?=
 =?utf-8?B?OG0vRDJocFpJZzYzU3VRRW5nYVh1QmYvemRISnlqRHg1VFlCYXZta1p1dEdm?=
 =?utf-8?B?YWFKWE9mc2c5dmdIQlNOTVNGSjRLRlM0Ulh6UzZhNnpxemtJcnNtcE9OLzE4?=
 =?utf-8?B?eE1VNWptSTBqTnhTejZPcGtKbSszekVrL3VUMUFBVUc0ak1FOG80bXNINkJy?=
 =?utf-8?B?ZHBxQUVralk5S0xldjNEKzJhcXdNMjZVdGhLTkgzZWhiblBBNVU2L1dKdGo0?=
 =?utf-8?B?eFhJY1RCQTBPZUJQSXVEdDdHdzgrOFd0YUg4WlVqVENmbmhQWXVtbXVwRlpP?=
 =?utf-8?B?NU4yUWd4NjJERFY4RDNtZ3JITC9GZDE2L2pTandFSzUzYUxMVnJHS0Z2VGlR?=
 =?utf-8?B?N2dUMXltTlVkQkszQk1BR0lOa1NyT2FwVnVqbUpvUXpNcVhuMU1LbUgrZUxs?=
 =?utf-8?B?M0J6cGFvLzZQMmlWcVh1RHpPMTdtTllGTktSdzNnczVCUis3bnhlSkJlU2M4?=
 =?utf-8?B?VU5XRlJEZGg2R3UxR21jcU10eUpWeXJYdytCMHI5WlNTaVNTb2tUeGREUlJH?=
 =?utf-8?B?ek9BazJjMk1IeDB2Qm83bHhwQ1ZRcWRya0dYZHFVVm1lSXNidEIrWjE2N3pG?=
 =?utf-8?B?QnFhd0pJYzJvSjVjRmNTaXZ0cU1Ga0dwc21UWnRjdnM5L0w3U1BFWFFMb1dY?=
 =?utf-8?B?T3k0aGxyRngwVkUxUCtJVzlxU1RPZlJxbmdTSjJMckVxS3luL21BVlMyUlRP?=
 =?utf-8?B?ZDlMYnNaQUNQaXFYNTVBRXlJNXpMZ1I4QS90QzN2T0FRZ0RPc2E3dWlYZTJu?=
 =?utf-8?B?NVRUN0g2ZnVua1J2SnYraG1qQThHQVZiSXFMeEFQVkR1eTd5Y0xnUkI1Ui9t?=
 =?utf-8?B?ZXJPNEUyU3hBanQwcXZKRkFlK3VVNkZDZ2k5bms3VG5pWWlVcmI0Umswa2ZS?=
 =?utf-8?B?NTJCWG14VGVkdkY4by9XMFYzOWM2TmdOcUpkbElXYnRoVDRxWUJMa1dGbG9y?=
 =?utf-8?B?eER2N1hoRGI1WWhKZ1BEM1VoSkI3bk9KVjF6U3NCYWZXb2NQT0E5RmFFRDlB?=
 =?utf-8?B?cVRaK2NrNWZGaHlqTVB6SllnVW04c1k5SjErMkoxM292U2R3ZHE3SE9aN01S?=
 =?utf-8?B?WXFWR0pEVlNFZ1E4RjlYSlJESllUMGNOd2RsSTN4Q0w4YitNUEpvMEY0TVdO?=
 =?utf-8?B?TFpteGEwYXhId3hPdzUrWXdETnBSWXNyYWZ1Y2h6KzFicjI3RkM1VXlONGxE?=
 =?utf-8?B?R1JPN0NiR2xJOXlpbVNwSU92WmJ4SmNWcWJ6eHpIdTFxWlVSNFFXTXo2VURT?=
 =?utf-8?B?cVczbVFHdzY2azZJc0NmNnFMc3ozNGxFTmg0emlnOSsvQzF0TWM0elVtT1RS?=
 =?utf-8?B?T09rdS81R0tFcUVERFFIME15ZUsvdjRDaldsQ054aEIwQk0vTWdpRzZGQTVP?=
 =?utf-8?B?ZjZxRzVSV0FUd2Y1T2JkdisrNkp6cS9wdGR1TEtSTmlGWjgrbnBYMjlxVmpU?=
 =?utf-8?B?REV4Mkw4UTR2NTFmY2xCdG9iQWw1dXJONkRCenBqdHYzOThkSXJJRm42Sjhn?=
 =?utf-8?B?K21McjAzUy9aWWVDcFJDVXlNenE0RGNTS0RQc0JPeXRidURBS3hqLyt0OW94?=
 =?utf-8?B?N1lvN01ieFV1c1gwRXRidnZVQVdKekUxQUZYQzZoNXBnb0FKWDFWekhEZnNF?=
 =?utf-8?B?cExDRksyNFpxQVZUaGRRaXZHSjNzcksvTFgvaERYL1hDWk81SFd2MFB3Y3ZX?=
 =?utf-8?B?ZnhWSVcrMGRyN1MzQm5LamlUMk1ydDE5dTlvZVpqK3pGcjRBTGNyK3FraG1s?=
 =?utf-8?B?TG9ReHQwYm80TGhsekRzZ1V2dGkwUHQvQXQyM2JkdXpybkRxZzJuZ1VoQUw4?=
 =?utf-8?B?U1A3Y0F4NHNxSlo3NWF1VXc2N0lkV3ltUXVaeFFOK3ZXUkZIc24rMXNXWEZN?=
 =?utf-8?B?Mk05dWVaaWFwVlh6L1RvVDEvbGhXTWNxY2hOd2NOUFRpWThMWDdUQXdBRGxG?=
 =?utf-8?B?KzdpQzZrcFM1Zmp5S2x4WlZvYUhOUUtqUkw1K2IzOFI2OXNoL2lRZkdSZlJO?=
 =?utf-8?Q?vtvDcCpyPZnR3PWE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febfcbb9-3032-411d-b7e9-08da31be92b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:19:40.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UJ7hJ8OTTw/gO9O3FGm+GDW5hQsRs2vM10xvWPKHtvngb4e/UvH/fWS0wf11P1ucX/1abYmcWf9SN+rP7a37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3695

On Mon, May 09, 2022 at 01:24:08PM +0100, Andrew Cooper wrote:
> 'int' bitfields in particular have implementation defined behaviour under gcc
> and can change signed-ness with -funsigned-bitfields.
> 
> There is no need for low_bit_was_clear to be a bitfield in the first place; it
> is only used as a boolean.  Doing so even improves the code generation in
> sh_emulate_map_dest() to avoid emitting a merge with structure padding.
> 
> Spotted by Eclair MISRA scanner.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

