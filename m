Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BD696281
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 12:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495153.765430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtXZ-0004lO-K5; Tue, 14 Feb 2023 11:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495153.765430; Tue, 14 Feb 2023 11:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRtXZ-0004jG-HJ; Tue, 14 Feb 2023 11:32:05 +0000
Received: by outflank-mailman (input) for mailman id 495153;
 Tue, 14 Feb 2023 11:32:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjes=6K=citrix.com=prvs=402b5c463=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1pRtXY-0004jA-Gz
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 11:32:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32424567-ac5b-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 12:32:03 +0100 (CET)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 06:31:52 -0500
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by DS7PR03MB5527.namprd03.prod.outlook.com (2603:10b6:5:2cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:31:50 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::acc3:67c:60ef:bf99%7]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 11:31:50 +0000
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
X-Inumbo-ID: 32424567-ac5b-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676374322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fEX09fzVnZGqu5Ho97SVYzx65sIOveKJBv+xWIb5Trg=;
  b=Tp6tWOkEXTErEymuClzYSZd92fT6m3yn9RW/90g6dNjmHasK30hx1nCo
   XJaxXi2FKd+9D+Mv/bWDCbUhCxXcpL9ya5/SuGcuVMdM5VWrVVhJD2RBj
   xfJzHzKNO8xJTYxiEiaPHEfCC1GiMQPCVLwQo1/hTI4JIzpChRMEQ+nBa
   Y=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 96352702
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FHM6TatJBYLUliIfeS0qLXzNzufnVItfMUV32f8akzHdYApBsoF/q
 tZmKWuHaP+Camakedolb96y9U5X68fWmNE1SVNp+3g3H3gU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWHyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwA2wuPg+/veaKy6OadsttjM8IEpeoI9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIK9lt+iHK25mm6Co
 XnduWDwDRwAK9WbzRKO8262h/+JliT+MG4XPOzmraMw3wXJroAVIAwvFgK3iMmWsVyFAe4AM
 GIIxwUH9pFnoSRHSfG4BXVUukWsuwUAQdNLDusS4QSE2K3SpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuoMDAVK24EagcNSAIX5N+lq4Y25jrDSdtpHaqdh9j8Czb2h
 TyHxAA7n7ITiccA1I2y+FnVhDTqqpWhc+IuzgDeX2bg5AUmYoegPtSs8QKCta4GK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:+0nZa6sgaaD2cBxiPR4DBNSj7skDzdV00zEX/kB9WHVpmwKj9v
 xG+85rsyMc6QxhP03I/OrrBEDuex7hHPJOjbX5eI3SPzUPVgOTXf1fBMjZskDd8xSXzJ8j6U
 4YSdkBNDSTNzhHZLfBkW2F+o0bsaC6GcmT7I+0854ud3AJV0gH1WhE422gYyhLrWd9a6bRPa
 Dsl/Zvln6PeWk3cs/+PXUMRe7Fzue77q7OUFopBwMH9ALLtj+j6Kf7Hx+Ety1uKA9n8PMN8X
 Xljwe83amos+i6xhjAk0ff4o9bgsGJ8KoyOOW8zuYUNxTxgUKTaINtV6bqhkFMnN2S
X-IronPort-AV: E=Sophos;i="5.97,296,1669093200"; 
   d="scan'208";a="96352702"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOZYiR52uNQwiq2tEirwu9gy01ue7Q88XcG9qPKE2vYmlb1JDXuIMg8gjoKLD/v+JlE7dRTYLDQTUI2tUBapwSRJVyFSJZ2OwaGTwZv43F7iRp9UKuOPuQRjLgcaIeru0lI0Wa75vL+HWzFCK3UKDsxesjeGCA0vMDJTcdmcQsA3m26sCayX89Ol7m856PDqaqWsnrJHLA0hlv0M7JV1K+iad6LTMqxrs65YDTdJJDWpVeDvsmxSIzTLQK0rGzkpRJHaFrkCAXEqZ/FQnedWsUUhIqpoadZb2zH8MxFEqMRYvJ+VIN0jkXtwo2Y6rXr5x5PidsbSgW7yfejZTK8aGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEX09fzVnZGqu5Ho97SVYzx65sIOveKJBv+xWIb5Trg=;
 b=D0WdWPCSZoIvRJXqvFwhexgqEu7LjCjQEhvV0Gbv06eBSyXj3Hov0vWqt0o750dn47hyJ4/r0zDEUjvgL+IoOqLE2nrntwB7vFYs5go7W283ba+1CW8vLmpKUXdXUhvTToxOlEaA1WsIV9iOfMdPHbALI6kOx9FVliQvenjn63GfdeLF11itZS8MDlpD1gzwMFTr6VqATY+EjiHRzoVvMdWE05BATmexdRnvII36gdlKalDhfmkEevbM3AVzvgTHDeu+fWx4q2yMLuCJdK1j26OKUEO3wAkzq3p1y0GG1qjt4wiV3wEsHZG7paY/ZSHkPITahqEpodhYf2FDW0pYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEX09fzVnZGqu5Ho97SVYzx65sIOveKJBv+xWIb5Trg=;
 b=TYjh2HnipNzoWMJTcLHUGLy5vTT3Qqg5Fn3WGpaK3z4Hk82yaksL6kCiu5L4xLqQVVvIEg4Mu0UTH5DaI/WCOYfi+VZk7qgSMViWXbEvZ+7AylMWabfOFSo5eimM2dmyQSICLgJAmJFtjjEaoz5L7eDhQuRzd1CbNFUs+o0vbtQ=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Mihails Strasuns <mstrasun@amazon.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Raphael Ning <raphning@amazon.com>, Bjoern Doebel <doebel@amazon.de>,
	Martin Pohlack <mpohlack@amazon.de>
Subject: Re: [PATCH v1 3/4] livepatch-gcc: Ignore buildid.o
Thread-Topic: [PATCH v1 3/4] livepatch-gcc: Ignore buildid.o
Thread-Index: AQHZK+7vqwIB+XQ8EUuEjmznQnPAUa7Od5Ne
Date: Tue, 14 Feb 2023 11:31:50 +0000
Message-ID:
 <DM6PR03MB537271EF0C2213A8BB602175F0A29@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <cover.1673623880.git.mstrasun@amazon.com>
 <477a6e0f0b0088c54f3f048bf2b4593eb4df18af.1673623880.git.mstrasun@amazon.com>
In-Reply-To:
 <477a6e0f0b0088c54f3f048bf2b4593eb4df18af.1673623880.git.mstrasun@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|DS7PR03MB5527:EE_
x-ms-office365-filtering-correlation-id: 4796c436-70ee-4f8f-9021-08db0e7f10ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2LxasdsIP8mOst3hFDMZJQ0SaZAgA0DJ9PsTGKNuVRUfY99VoqzeHgg5bhUBdkv2ecueUfxtByzNKfDJasSKpao6m9Ek3WTSqPh3/Y6do3w9OonHfd/3WScWaGSr/SjDs+dWJyuPagnT/j9u36g0saVaBJfCYSbM7bgcz92PE2J7zgGq/NFg4JHRNeSwdWp6vnObXiPgzYUXDn/V5DmxCWS476tEc6Yysh88fU44N0QvT3+lL0R8C0gLufbqfcM1EU3KgdltOyaHDvPY3VqRQCSwnEwrrkSOAJ4yxRXNL9gVfgW5ICl600cW64haznlbV4UCeFJwJWuM+u5tx6HZOdwaCN05oeVH5GCuHkmLQbHfATL4jaIAUsypbMxbSbu/2jokCgi1uOeyamTt5sffPkHn2IuKDVUuHnwUgfkhboJ4hBysdvsoe6vGeT7lVlNHISXyCLxWskik84NFIJfCyGE6P9FQvVa1M4zZBAsOptC0+11tyfcjaO4LYp0xRVAvcRm20HZqgXeXePw+EgcIA5M6VhUBPhfA5azQo72wPGBEdjuYTt+L3EKZA/+KBdLZtZ1vrJyhlE+16Q+cdUt1MrLWWkh2nTE5MoE/A+pEabqpvMIyuHd0cmY8vGtviDawATsh+53+teKJQLkcDIsds6HsY/T1daSACEu6wp8ipt+9XSuoNkbYipqINDZsVVlj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(82960400001)(91956017)(66946007)(38100700002)(76116006)(66476007)(33656002)(5660300002)(478600001)(41300700001)(38070700005)(7696005)(55016003)(71200400001)(8936002)(4326008)(8676002)(66556008)(64756008)(52536014)(2906002)(110136005)(54906003)(66446008)(316002)(26005)(9686003)(86362001)(186003)(53546011)(122000001)(6506007)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3PKdQ5eHoRuj4QaPbYuxi8vb3xDpMR2ZVjXehk64ZaWBnRt6pbMW/E46a3?=
 =?iso-8859-1?Q?WHF+uVlXrEDcNbV6hsyiHIu8oud+/86Dnq798MKqQ1nnxtlefj0KP0m9BY?=
 =?iso-8859-1?Q?WJR15gdE6QpKNTcDf99Rv9du3M5wN667KF+OQsB016jBj5/mYIt4tSEc0+?=
 =?iso-8859-1?Q?d4lmtaTz0/jHQqXT0E6mUJGax/C0glL2JwY856O2/bSFIHcZvAoaR6dE35?=
 =?iso-8859-1?Q?X2T5fufDk97u85rmhBIZXF9iAKE49klBg7LAzVgqlCrJQ/zzYjiKvDN3WV?=
 =?iso-8859-1?Q?sH1lgYbZxyb/jvTCqaAAk11jKi+bqBH1KWu8ljKAOkRGFnRXn2u78JL7Oo?=
 =?iso-8859-1?Q?lkj5U2PpjQz3LbfK5UHmV7efmUnDouARPPEoOYfX4HQbguJoCa0HxqN4C0?=
 =?iso-8859-1?Q?7QKxBZSHoT+3oOjPM9g/qe1zK+nuLuG1CPvHqR3zBQdFkXbvvqGRlfMqTB?=
 =?iso-8859-1?Q?BxLieSY6+T1keCmU0Fc4ThVf6vdLmAX7ZUFriAtj+9eR+ku6K4jJoIZHNB?=
 =?iso-8859-1?Q?jtPoFNvGEKrQVIU4iMa4JD1gHMzOONdNdZ40CjNYWPBQc+oV4xZSmyqVfS?=
 =?iso-8859-1?Q?AJDVIpT1JVfXwF7QBjq+ltC+87OsSBCCCxRMCY7wjz5oxSZrkZiPWXVRwl?=
 =?iso-8859-1?Q?4A2HClG8FSAbQpj1IJOSQQlYHIh60spKkpNjdSWhvKgzl+ZPm7ZKRNiHiZ?=
 =?iso-8859-1?Q?obENT/GfQmpgdB3tDtnMW33L0jDjpOx48LYJH4gwkXyHrAC8WlJkVJA/Nl?=
 =?iso-8859-1?Q?9AjSHhdMVnA13R6asdwoRwH8PgRneN1vWu0tdy6ux0UoqJuThkLYfupL/H?=
 =?iso-8859-1?Q?1CfEYpSANv3b2vJxsMLflpHdSuYn+uBDDBxMUgIgZvFgdCL8AAwfIbPxSo?=
 =?iso-8859-1?Q?4Yz1apc4W1fozl6wMIJrlk6mrevCNpGmBCu8qOjMHnUzi2IXFgMwFl039C?=
 =?iso-8859-1?Q?4bzZCzqoMP3HCyKFmRhpnp1FBCDgjyfpEKAJ8qfXx/7bIpygxQjo03GVEW?=
 =?iso-8859-1?Q?nR5BcfH7zON2iA4ALqvIVfU2GlxBDnNfmNZ+dXDcSoKRHnwXNp1/xHJ0IS?=
 =?iso-8859-1?Q?indTQ+dLKlXib+3B3zXGFFP4WNccMWmqkZr1q9Hg5rkPGGq4WeD5ZP4xtK?=
 =?iso-8859-1?Q?eRCgoY7Z5wE3CnBHH6V3+YtOpg8+PZQYIDru0xMOLG9o7rhtJVEwo+IrN5?=
 =?iso-8859-1?Q?5yqIGDS1mTVTV+/VgMlvJMmVxRHeGnVqY8EeEKophNysw1SQPLUo2p2wau?=
 =?iso-8859-1?Q?r+wMISifl1hypnSExtZWayEOqztEzXGMw7PwSoPuce6vaPO+S2ETYzadK4?=
 =?iso-8859-1?Q?40oKFrKbru+mhQAKc31IA7BL0OFHO7UJBTEfHmonOy5i3WRk8rhBieo4Em?=
 =?iso-8859-1?Q?IFPXxMMlgjXrqwgR/4d4N7L5RCeZUzgs2O6TMHT8JPIcMquNkeaIuDYh3B?=
 =?iso-8859-1?Q?crJRGpBveTxTNWUYEeV50DN+NMoz5wKL3YwCOa+madGJf3jdYAwHLVehGb?=
 =?iso-8859-1?Q?R9mf3c2QEVwO0IxsQj1YiD1wVNRHK9mZUfTBWLg0rny3D8eJWUtNfCtAqL?=
 =?iso-8859-1?Q?o6oA0eWIgQ6P5HwBv9PwlAfVGkIE0WblGgvn7r279Rxr7owCNBvT+h7YC0?=
 =?iso-8859-1?Q?hC7aEVdfGnuyEhMCZsTVfTKYYXkhXPu9ay?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3W3WFI7RXTYtaYYXUShgKH9M2rk8kJYgNS0ND+k1LXjRe1dds/4V/c9IA2xFxS7F1f0zJTjgw3mr0qv/d78wlwkHprOGOoGBjt8WhWIES1nezny1DwvAcwCQ/xgNvDde0zusEnufm0hy1Ehl6cSfRIEVDkr15InHArN7QUc/VonOlP9JJ/E8h8FpcY2gG1av+V5ygwkyd1yLP9Qi8M6TsITzDLvu32tfekLZ28mshY5HGbw2TrqnhJufL1NkypzeKIoSQxxJkg3zE6rqz4Dq8UjgrVDQfSxthB8adDBKYNDUao/zFPr4uJ/ADcp/x6MjfI68akjZQ5JFXbydesNOZTv4sGTe4vDkP/H0FB9aU3R9xG5hvATMiRoNOnOPsj825KQxVjC3Qo7H0FxmAVWIXFq2l0G4zQcTOqufrmCfYPFPhseFkIff0TVp3FOlpKXHJKUrnVXRb7F33xtuuNSrr9aFYWahHp9705uiSu7MsViaxo3uPeaDw1M2WIUqhQYUUTAmF6elL6vOgejH2j+RB0kXKWbFcS8eQLVCEZ8u9Xr1tffDNJqcB6oi01U4t7XemL3rHGQkZXwHwKvDIww29h4vZBuG4UY1L9c73JzUMFZ3aR6GvJC5zGlHY2BDefideYoL0An9ltuKsTfSGg/MWdiIMkIZDlnlc2v89JYz1NMjPxiIWSPKzA9rkSfNk3C0p4AK5no40/mh6IqWbCEg0xV97NRlQq7V6HpUIf4N9F9W2z+kMXftiD6o5jSFsYC2VG47khiDI8Ij8kI+deNglhoP7bFg2rnbXKYtO4qDTd8UGXwXVmorIgCpn0VO+8JVBiH3DA6BYv00sJZLqDGgdg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4796c436-70ee-4f8f-9021-08db0e7f10ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 11:31:50.6124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXamz07UJvtQP3kVTKHxsOEQVzxU6ZpnkI1mOPvyxnj1beIrBbI5JJ5BHCNorykwrtKwvCvJskw5BNEKNPEvzjjPG140hIti859JS/Ee5Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5527

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Mih=
ails Strasuns <mstrasun@amazon.com>=0A=
> Sent: Thursday, January 19, 2023 10:13 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: mstrasun@amazon.com <mstrasun@amazon.com>; Raphael Ning <raphning@ama=
zon.com>; Bjoern Doebel <doebel@amazon.de>; Martin Pohlack <mpohlack@amazon=
.de>=0A=
> Subject: [PATCH v1 3/4] livepatch-gcc: Ignore buildid.o =0A=
> =A0=0A=
> From: Raphael Ning <raphning@amazon.com>=0A=
> =0A=
> Not all .o files generated by the Xen build need to be passed to=0A=
> create-diff-object for analysis. The latest example is:=0A=
> =0A=
> =A0Run create-diff-object on xen/arch/x86/efi/buildid.o=0A=
> =A0Open base=0A=
> =A0/usr/libexec/livepatch-build-tools/create-diff-object: ERROR: buildid.=
o: kpatch_create_section_list: 77: elf_getshdrnum=0A=
> =0A=
> This file is special, as it does not contain any sections. It is=0A=
> generated by objcopy from a magic string of bytes (see Xen commit=0A=
> eee5909e9d1e x86/EFI: use less crude a way of generating the build ID),=
=0A=
> which probably will never change. Therefore, livepatch-gcc should not=0A=
> copy it to the output directory.=0A=
> =0A=
> Signed-off-by: Raphael Ning <raphning@amazon.com>=0A=
> Reviewed-by: Bjoern Doebel <doebel@amazon.de>=0A=
> Reviewed-by: Martin Pohlack <mpohlack@amazon.de>=0A=
> =0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

