Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4226BE7F3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 12:22:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511026.789744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8A5-0002sy-7K; Fri, 17 Mar 2023 11:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511026.789744; Fri, 17 Mar 2023 11:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd8A5-0002pv-3y; Fri, 17 Mar 2023 11:22:17 +0000
Received: by outflank-mailman (input) for mailman id 511026;
 Fri, 17 Mar 2023 11:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd8A3-0002pp-VU
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 11:22:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f60bb5bd-c4b5-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 12:22:14 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 07:22:10 -0400
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by BY5PR03MB5186.namprd03.prod.outlook.com (2603:10b6:a03:221::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 11:22:09 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Fri, 17 Mar 2023
 11:22:08 +0000
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
X-Inumbo-ID: f60bb5bd-c4b5-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679052134;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=zWtoWGKf1s5GeK5rcZmzJKQx7I/oVgRaIOnaXDTLpVs=;
  b=iZgoh8vC13KsKs5Ymy/fh1beAr0zAA4j9p+34m/bzMfNLCZe1dGiIwxR
   Ov3I0JvmNVDOcDk1QU8uM4fKKNCr5tZ0l5wbvB9iMyXgWxTHxopmbMNkt
   hQLnyz1JVaPmhd89TLqHyp7Tokop7haPcruefBaqwUwaY1/1smPLE9owa
   k=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 103675583
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:025k8qqdiFDOx4X+O2Of5964nmheBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBnSafqMYDT9e4tzadnk9R5Q7JPTnN8wSwpo/yFgRioVpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFziZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA0MaDeNgciI+/GqZO1ihdx/N8rlOapK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKFEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpJSuLlq64x6LGV7lcsJwYKRQSxmL6apWqAUNsBA
 WY7+xN7+MDe82TuFLERRSaQglSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFtJ7Svft3pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Sm4p2aBlG7IWCQjlHemE55DYdb4zR+YMi2TDtnofdfUxSKelfq
 +V7ZMmPHPP6Qr5IUtQ/OxoW5PvfZqjz+8Q3WBLB8bAYOCOggLBRuwP0WKI+V3d8kPFh5ZgPI
 5bAspDIey1IV9mjdvrpCmUeuxQu+VvKZrY49s2GU0dND1XVw==
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="103675583"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2n+JjgEty4B8g5k4YBRFalRWeJKo541aJGEMZ0c5hHvsx06yFcE9U9QhaQs+MLE5AWvoEAloIoBJunH99QVA8w5L8IAB8qvtPe1gZY/7F3/jQDmi3wwOlHSUjzqfoFnkJTAY79jYQHc1e2TLGPR4MtCNUjqJHZi9hj9LliQR/G12odIctguogO/js2uCA8SBbtv0IKqCfcWW3sDU1kh2YhmDxwoZAqfzJv1JU4tgIRg4Lhq2/20/n+AQXBO8S+2T2ySxjI7kivRP+wU5ktM/6rMCGeCTe3YynWXxZ6ghd9Ex3p/+sb9PIWNS4ZpPs63CYPEgHkviPbkFi07faiE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYJ88ZehW1O6dwzd4w0giCq3y8ClsIgYxMoxB1sKX0=;
 b=aoi0o+nT6KPqNWy8KRLnFwMnveD5hgcjtcQQvPp7KJJRO7N8wTD6wBMvZe2kKUuOsVwtKxupYZdftFhgHzo3TUn3llsJofuOpgTSsfjGe3mZTFEClDzXDdo3lxKtatLlifx/wX3yffMtceiZ0gceH86k26p4c1b/r40gnEiMwUyKEoH9pvTEcmQ3BKdjx60oAv8bur/rNXYDe9+YhMoZW6IKc3JlQVVlVdT4oCxH1+6rncRdwz3YHlIC2sCVqjeJFzVVy7BAltj+6YCNF/pOT5bBKbjJhDOgJH9wJQSj45TIicqQA8WjUzdtySLMoBZs9qkp7sQssBxq43vVatzRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYJ88ZehW1O6dwzd4w0giCq3y8ClsIgYxMoxB1sKX0=;
 b=QRokwL1jyRbg6p1lnDBeOta1lmHVCMulP+wWBIL0Z8b3VF3hiQg96tC1CCHf23O29cy6utEp0/CtLlSuHY95MBMEdwmPy67MmKsYX8UD4CnuEwOL/19bNTb4rHkm9NQinNxn9pPEYYyRpEuS5mIKQQt/cnbnwreRlHx+omw6QFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 12:22:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <ZBRNWhExetXH1OaS@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
X-ClientProxiedBy: LO4P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::16) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|BY5PR03MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f60a2f-e2ec-4782-c10f-08db26d9d86e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwDTnScVNofIyMDBglx1qKHFeSrswmFOCFOuAeErvxDz7swIoOjIkKvmp7FFmoVW4H52toy5Wa/TjAAwSR5STospkzAPteYzyVxzKuHl/t9ii+2i/GrYEzQ2O+V/ttZ6PrhdsC3F5m3x2sK9SJUw4XZXpkFDAqILITpHlTdbkl3XreM0cpt6ugDXu8JVPU5lyjIBTZbGwnJnZ9lRiWaBK63KsLkItjIYCU/PF2xLAErG2rmaTkszIN2EEQSK0b5F0p4gR1B/UjORexey6p+fB1b+ENe598jkMFk+hOrbBg7v2Cp63uZManUSFesOPfZ1vojqvfz0wjDeOcuINC1SpEMDRMY5BD+9CBTTxdbVXRAF3DhIw3Fuqj0Q8PzjFxCY5VX9jQR6Fu6B7ZplI/a7xk3vTWODG+uXVdQ+1ozxV2PXKCUKK5AnURv82Jqyf8+c1sU7VnFRq+JYzifCZIVfpOinvD9XbAx70MuAyjXP4hL5gK1lJM0R988Au4tSfqFktYGnk55ZrMqhNDv6wN3xFfrD6Ccr56W7I1IjxJK9oaYjz/fPono4lM/voRr8md5O7cbfAgT2nt2mXRpxp3tgf0b3RZUzbbnHXv2qBygbMsdzbaEmPAURvC2lByzJyzs9cGlYnMrmHioiHRf1tXjPDQ4C6zCwSr8h8BN02N34+UNBusCBcnsaMGWgxeFQJdnGfA6I7YdjJ+UFwByHD77rmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(4744005)(8936002)(66556008)(33716001)(6916009)(8676002)(66946007)(2906002)(66476007)(41300700001)(4326008)(85182001)(38100700002)(5660300002)(82960400001)(186003)(9686003)(6512007)(26005)(6506007)(6666004)(6486002)(86362001)(54906003)(478600001)(316002)(16393002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW95blFBTnR1cm5IUktPK1BaTUdHOW9Dd3hrcEFMbHNZcjAvZXp2bGVNQmo0?=
 =?utf-8?B?aTkwdG5MQ1JKeE03aEw5Z3hKU3o5cEpTbGNNTnNlWnE0Qk5EbDlIQnBkTXBq?=
 =?utf-8?B?T0VoM0lxeTRMYWtNb2k4ZGI4ZVFmSjVFWGgzYnFCK09VdG1yQUhrUk5QcU43?=
 =?utf-8?B?RitUVk1CL2gwQUNURnBCekNjeGtDelBhTUU0cFBhQ2JhUDRsT0hUNDVjelFp?=
 =?utf-8?B?bStoc3ZDa3BLTFFyL3VaVC9SOFZNb3FRV0NseWg4ZEtRazB5bVNISkE5b1RL?=
 =?utf-8?B?dy8vallaNlo1VGxOYWxnZFhteC81OFZaN1JjYnE2SnIraVNsSncwTGdnWlhK?=
 =?utf-8?B?ZHhrNjkwcE00WnJkaEIzT3k0NTI5dFU3TmtCOWlac0VWVzRabUlKOVBSVmpF?=
 =?utf-8?B?LzNHSnBMb1RDZXE1VG1VOXo3Tm9EUW8ySGFQRENNNjBWWGFqeklaaFhDQitD?=
 =?utf-8?B?RTRPSzVjWWdBNGZqOTFyNXpjL0taMUxMdkM1V1owaFFFYWUwT1duUitNNUZr?=
 =?utf-8?B?VGhMUThwNDViTmR0V0lNSHpwUEJLaVBjQ0lNUlJTaDYxN21lMURIKzZqNzBU?=
 =?utf-8?B?RHNna1hlU0ZBdllyeXhBblhxWnFNRmgvVm42dzhBYU1sUW9VN0wza1MrTncx?=
 =?utf-8?B?aUI2SDZnbkgvbDZNaTM3ZVd5TXhqeURZZzQvUXIzS25OTkxKbVVDNE03RW1H?=
 =?utf-8?B?bjVUMkZnMzRkTENIUDcwYUU1Ry9qdUZiZlpnR1g3clNObHUxUWlLV3pza1M0?=
 =?utf-8?B?STNvTVNMWkpkNVp4UTFHdC9EcWQwamd3U29tNzV1VHBFT1RXanZFUWZ2dThk?=
 =?utf-8?B?b0h4SmpzNFArYkJUanMvblMxTGNxMVBabERPdVJWcEZ0U2crY2xPbHFHTE5W?=
 =?utf-8?B?MmFVdnBkbTdkckhqYmhWcWxGUjU3OEtOUUROYzQ5UTlUZ2x6NGRpOUg3dG9N?=
 =?utf-8?B?b1lZeTVtdWR0K3F6VEt4U3VvaVc1TjdZRWlrS0RnK2VWSHk2c1ZFcTlOaU1t?=
 =?utf-8?B?K0V4YzlyNlJHZVM3ME9hZDJzR0RPZVovNUVhVFZoQkR2ZitGWHdpb3F5TUd5?=
 =?utf-8?B?QnNEMGZNK25Vc3lXWi9pc3RIdkpCRVRja2ozNkJRZUFLdWtXZXR0NTlIeGZG?=
 =?utf-8?B?MU1qR3pScWRZRjdJRUxPSEJmNFQrMllha1E4MnVyTkJLZitJUWZYd3poTkZ2?=
 =?utf-8?B?NlJ1bDJWbVZKamtuSlJCRGl5eENFNjhKNGdhaDhPbnl4elYzZklhRDhZK2dW?=
 =?utf-8?B?MHNlMjFpdTlpTTVuZksva2cyU2NsVTdRaEUwelhGR2dxZEJkdHp2ektYV2tZ?=
 =?utf-8?B?TTBZSkI5ZHVWY3IwRG5FRTExK1kzTW5KN0NBNEJPaXdWS0J6dEZuenFXK2tB?=
 =?utf-8?B?TVcyNHRERnpUMTQ3cnhCTFhCbTlleUJkRXhWNE55T1FDZ0NuVTZ2WG9mVmpm?=
 =?utf-8?B?MnhjeFJXS2RjU0xLVzNTa25ncUp5NXd5ajZPa3JXQmp6Wi9sOFdzSnBIYUhi?=
 =?utf-8?B?WEZVM2QrVlozb1RMeFlyVVFDT1ZwZnUycXdwN1Baa0xFODF6Sm90NTlmR0ho?=
 =?utf-8?B?M3E5MitydU1DUGFCRFB1amxib2hwOTZXSDByV0ZsczJKQkFWR052V05KU2Z2?=
 =?utf-8?B?ejI3akhjMHk2bHd5ZEt6UmdWVlQxWHgwWXBaOGxLWXQwZWt5bzlFNUx1SU9J?=
 =?utf-8?B?WDNHbFVtTkVZbnh3ZWc0aEtGZVl3UDJ3RkxHY1pKNE9FZnVWMUlVZTdaQUdh?=
 =?utf-8?B?Q2NIRWIvUENVZW1KRGpoTytqSTYzL1ZLVGI3Y3pKTUlranRCTHhmdDdaTGly?=
 =?utf-8?B?Y21hQVJ4S21SU3NZWFZYaHBEM3YvSkNuYWRQU3ZqN0NQZUE1OEdQU2VnUTM2?=
 =?utf-8?B?SFk5cm95Rzk1cHBhK0d5MXcwQnJFaHo5VGUrN21QRlBPTzd0c0NRdFlnckdT?=
 =?utf-8?B?ZEdkVG9ucDRjTytvTE95bkNVcWNPMFBEMG1KRld0aitGU3IvVVdFMjdwTUlW?=
 =?utf-8?B?S0pFYlhKZ2xrVUlJdG9nRkxMdXJxWUl6Yyt3bnR0eXpnL1RBaDFORFNzTDNF?=
 =?utf-8?B?dWUrTzJoOXBub2hMSjJJZ0ErUDlLa0RJZlBNVk1HU2FXc2VuNDAwQUpzNDJH?=
 =?utf-8?B?QlpDcjdLU0IyN0hMU1NrSHlocHNseTl6bkVCUnJua0laSUVac2hwc1VQSDla?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CYIdwQeYFgNwT+9zI9MSXQy5xwFK5lNkmHb0KmqWPb63Hb5UoiRJM/4SaGZp1QKqNfNpnpnkLgu+rsxudtCfaWYqOyibHuhtmv30LSj5mUqRQv8afYE2iySQkotDJ/g2YwkX8mqn6oUpEGHcrZgbv4T01MyU2yIuakmCbuajrQ3wV6+eZrkT7qp6Ni9vqUP1CtkastvQqQ1Jrf9o1JlQHkq44JLMcv0ucAsbw/YAo06QJVUhHH5midBHUaOoJP9N7UBX7GAuHiUi+zn9yCxtNR9RWKh3/1/0sgkF90rG99ufsHTnBkZ0hX+hGEMdRMvt88c/GhGq29Rq/ZVhPsnJZvOt4qlkhdt1jD74VhgF0EqAikGc89A+2Zjc1T6GrYqW4pmzDbmwUbyfl322/2+aCd1CohT98n/R1e+hzTwtEzdPD/DAuuqgSNmIybtnmSs5hhy93pqGBRnpnA3KB+ZW7gFOKtIiXT9DESfq8+XYH2crqFh5BxwDHBQL9xzkkdJZ5y4OhzOdFKSTnOairt0lMB/A7nkbR9TjwVYpHmkdrf5BMV7y0O+DW07VULt6/svakWWIFWKwLD1ElVC+VYwgys8hN1uTOFPgTFvtJvv9IkJ5kuCOCA9ZGkRT86ZuxS/3L58ZGHleXtG3/FWHZXRdcudwIMDgoRR8PEpve48feIDgjaZrpbTKyrCnqnQtiSTfIrH49T9S+unLgp7OV9Cz0p5KfSu88xvVFehLkvaZCqiX5vksjdwuriTuulCuJqG3ChVyk55kzoC+Z3v2UHuYhgHveJdKYyezcda1Jnqkcon43KPtq9eySDPJIWshYf5L5HYbarrBE5Q3LZBePdqdyA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f60a2f-e2ec-4782-c10f-08db26d9d86e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 11:22:08.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFBSE54+p0lRsD9j+7TdLTwBFSqmNewvg4DpwD6oM4bCtagNLICEv5tQRtiG7jXH463HF6+se0+UqcAsY/OP+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5186

On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> This is faster than using the software implementation, and the insn is
> available on all half-way recent hardware. Therefore convert
> generic_hweight<N>() to out-of-line functions (without affecting Arm)
> and use alternatives patching to replace the function calls.
> 
> Note that the approach doesn#t work for clang, due to it not recognizing
> -ffixed-*.

I've been giving this a look, and I wonder if it would be fine to
simply push and pop the scratch registers in the 'call' path of the
alternative, as that won't require any specific compiler option.

Thanks, Roger.

