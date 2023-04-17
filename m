Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE66E4530
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:29:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521938.810958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM6k-0004AG-Oz; Mon, 17 Apr 2023 10:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521938.810958; Mon, 17 Apr 2023 10:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM6k-00048L-LD; Mon, 17 Apr 2023 10:29:14 +0000
Received: by outflank-mailman (input) for mailman id 521938;
 Mon, 17 Apr 2023 10:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLV6=AI=citrix.com=prvs=464b9e9d0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1poM6i-0003m7-Ty
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:29:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00e9972-dd0a-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:29:10 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 06:29:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7065.namprd03.prod.outlook.com (2603:10b6:510:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 10:29:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:29:06 +0000
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
X-Inumbo-ID: b00e9972-dd0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681727350;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nY7Fz9InwZE4oF3Pv/DIA4rYtc6HFcX4XrRo2forpFU=;
  b=KpEnHkU1e/pdZA5B2+ArpjYfR+TNeVu/31n00TIv1sjSl/gEle/Q9Wox
   QM+lrRHihoa+YMsr1ZFy4tRRu0QB2X9tz9DMCONy2sf1rLW9PSnSZaTUN
   He+vTLb2IUO1hCebzsIgRt84jDxZCMhGOoOqSUfupQdL6KiuoefpjbZk9
   Q=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 105690991
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MSLN3KrIcjC7DogNw3UhNPUjRdleBmIKZBIvgKrLsJaIsI4StFCzt
 garIBmPOquLZDCge41+PYq3ph4Pu8XSnN42T1A4+H8xQiIW8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzidNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACghSjG+wLO9+ZeiTe832MINDZPFEqpK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpPSuzgp68z6LGV7mZLLUwER12Bm+Wkjm6MYN1zM
 05P+CV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhqgGqy8qDqzPW0fKzAEbCpdFQ8duYC7+8c0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:Tv3Vxq7DlMcJgR3bFwPXwS+BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhPk3I6urwQZVoIEmsgqKdhLN8AV7MZniDhILFFuBfBOjZskvd8k/Fh4lgPM
 5bGsAQZuEYZmIK7voSlTPIdurIt+P3kpxA692/815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4yGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 P4ek3Cl++eWsOAu1PhPlzonttrcRzau5V+7fm3+4Uow/PX+0eVjcpaKv2/VXsO0ZmSAR4R4a
 LxSlEbTo1OAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA2nkAmcbzaFBOZ
 hwrhGknosSCQmFkDX25tDOWR0vnk2ooWA6mepWi3BES4MRZLJYsIRapSpuYeM9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BHsM2I1Dpdmmx/0iIjtbkit2ZF8Ih4R4hP5u
 zCPKgtnLZSTtUOZaY4H+sFSdvfMB29ffsNChPtHb3KLtB5B5uWke+L3Fwc3pDXRKA1
X-Talos-CUID: 9a23:LNRiSG/Izcxtiitr4FuVv1Y4PuEYNSzW9VLJJEnjV2BHaee7Z3bFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AqQBXCA3pqOrhHSlHnQqOVbKFtjUj6fyLWVIfl68?=
 =?us-ascii?q?8p9SAFR5LNBuFjm+1Tdpy?=
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="105690991"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naNscmX5WCIj2MGQ+ksKSWQuH2gd8xjg/R9jrrR66l19TCBO+lQmGpzMlxuRMRx6aVlOSR5EOnENHXXeFYPHoJTsnuEqasCAlvdAS69OkOgQPvUwJPG0tkSk8MH1Odq4wlZ17fqT6uUaDL+mEpLKPWWuca3ukAicrBZjS5L247HQMZuH0wOjQbKLOvCIf68DJiGGoOhitOG49Ovr5EfOUGh5Ptb8KTAe4WA9MEqrGQFHXn6/v+XXAxxBFjOv5qVrDu8TAWTu0pe8XjiXovGKFSV4DNa53uHNFNvzLwbyatAPRYzYhxE2TBWQQLS7sUBir7dfB4aEyf/XYeXMcc66Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeXr8hmZioZP8K766l8XK8XDW/IsSfBjCtgEip2sOAg=;
 b=TrJWMNqs86kjes+RJx9mzCeJN3TfKHV5jPqtwr0iuRYqHF3YDRSV4whI/WedKdP77dAGhi6Ftcw/VBTyaFBJ/eCZKBmgbTdElkWI6uixjZ3eaUU+evCNfyAvxepX3+cexS2MXSDsiVgPOgmWzvveFzuPNRZsd6I7WhlGR7p7fOXIWb9XrAgwGXaP25il+p0j1v73b7fr2+q3hw1LMA8Nx1Ye7E5ZwRIBms1hjPGKKkbrdU2Xra7FZmUQNuo/uV16nYWhH4T5KQU5GkJPIl08kYT9efNTj7vb3j3iOx4K4UL9uW3FKkQ1LEZer/j6MLuDMjyd8304LYxAILvaJNW/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeXr8hmZioZP8K766l8XK8XDW/IsSfBjCtgEip2sOAg=;
 b=Mz5hQ8jryl1PiUxHXXe8Bo7yGXvMgqZWL8Ym8TFAy0hX28TMNQMOn4pbTiTPZ4vh4FDqSijXa9Rem/lzmcKQCsDWgFf+SN9oO5W4NmJLK6OVA3uaibD1Z4h83/mR1r0rlVyVHSHvSDJHnxpCiLdg6QTOc6kT9BBttVrUCbVxMBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Apr 2023 12:29:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: HEADS UP: re-adding the armhf boxes to osstest
Message-ID: <ZD0fbNMqT7tMZVAq@Air-de-Roger>
References: <ZDkmu0mgy23ypaL7@Air-de-Roger>
 <92e6ea3e-a381-a77e-f909-bf65d009647f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e6ea3e-a381-a77e-f909-bf65d009647f@suse.com>
X-ClientProxiedBy: LO4P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ad6124-1b3b-4037-4aa9-08db3f2e9257
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rmm9gJLJ6nvR1Xm480z9PgfVYg1gW/39Q0IC6VwA25q7QAc2M08HQ+bNT2odSj3MYQemqiIoWFK/t/+cOv5TD123bS3WeEiwj4d2yZwbEcQTWY5YCGK/4Le1yrXQ0VXxJtqI84+kE1cLP6F3gAepm2O51/Zii+4EXgLXiZSa/wcVNva6ifZ4mdlKvs1piEn3qgxIZyvNmgPwcz5ZVFC0l9CytgCUHaon3Asc9D/ymS1G0bVhCzGUVMP5+NOmWnLXCC2wEyqDXOaaymAx8TeUoZSgVfQGH/i9a3SzLcmi6xtbSh4udn0hD4RIJmbTTER1E7d8Lwgxs2x9aZITaA2uptFBiWUIN4POobHzcN4WY5r50TPVGZbLvXxWtFDFwtSzCj9l/mKGjpAZ3UsD3/RlDzVFCkBEh1KhANXusyOzBjJSgysVoYyippry8lsfa0Rgfjt3BEGNnmdM+g3eWTKgYzQKMOg6F++H5XC1P+D3TKzD781cSWwewH3Nt+tSuDvABaLcFVHN1UIwFAkojYYsMjFgqxzcngiDmXJlmyTK7+Frwi6YNpfy53ctSAU27y6I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199021)(316002)(53546011)(6512007)(186003)(9686003)(6666004)(6486002)(86362001)(38100700002)(26005)(33716001)(6506007)(82960400001)(66476007)(66556008)(83380400001)(66946007)(6916009)(4326008)(41300700001)(85182001)(8936002)(8676002)(5660300002)(4744005)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WllzTURwNHRuUCtQOGRSb1NYUVlPcUZQT1AyS3pFbXVaUmx6SnNTSlZxdFdX?=
 =?utf-8?B?TVBMZ1AwWE4yZDRtQzJrb0U0WDRWb1dUN2dDaWxTRDJXeHl1OVh6MW9QTWlS?=
 =?utf-8?B?em5oRnhkbGRtUzlSQVRPWitEYTgzWE04TVpEMFRLSTVmcFdFYmp3ZlRmVFB4?=
 =?utf-8?B?c0x3enRHc05PL0RnTFhBa0xicmJTUTgycFVSOGx1aUVJa0swaUtWUGYrNjZv?=
 =?utf-8?B?Z0ZpU0tYWkhmZGFZc1lpaWYzT1RYZCtYQkVpNTEvVkRxOENuUmNlSzN2ME40?=
 =?utf-8?B?SFMxVmFzdFNreUJLZFZvdU15MTJzNmFDVk5Xbnd5MGh6NGxqMEozSWVuV1NE?=
 =?utf-8?B?WWF5V0QzTktadmRmMWpZK2duNktUbmQzVlEyY3E3bTd3QW5PREs2cEovWTda?=
 =?utf-8?B?cDFRaFVNdW5JanRzR2p4eENXNGgwUFNxQTBOdmxhekMvYXVrVDY0U2RRV05O?=
 =?utf-8?B?QVdnMFVOYWxNNzlxQjVkTXdkQ2Qybk1EaTlHaUxmMXFVNDg5ZmIydFJEclhJ?=
 =?utf-8?B?U3JzcEFNSUp4ampRWDhYOEtlYVJDeWVKUDZCZDEyQVdiamJSMVU2QitLZnMw?=
 =?utf-8?B?b0prUVZBQjVrcENaYmt2MWg2VS9jNXI5d3M4UUNJaThGWmVLSjFhQkpFYkpU?=
 =?utf-8?B?dTM1RWIvOWJXZ1JERTVMcytWcVprdDJaVjdpVjQ3UGJMeFFZRW4rblRTVEZN?=
 =?utf-8?B?L0doeHVXKzdwdjlkOUYrTUJQNnFkV3UwOTNabjgzY0NIMlhibk4ycWE3ZDJo?=
 =?utf-8?B?VWZjN1B1UjVHZktQaFBZYW5XT1NiOFFxajUydUhsclQyS0VabThqMG1oV284?=
 =?utf-8?B?WlNFOXhZb25hZm0wSW4vbVQyaVFoRWpOUEtNamhOb25lMEpUUTBYTUs5WkNu?=
 =?utf-8?B?VUxJQmRlK2x2V00wcGhqMjRuSTdWY3hwZHJSNm1OSGhhajUxSU1qUzRaUzA3?=
 =?utf-8?B?clhrYS9aS3BMZWdLTzFNY0QrdVBnbWRtaXZxeWFqYU1QTVVvSnZMVFZSQ3JP?=
 =?utf-8?B?ZU5wU0d1Wk8vVW1jY2VvYVV2ZWNpUW9NK292cHlTcDh3djQvb2FOZkVIWjhE?=
 =?utf-8?B?V3dIZWRPN2dwNXR3VXFML3ptL1Z5WEpFVDhhOHlSOExmY1hHdDAxMlZQbGVo?=
 =?utf-8?B?RlpVazBiQ3ljREF2b09TbThiL09jb1MxMXRSbU1lZmlWMjRpaGhXMDVudTZp?=
 =?utf-8?B?b1VjUFA0SzRlZC9VOTNvc1prQmNtaGkvQXIzS2NlMm9JbWRQSlRseGRnV0Z3?=
 =?utf-8?B?TWJXejJ1RFUrMEhLaGJlVjJRZ1c5bzJYeU9mejVHVWdCNUhlbUpKQXRydXJ2?=
 =?utf-8?B?SnhWTjltQk5Gdk1BRWlqR1NEWm9NaERDUnNzZzNvMFM3WHc3WUx5UTVHaU5T?=
 =?utf-8?B?VnE4N1QvUU1RemF6V3FFeWM5Ty9GaGl1TnhIQU5uR3VMNFZFTk8zR3FLTzY4?=
 =?utf-8?B?ZDc2VzB5ODUrVXpKa084Z0JLeEFRM2lTZEdDTnN1M0ovN3g1SFRlZ3BXUnZR?=
 =?utf-8?B?Yk9CZUo1RWtsZE1qUFA2ejBORjNSSVc0bStDai9IZTZKd3V0Q2N0aWRzMi9C?=
 =?utf-8?B?c3Y0Y3NpUGF0Yk1tVWlZVUE5SUROU2VqRWNtandYTUYwa05kVmRXZWozNGlh?=
 =?utf-8?B?TUsyWUFBdjBwT05EbU9uRG9DUXIvODBtdGdWMWtYSlp0cGpIVVd5R3hGWVpY?=
 =?utf-8?B?YjN2TG9qZEtQNnA5VVZlUjE0VEpPRDFJNU5CSGJQdDJKbEFGYmg2WHYyMVd2?=
 =?utf-8?B?dkhINkVUbElZOUU2SElldFB6UmZPZTVtcnRaZlJ4cWtUYzViU3Y5Mmw2V3JG?=
 =?utf-8?B?dGp1anlNTVJlc0lBSkM2MzRybjJsbzlrdlpBYlhvVkN6TDhJWVNDSHhUTlpj?=
 =?utf-8?B?YWZyMExXeFZkRUR2SURhMHFTSWtZeUJwV0l3dTRZbUlkRmVnNHlSVTdUT1VG?=
 =?utf-8?B?K2xVTlRSU244VmxlR1BhNVVIcnZ3VmxhMG1zems2WjZmdlV1VTBodUljK0lH?=
 =?utf-8?B?T210U2FYUGNjdmtteEIxVGZGcVdYdUFrVjM5K1lRUG9vcGRVdk13Z291M3VP?=
 =?utf-8?B?bnhyS0ZOeGhadnVjejNmMzlKQ2pEalM4VUhPYVF4TFZUTERTdmcxY0ttZCti?=
 =?utf-8?Q?51CAul6/uIb3v2AR3Xg7ZZx4y?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/XAYuVrzbrynkWFX6Q726iH+/zN5iLfzBWrAMtXk1IWK7obMFmsP8wTd4F89lbSHptPjGjkIxSXUJQBiFGO/+RXeonkiOFm9VS70W9mwvu1HJ1l0ni2YNINKUUKsQ/kE7truGUVC/FOVCcvk8HnSxBTFC4czF4Bh+wl1ZLMBD9E2o7wHeMvMsAvIIrSJKRm5/ZAbgS4dLFlqYH3D2h6r32Cgtl+7PuZSBnuOPK3dYiaz6DPNj3IUzEH+vdHhlm9TiBj8h752j8AW1ruUHAKlI3f+o1wdPuWtlNpMYY9YbB9u24fzC4vkfb9HqmhG6oqmR3Wk7yh/Wqa/Kr68tAjEv2vQs2pkxi05jidG5FC6fLhZEAG9NAcOkic0CI2axx1gZcPdKa7tHg9LSlkIDqFi3E9lnHl0HdMKhsoRt0e6Nz4y6P3qwV9/KaAZ7VHYqq1+ppJUjeLRCkpPskYourxknQVUxEA4IwVHVm92jSRMNdHEPlzFEVO9hAJcy4Je6NrgnIewwITiIfReU5n2C/vVRXs3n0Tx8x6izjtzH9STlLTX1+NVdewp0v9laCZlIBByzG0cqErP1jiLX/5EF2Maj9zTzM1L8dEVGeYp0ygzrE3aPifG0ofgiA6t+tbOga/ilH41ZNTJ30VBlpV2GX9WXKhrYM6ljVmMWKlB0EmBOdt0ev7js+N/4QwDglQ+sfR7Os3zksERJsgXq+Sq37ad4I8ph+unMrGGYJnjTKGJLDXuX895ALeibdbzmrKQYKvQBHBWhOszMFTulk/EsLH3+CPPNGipBsYiIjyLzVkc6g+fqyC+5XmaZV1Hv8jXjAcL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ad6124-1b3b-4037-4aa9-08db3f2e9257
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:29:06.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pb6emBeZTXiobjlXzxUHYoKQrLoEnSZrjQQcWc371El1fUy+rWhy5HT+V5wFS6jDuOmePixdGUXWBcHOgHnwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7065

On Mon, Apr 17, 2023 at 10:23:59AM +0200, Jan Beulich wrote:
> On 14.04.2023 12:11, Roger Pau Monné wrote:
> > We finally had the broken PDU replaced in the osstest colo, and the
> > armhf boxes are operational again (those are the arndales and the
> > cubietrucks).
> > 
> > I've run some ad-hoc tests on them and they look fine. I plan to bless
> > them before the end of the day.
> > 
> > As usual, keep and eye on any failures that could be caused by the
> > newly added boxes.
> 
> Sadly recent flights look to be reporting them as broken again.

I've unblessed arndale-bluewater which doesn't seem to reboot properly
when the reboot is initiated by the OS:

The system is going down NOW!
Sent SIGKILL to all processes
Apr 17 06:59:53.337634 
Requesting system reboot
Apr 17 06:59:53.337668 [ 1109.675149] reboot: Reû

The other boxes seem to be fine.

Thanks, Roger.

