Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49646E5DC7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 11:44:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522716.812255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohss-0007sm-95; Tue, 18 Apr 2023 09:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522716.812255; Tue, 18 Apr 2023 09:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pohss-0007q5-6L; Tue, 18 Apr 2023 09:44:22 +0000
Received: by outflank-mailman (input) for mailman id 522716;
 Tue, 18 Apr 2023 09:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pohsq-0007pz-7R
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 09:44:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9512c4bf-ddcd-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 11:44:17 +0200 (CEST)
Received: from mail-mw2nam04lp2173.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 05:44:12 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 09:44:08 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 09:44:07 +0000
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
X-Inumbo-ID: 9512c4bf-ddcd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681811057;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J9Q2lmcQwcobYidzzvJ5wj4VWY+TXBo6HS+1R6nwPeE=;
  b=Sw66P3YElu+IslrTYh0cMpeDPvjcmTAwXiCr6mYCrp6X10vZQqtL+R9t
   FIHzRAe5q5WvnheYS+v+LWZ7EahoxI8pmTmzjWeXUG/CoMsrHh5Aqlkg3
   4CYSvJiseHFMlhZ2vvCk3p+cYZqQzTgCnV0+hyfEp+t+8DE7uiRdo73cC
   Q=;
X-IronPort-RemoteIP: 104.47.73.173
X-IronPort-MID: 104708537
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:c1X5RqzF0KMDbQFgAoZ6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUPz
 GoZD2DUOvqON2P8f95wPNnkoxkHuZOHxtQwGldk/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKAT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUxur
 KZGFSwtVDSSv+CXg5SGYa5l2dt2eaEHPKtH0p1h5RfwKK56BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVlVMquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eTwnurBdlNfFG+3tRq2HOXz2gdMyMPb3ai/eS61heUf+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoBUlED6ty7/IUr1EuQFZBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:sRQrmqsv51BkeBPvt9GZ1mzR7skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsiMc7Qx6ZJhOo7+90cW7L080sKQFgrX5Xo3SODUO2lHJEGgK1+KLrwEIWReOlNK1vZ
 0KT0EUMqyUMbEVt6fHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3AXvf6qmrBX8o4yzPMniHwpZnmUe0FKyeD8WvwGWu?=
 =?us-ascii?q?pMWRIC5uoYhiZp7wxxg=3D=3D?=
X-Talos-MUID: 9a23:ZkSvjAbUQPhJ6+BTnT+0qjVrMMlT3b2UJVlRjJZa4uOgDHkl
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="104708537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHDQs0yV4rtmOcLp2fkxL7t60kpUsa+N6zRPTuoR3vXNv7FJuRZjs7G2nNSYO6VplGxm+7PdL251krJlCLdmPUMasZxUuwg6S//U+KBuK86VvVn8KoFiFoyrnfUY51MaufTgCMtzqbk9Ht6PqSzTPm7JC4VfHdShp3qHL2K72TvtoZL090DrjJnt6VG2w8ZdWEmKW8T+HOV8WHWqv3ymAw34V5vZTsUp2E61mSKmpJj6ltjpzQdYpxTCzr4uS2K+i6hYhxGppxEPvTiF3dstprYDfyxslxuCR4yvQplS7H7FkqikYCc0DbEf96QyVin4ZnHzsaX8+i1Ksui6Pqg25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=en1PDyDiRCEyYYwQMj/IFqRb6BrIjBNL8WfzdWZMF4I=;
 b=CYY9z33hVf1Xg/hf7qLu/4/f8hQ6LC9lpAiAi++7P2a8CZ3JVTJLJoTkG4CVyQmXzv+5R/p40SJ+saLYIj34ZwwJeeTpAt/Z2q4nROeBjDaIW++SeEKmQoBp1KZQHxanYdQa51FBpaJ6e1hi+EUYDHZb8lAo52z6/op4ebeenD2GHqe9Lm8wWRS/ZxXe7waPYdwFcVvAcL6KYfm6lKdvU+UUEqlPazzIxUnfhJ02N5QCDoG4vbgnSOUj8y3zPQYu7Vq8dB06Mmq6l2tj3h4MqE47WrSGKERyBPPTW93nNy9VkcoJpS1yQib18ds9nOJkeL9DiDiekj6olqV3xFf2uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=en1PDyDiRCEyYYwQMj/IFqRb6BrIjBNL8WfzdWZMF4I=;
 b=jMShyvYo8r2O+XtCMX7lk9yK6dXsBQFfWBNph81IzKGQjExIGsN0dZcVDZCDrYlJ06UAf0iukiJnI7ksZScAm6LtqfgOdWmJn9lDk/jhwEyI/Jr9804gdwGrdKHemGQIeCOfaZYoDSdbiG0Jm3vQ2Dfc+7DjK4YMlrVejwTehBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 11:44:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH] tests/cpu-policy: fix "run" goal
Message-ID: <ZD5mY4ayWXO15Cpf@Air-de-Roger>
References: <80a02af5-9154-8289-4e92-6016c0948a61@suse.com>
 <ZD5jT/F8b82ZkGxo@Air-de-Roger>
 <963ede97-efd2-e63c-429d-32426386c3d8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <963ede97-efd2-e63c-429d-32426386c3d8@suse.com>
X-ClientProxiedBy: LNXP265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: af06885c-0aa0-447c-5a59-08db3ff17479
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TyymGFE4ctyLsDTMnWXQQrnv9iDiSQMhDHnnfsMUqxsr9ME4jlKcPCPUWziaqDiWh2+5Y2Ck2loFo7eh3YJOAZQOqzuoEQClx2kvSk3+W3LCIoWeOXdTcHngSI+38DzUSyAhppsr75BIQ9v6Yd04fK0FUltihu3A3eMeUxGqdXtqBV8kb6+fxRY1b3aX8djz+AWnoHzUWUjQaTcXqckeq6Z6XNwmnvNj5UEmbpIN26gl8fqIEoi2dX2a3hHutvTNEUIf+2NfcUah6PdlXFXufcSVRAUG1nDezo6zza4qnOHeO/DEb/LNrkxMjcrtScoe7jJ17ifrPKjBLXYc+f6TmfLwBAdzEZKu+gmtB4r3X/nharhGl62K7uzs5vq6KaXqotzP/dGPRHo4+qCJlfRXJHDKoKyIqydFxu3vsDXxH6OJYkz+33Wsnr6TqG+YMP0TGAWJkA3GDXfqcdPPYmPSWtRPeyiCPflYNjDV1ethlLvlcZ9q4wpIeXENXmKPH+Q8l96ScJUVBQ4+LMp2BEddYKEXsj/GQaC3In0EI9idPLbZfIE4AejFgYqGwahaJonxSBNUxDAeBIDQPj5p15lSVsf1Mcgw3C2DxZR+CFMLFoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(66476007)(82960400001)(66556008)(66946007)(6916009)(478600001)(4326008)(316002)(5660300002)(8676002)(8936002)(38100700002)(41300700001)(54906003)(186003)(53546011)(6666004)(6486002)(9686003)(6506007)(107886003)(26005)(6512007)(33716001)(85182001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFlrRnQ4NlRCV0RTUnVEZ0VTcFlMVFV2QUlMRzhObWo1SFRWZVJ3VUs5UDNa?=
 =?utf-8?B?SDdFOXU1N1NxRGVyc0ozSnc2MWpDWlJlQW1TbExuZ3I4bkpTS0dtNmFRVU94?=
 =?utf-8?B?VFY5ejArNU9IN215ODBXc2V2Z2ZnSm44d3lSMUtwRXo0dm9LMlNkY2pDQjdq?=
 =?utf-8?B?eDlReEZ4VHJrUk13anRqRUE3c3dsNDVTNUdhL2tPTmlUa3dobWFZMnpYeUh1?=
 =?utf-8?B?RmViQmdUSTR3SlRvMGtWWk9Hem4zaEJreWZaV2txTEFzb05UNDVEeFpYZGhU?=
 =?utf-8?B?dTNFS2k3S055Z3hyM2NtaDNSMUdoSjNmR0lFNitCUzJTNFdzQ3YwV3ZjK1Jz?=
 =?utf-8?B?amtZU2pPbjlMUVFnd3R3QVZCa2ltQTFxVTBrNlFsazY1R3ZuWUtpeVZiNUYv?=
 =?utf-8?B?dWNoNzcwSjMvTm5oUW8xZFF4emE0R3FQWUNTTE9uZHNSOG5UNFk5dm5ZQWxS?=
 =?utf-8?B?RHpIK1lxdkx5QktzY0hBSzFjNEkrZlJCQmtidld0WEk5MG9sNFB0OVRsYVVo?=
 =?utf-8?B?a0J1Wi80dnpIdlhXSzR5MUloaTFyT0hrOWphWjdwRGN6OU0wSXFUNWEwNUln?=
 =?utf-8?B?TjdqZDM3Zm9CeGxGakd0b3dIUTZqUkZIQ1E2YWtLSlZyR2JycWJIR0hSN0xU?=
 =?utf-8?B?b21HZjZTK3FCbDBCS0N5TE9OMkpvWU02ZzVkVUFDWFFWQW5DcXIvaWo3QVdz?=
 =?utf-8?B?V2lNYlRtdlJ3cnAvUFRRVVlNbVhtdHA5TDEvbURuMU0zSk9kMzFhVExpWUJv?=
 =?utf-8?B?SlZJc0RnbGNOZnhOMmVpTFNpaEc4RzRtNUJyS0QvRDBycUQxYmd0SmdlTUhB?=
 =?utf-8?B?eDBPU2dIK0VnekhrdjdVaUVMcFMxa2pQR1hCaE5oT0ZJRW5uNjdwbEZQTmpr?=
 =?utf-8?B?R0tWQi9VQ0s1QW5nak9KUzluSFplSlNWWVdWZDBJMlJ0UmwxV3l6eXRzdjFG?=
 =?utf-8?B?U2w1ZC9FWERtd2R5aXFFak4yb29nVThpcm5MVGpxM3VZU1ZVVXM3a2pJbGpZ?=
 =?utf-8?B?eFRTUUVlYTNvTm5PaTZBRXl3R2gzZ205TWJoS25QVnlpdHl3UVd0WERKY3BE?=
 =?utf-8?B?bmVYaFlZd0pJTUhaS0VuM01lZ3lSNFFPVkNSdnRsSGZORnZjZHc4UEQrNmhv?=
 =?utf-8?B?NHdDaHVPYzR2MXlnV2NITDBtVW9leDJNVm1ISk9zZS8rWm84L2IwV1B6RXA2?=
 =?utf-8?B?Tk5oQlVuaWRvWUNGRWdPVE00dmRpd1dmdTJUNVJQc3E4bEpIWGdicHU5WHNX?=
 =?utf-8?B?clBkVkdUMGtBMDNhSHZyKzZzK0hTK3RZSjlIYXJHcVRqYnhlZGtqZk45THhu?=
 =?utf-8?B?R2h1bWZiNlNNUlRxMHM5TXEvUEZiTmJpVG13d29meW1leTBQVHVETENkNCtQ?=
 =?utf-8?B?U3BmWTRrSXJCd1pGQWhFY0loSURsR00xdXRreVVxajlBT1M3VDBlczAwUkQz?=
 =?utf-8?B?T2lPeFpwTjJSNDQwTVRGTVRNckEzYmxkL25uR0JldWdhaXU1d2lIdEU1V2FH?=
 =?utf-8?B?QU1ObzA0d3o2NGlJY0ZvcE9YeUF4U1BnbUJSa0liaVJyWGdWWlkvckY4c1dH?=
 =?utf-8?B?dGxwVEFhSW5keW1GU2NGRUlNREhFa2ZQNWp0TnlJaTFuYjRYdnI3aDhZMEtU?=
 =?utf-8?B?TnlqRktKRlYycVFaaTRmOUw0Z1RuWTUwNGdZVkQwbGdBQWtsUFZzNmN3cXpL?=
 =?utf-8?B?a0puUEQ5TjVUdVhsaTIyLzBrMXRWZ2tTVUY5K3d5bjFnTnJyUVBUVjg2ZVVJ?=
 =?utf-8?B?VWtUTnZoRlVMaFd2OUhyTGxsOU8yMzI2dFJyT0lXOVllbVREcVRTRjEwTG1K?=
 =?utf-8?B?OHhFMTRiNUc0UVpKeE5MWFRsalAxMmdzQzU4MTV2VWpEd1VBMThIM1FXRWx0?=
 =?utf-8?B?M2w1UXFNUFRvNkdBNVM5UjF4RFBQMWJMTTNRQ2I3T1paU2JrTzJyeUk0clhj?=
 =?utf-8?B?R3NVU084bHh3T1l2TnZocDV2bUk5YVZkdzR1RFFENG5xT0Z5TExHS1hxaGhu?=
 =?utf-8?B?VnBndG1JeklQMmN1VmpkbVlCa3dnTkxYY0psbFkvcnI2alR4bjN6TndEbVYr?=
 =?utf-8?B?Y00rVjRiTGQrVkxLdUI2SFcwMlNqMm9tai9JNEdPQ29HTTF6M2EzdERYb3pN?=
 =?utf-8?Q?/rBrefM54/tzCpKqfaYdX8H3Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LP1e8nlsz/9ZExjo9pvMrChFOFUFcc9OfAdt+URXPjVAWTh7m4ylj64cDNwTFjvyfp6UF3DmYbkz00dEL9GYjRhedDooJ59/FAOHf/p105mR+N9FLI3u0SZbd3hJyHnw/DAb2fM2cdYwx97CFfjwQfRI7ZR7iAtWw1SXxoaOtuNAiPB5a1KG+gG57ph4c97l4A2h3nZxfduLdW/uxGoopIPhMCD0LUNb57s5m/jL2lH1yUe0SKc6FRyAwb+klNSfGdEDhDDTkD3zdI1H/O/UV6QsPB3mGTzYhnYublKwWMujOY2ZLJfvd1KzmruelbqcUjAtuWMPVFqCp1Y+Xmhs19cFtENwUgIfy1t51eikVB857r/QJREn+hMkmLVhgLcRXb4zu65mhlq9BxGWCpe2c9n6W9xNCPcjImCgp4Whj4VPwpISgPM9B+vV3knUmYBgP8kUVcpNeWLPTlfCuI7idY8KOO/UAdqyBvDzruGmUSUos4s7wYd6VibHTnbkeXz2LP2V10LYlL6U/eqMSBybwfQudzPJyk9PdPKCUGu8hIKl/2crQP31ho7crf5hMHd1Z1JQHU6K81r/5YfsT3zB0ffQSXYEfaCNaBnu47Vi6FVge3rype3IEIUolilPBKJY+EdYgQaAV9VTFUZfPCo8Qmtx0UhJ6vpDoLjyLKQNyzZlUzjpjW6w1G0K2LvhAxj9ADj3YSo3nrziUtjkJ7ep01Reie+Hjx0u7SzVnLA/W0xE3A8DONOlKpBtBuQuzxVa1iHOWdB5m53n9xAqesZu6UOnynygQ6RJCByiOGoed2qgew1xjfDp+H423RseWpoi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af06885c-0aa0-447c-5a59-08db3ff17479
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 09:44:07.9281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebaeWFQIchdves0qNcZ7xofwqhmRp8/ao6ZtGioHKozXpSN2D1Zu95qeLJ+6zW+KW7Aro0FdNIhJzvFiAc8ISw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

On Tue, Apr 18, 2023 at 11:38:48AM +0200, Jan Beulich wrote:
> On 18.04.2023 11:30, Roger Pau Monné wrote:
> > On Tue, Apr 18, 2023 at 11:01:56AM +0200, Jan Beulich wrote:
> >> An earlier change converted TARGET-y to TARGETS, but failed to replace
> >> all references. Convert run's dependency, but use $< in the command to
> >> avoid the leading blank that += inserts.
> >>
> >> Fixes: 6a9f5477637a ("tests/cpu-policy: Rework Makefile")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/tools/tests/cpu-policy/Makefile
> >> +++ b/tools/tests/cpu-policy/Makefile
> >> @@ -16,8 +16,8 @@ endif
> >>  all: $(TARGETS)
> >>  
> >>  .PHONY: run
> >> -run: $(TARGET-y)
> >> -	./$(TARGET-y)
> >> +run: $(TARGETS)
> >> +	./$<
> > 
> > Since it seems like TARGETS can contain multiple outputs, do we want
> > to have a for loop here?
> 
> Imo TARGETS is just the conventional name, even if it expand to only
> a single target. I'd prefer to stick with the simple rule until such
> time that there really are multiple executables here.

Not specially fuzzed either way, and it's certainly an improvement
from the current status:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

