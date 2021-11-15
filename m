Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0E450356
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225793.390002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma4J-0002FQ-UQ; Mon, 15 Nov 2021 11:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225793.390002; Mon, 15 Nov 2021 11:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mma4J-0002Cs-QK; Mon, 15 Nov 2021 11:22:35 +0000
Received: by outflank-mailman (input) for mailman id 225793;
 Mon, 15 Nov 2021 11:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+jS=QC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mma4I-0002Cm-3H
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:22:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52c6bd57-4606-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:22:32 +0100 (CET)
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
X-Inumbo-ID: 52c6bd57-4606-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636975352;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KS9hmYH1T2dvudw0ssDUxtNE4eDjPzOfElhyxry02Yo=;
  b=MYD9HZ1LRirQiXk/UVTJ/SMIW+xyD5m2RazP00gXznoKdH5PlAv+LOXN
   xWM0I3ZBOPlYe23WM9hUvFGbajIGBuxyZanwDBUOE28bpJ1EBqVZD4HJR
   UgWbv0TbW7WT2zKmvThtqMl4WAh7CC8BrMBzthY9dG5lhuxnw90fy0BNP
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l3Ke40FS7P+ZzbJm66sDlvXhSxvgZxw6VT0CNqzrwwkLWYANsK6tPyYrN0vj88Atusza7i0WzK
 FLVVGaFJgWFwwBc7V2Q7pS/iLCi23NAv5LUZm/q9E+EnmDBuhlk/19K4aIUygnZI/raboeR+l/
 KcNJtREvOX2r2EbwblVX0qm7ulhRj9ZdBoYDEvGzB/ZxSuU/n7iBkRl2ce2u8MWDZKH+oM+hc9
 Vakika193RvK/baSgKLjnKO2aAeNIaBlFLliPpP9lH8juckxZDyl3Of3WkijF6Ax2mmDXJQwkC
 817kor3XtocfSHzLaWzSi7KD
X-SBRS: 5.1
X-MesageID: 57345095
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L0ZhsaIiz1BBTbeNFE+RPJIlxSXFcZb7ZxGr2PjKsXjdYENSgWBTz
 TYbUGrTOfaKMWSjeosiPY6+8BtQusTQzd82GQBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6xrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Mv9Yr5
 +x0vKevaisoM/L8iNsNDkNHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2XuoQEgW9h26iiG97zJ
 MUcRD5idi6abkZyJXdPCMIEh8SB0yyXnzpw9wvO+PtfD3Lo5A1u0pD9PdzNYNuISM5J2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT85iafXEc9dzd6d/8KtcJpdSwVx
 gLTgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwHpU
 JsswZH2AAUy4XalznPlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJ26wP
 BGO5V0NuPe/2UdGi4ctOepd7OxwksDd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZPdw1XdiZiWsitwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg6AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:pURTgK6icTg+WxdWgAPXwVSBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykLsS+Z2njBLz9I+rDum8rE9ISurQYfcegpUdAa0+4QMHfrLqQcfng+OXNWLu
 v62iIRzADQB0j/I/7LS0UtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa3O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0ITEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4Fy1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfuspcq+SWnqLUwxg1MfheBFBh8Ib1O7qwk5y4KoOgFt7TNEJxBy/r1Zop8CnKhNAqWsqd
 60dJiAr4s+O/P+W5gNctvpcfHHeFAlfii8RF56AW6XX53vaEi94aIe3t0OlZaXkdozvcIPpK
 g=
X-IronPort-AV: E=Sophos;i="5.87,236,1631592000"; 
   d="scan'208";a="57345095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AR4tqLBOcGYng8Tbfu6lFCu8bpy2L/LJYaVDakJgyYhCcWHyX1KWNd7S9SxkqC0o5NrDrLW9E2B/lQ7NXnujggpvGPn7cbqMxeMQSUgiIUs0rtRZzJD628bSB0ImVVZQTaGOyfUK94N/ZJ57kw8GAOAfo/J2aLhaehMQUMA8kgZHMEJmukFGoG7mFtUQpqy5tiWarhWGfARl/6FzgCDF5hePlo7rPQNYmwx+U4c6vw8nJPb8nxXhwT0Dk4fQ+476arPhxIkPyilGSgHg3ybFo5Cw+WZ30vH6NleADyMvT1pxUAfNSPK1u+LIh/xXh1xXNBsB0qmu8+3QslOs+19cPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8sT/hqH5uQ2QMY2HQrVvWLFYRwoakZIqEMNsZAAOWs=;
 b=hNmqoa4gmXDY4a9OroSxCiHdBBhzQCgx7oQfAvNIqT6Ck8zEfMhClFlPqG9WSggfykXehlJIKu35BdvBGrb6au6eXLpuxdNkGKLqYSdKad/21y5jqWsSXn9Urdu8oj1fPiKaLVDmjBhiINgIoLD41O3dKBrRo10oCtYfssH4kvjPJ1JXx6to+WWTuG8vCTeYenRxkCGgjfFIbKQu2yR6nvxJdidVqnMFl7o8484bxbopWtTGsbgdrZELiDQiGd/r68MFSqQw/vbaF3EUS7Cm8FIpzR68m28ngLP0A9r6Pp3Ud7ULIPZrfJUmyJALsAan3z2TVYAP5FdjOOI3eJZt5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8sT/hqH5uQ2QMY2HQrVvWLFYRwoakZIqEMNsZAAOWs=;
 b=UWj7eAi+WJSO50OXVqOJdZIFNfTEWebVisT9GdJfA++QPJBSfBrkQnual59Bm/lLnXRNbM05E7QdcX5WEl5d9NiF8ddlo+J+JHtjx5TWTclLiW67AACmjopYhAi8N2y3Pk7OvYJQEM3CRX63G0pi6yh6lWxRM1f4ceox2/Cpk70=
Date: Mon, 15 Nov 2021 12:22:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] tests/resource: set grant version for created
 domains
Message-ID: <YZJC706fOJQPxvG2@Air-de-Roger>
References: <20211115105106.928-1-roger.pau@citrix.com>
 <ec9b71ee-c687-3556-a999-941886610329@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec9b71ee-c687-3556-a999-941886610329@suse.com>
X-ClientProxiedBy: MR1P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fadd5bcc-7bcc-4d5a-731b-08d9a82a3481
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-Microsoft-Antispam-PRVS: <DM6PR03MB429833C2368751E925E000C08F989@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ol5RzA+6fwZ7DBwtvEAXXjKN8TFyVL5ds5jxVls38ImJb2mhDyr6MlTWqxZg0MfzXD+GuLXfJR8bpD2GMBXtRnkJUzn1Sm34fbyS4THnCg4nptPn6DS0nRQ8Vgf/LHmuYKoq4U8+xaWzXFIZQl3D8NA97C8SgTOcQO5vJ6hLNE3T4VImrRuqTed7trFSvrlEekBFxG5/+Jv08gFIIOb7EeQ7tDk80Mg0rC9Zn/s0NO/FZ+1fqdOqGYtygRrr1vzCAi+FHbPBlVEoQfT4LpJRevew/1ueeLDZODyXUXIU74FhuP6CRUqznH5HJmHyFEfBrziLbwtcNlV0hCVmlh197SaGO/aJftJjg6Vo4kRIm2rCsmOllDgCbGeIBP90L/Hq8v6JYEbc8SQSWiJOLRI2XuWGjOZ8UY+q6z9wM2b4fRRm7t3mzm1tC7GJaPd8Ye7/cjQsqM/cxxRuXI4NEusFtssLe/jo0pOMoXrOkXd75orbfHIA81pjQxMeeik9kkyEMTL4RU6SNbpn++sOfi4r8az0009cY8aAGmctXIu/TPbPyLzXDRrs0kjbsVOqgqg2CjbHuPLv5psSxbUQC0RCnaGxmBcJJ36epFxyHVrCVWgHkY6inRCxQoDjzOu4OUIVgIjY3GjhhqwnRhNiUzj81Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(38100700002)(66476007)(66556008)(956004)(6496006)(66946007)(6486002)(54906003)(4326008)(26005)(82960400001)(186003)(86362001)(33716001)(508600001)(6666004)(53546011)(8676002)(85182001)(2906002)(6916009)(9686003)(316002)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZ2QzhhV2dtanBySzNJWG1vYk5wOGhlL2w2ODh6V2Q5YXNjK0tTTTdQM3JD?=
 =?utf-8?B?ZldZMHpBOEZCOUdRc1JQZWhkbGpBbFYxc3o5K1hMc0ROeFhKZHBXbWR1UENC?=
 =?utf-8?B?Z1Z3ZnIrRk92ajJwQ3hMRmliNk5vTitwcXMwOXRENWE0dHpQVHZIVmpscVlT?=
 =?utf-8?B?bzJkTGQ3ZW5NYjhwb1hrdzhLWlhjVkdOWWkwS09NRTRwRE9lbENEai9nSVhT?=
 =?utf-8?B?SSthL094ODBoSlJJOHRYWFplcWJUbzJDMGdsZEFQeExGRnNOZlQxRWUwTnVq?=
 =?utf-8?B?YURJT3ZzQllNMzFNR1l3TzFBVWppcGEvcG52TWZpQ2NJVzJwaXRoQnRlN1o2?=
 =?utf-8?B?TUpDcnVjeStwemtVOXR1VXJCQ0l1cXJXNmFzcG5mNU9JbHhLSTdGU0FmT3dq?=
 =?utf-8?B?azQ0eXE5WmYvbE5KSjg3dHlWd29VRC9wa1JLWHNLdm8zbmhQVjdLdUk4MUlw?=
 =?utf-8?B?ZGVPNHF0VFBSdUQzbTBYL1F2ZVYvUDQ0b25MNTJIakdBMmp6RzR3dVVUcGdu?=
 =?utf-8?B?WTVzdzMzcFhOY3RqYVpQdkNINE8rSXd6MWRMS1AwYUdiNStaK25Vekt3dE5N?=
 =?utf-8?B?bWdYeHRrSnRpYWpwOTk5N200aUZRMzhkL0FsdHJWMzVpbFFHS0JnN09kWkxj?=
 =?utf-8?B?ckFDa2hGUjRONWViSG1uYmk2UEhxQi9PendOWEo5LytuTTR3UEhqOVQwS0hu?=
 =?utf-8?B?UXNIRTRoT0NaVnhqVmlkWWx4NkhyQlpxbTYwaHdLeDJ4MGxxQkROanNKK2ox?=
 =?utf-8?B?UkpNVUtHQ1hCWE92QTRnRWVpYU5LbDR5QUhmYmNhZEFqZ0ZkVXpDMGcyMkov?=
 =?utf-8?B?U25LeWx5Mno4SVdYbDdwUnRYUHpZUUpJZGZpMitIQzdvajV3cE1nd05vUmRT?=
 =?utf-8?B?QnE0N0w5Umk3dVgxeWM4VDRTeEswN0Zadm9GQytyQ2U2TFdUQjZ6dnNRb0lY?=
 =?utf-8?B?M1EzdVlITGpmZ2pXWmtSVGsxa3JKa0ZaT254TEdpZkNmUmxzYmVzYnVmVkZk?=
 =?utf-8?B?c0dLdEZLTHFFU0pnY3Z6ZmlFb1EzalB1TW9Ob3RhdjJ4c1JFSlJBRUFXeU5s?=
 =?utf-8?B?MElHdldhL1Z2VjhYeExyZFdNOVB1akcxeTM3NE8ydkFSaG1ZbGRHUHVoVU0r?=
 =?utf-8?B?cHN2SGlsMTRna2RVazVqRURYWVk2aTFHcWkrVUZQQ01vZk54TTZRVmtkV0dL?=
 =?utf-8?B?cjFVNjJPQ1VteDJ1NnBDMkFCZENxK2l3WmluNmVQbnUxZks3RDc5TWZtQ0NM?=
 =?utf-8?B?OERvMEpYOUxGdkpVZUc1U3ExazluanVsMi92azExRjMrVnBmcDVWNTV3SklX?=
 =?utf-8?B?dXprOWVlL0dhQzdoLzVoOTEvRlB5V1gvcUhEL3p1aGN6VFhRQWFJNndqb01t?=
 =?utf-8?B?V3o0ODVmQlVIdHBXR2dIK1NiTkxSN2I1YzZNQ0U1NjVMd2RJS2JQL2orMGtj?=
 =?utf-8?B?VExWZzREbFpGYlgwdzRIUFdXRkg0ZzRPNDczdTREelBlRnpvVjFyaFJWNHJJ?=
 =?utf-8?B?eWpOWVlMbHlieFFpSTB6a3pHeEtoZmVwL2xBVnFlV0UvM0xnUFVFWnBCV2Rx?=
 =?utf-8?B?UHUwdEhSZ05tUjJBN2RrNkcrdmNKRi9iVzUydWgvakFSdzdCdUxKR0NsUmhB?=
 =?utf-8?B?djNLZGlMM3RkaURHRFI3bnlNU2cySXc3aEJMdXAvQmowS3k5RVE3d0x2U3BK?=
 =?utf-8?B?WW5tZ2JlUzB0Y3RPWTR3eXBFWnB0Ui9lNVEzcFNVMXNqczgyWGhCeUpKMlY5?=
 =?utf-8?B?M05LUFZIbGwyaFR0TTB6OU96NGlDY2I5MnA4dHU3NFRQdFZnU2NVVisxOWpI?=
 =?utf-8?B?RnBxeTJ6NjRwMGFoV21nWHZRUzFXQmw0NmdnY1hWRzczVHRMNVdBdmRHSlph?=
 =?utf-8?B?Zm0wNW1wcE1jSFhzaUpreGwzN3dtM1pkNGZsS0FOaFdKYkp3UnE5eFhmRmpT?=
 =?utf-8?B?Yjl2eExvdXFCVWhQaGhGY0RBMUdZMy9FMUJRZDViOG82MDhtSkVGZ1NEV0hq?=
 =?utf-8?B?NFVvZ3E0dzBqaUFQOUo5di9ic0lja2pDVU5IUmZVRFRYTnFYNjJ6VG5qd3Ry?=
 =?utf-8?B?SVFtdk1wUGN6R2h6cGZQcmptVmJMVG10bWNxWW1PQWY5Qm9xSGhEQTlTSnlR?=
 =?utf-8?B?NVhOSllZYWFQVkpmQk1RZXJQR0xZLzBDc0RhdWpvR1FGVFVVVnVYdXA4em9p?=
 =?utf-8?Q?WIfttOQB3jkuvGB8YcNKQuk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fadd5bcc-7bcc-4d5a-731b-08d9a82a3481
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:22:27.7396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSCqMMMr7jtpT0eW/ZhbH26e0RTk3diydehYS9Pjb+RDfsNq6R5xuRaE2Sg5hBXpPAVnXgTEtGkzu/Ztf2s2Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

On Mon, Nov 15, 2021 at 12:02:53PM +0100, Jan Beulich wrote:
> On 15.11.2021 11:51, Roger Pau Monne wrote:
> > Set the grant table version for the created domains to use version 1,
> > as that's the used by the test cases. Without setting the grant
> > version the domains for the tests cannot be created.
> > 
> > Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Technically
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> However, two remarks:
> 
> > --- a/tools/tests/resource/test-resource.c
> > +++ b/tools/tests/resource/test-resource.c
> > @@ -120,6 +120,7 @@ static void test_domain_configurations(void)
> >              .create = {
> >                  .max_vcpus = 2,
> >                  .max_grant_frames = 40,
> > +                .grant_opts = 1,
> >              },
> >          },
> >          {
> > @@ -128,6 +129,7 @@ static void test_domain_configurations(void)
> >                  .flags = XEN_DOMCTL_CDF_hvm,
> >                  .max_vcpus = 2,
> >                  .max_grant_frames = 40,
> > +                .grant_opts = 1,
> >                  .arch = {
> >                      .emulation_flags = XEN_X86_EMU_LAPIC,
> >                  },
> > @@ -140,6 +142,7 @@ static void test_domain_configurations(void)
> >                  .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> >                  .max_vcpus = 2,
> >                  .max_grant_frames = 40,
> > +                .grant_opts = 1,
> >              },
> >          },
> >  #endif
> 
> The literal 1-s here are really odd to read already now. It would get
> worse if some flags were specified later on and then used here, ending
> in e.g.
> 
>                 .grant_opts = XEN_DOMCTL_CDG_feature | 1,
> 
> Imo there really ought to be a wrapper macro, such that use sites
> will at the same time have documented what this 1 is about:
> 
>                 .grant_opts = XEN_DOMCTL_CDG_version(1),

OK. I better add one now before we start gaining more of those.

> 
> And then I guess tools/tests/tsx/test-tsx.c needs similar adjustment.

Yes, and the python bindings will also need an adjustment.

Thanks, Roger.

