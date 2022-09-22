Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B035E62DB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 14:53:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410116.653106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obLgN-0004sG-J0; Thu, 22 Sep 2022 12:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410116.653106; Thu, 22 Sep 2022 12:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obLgN-0004q6-GR; Thu, 22 Sep 2022 12:51:59 +0000
Received: by outflank-mailman (input) for mailman id 410116;
 Thu, 22 Sep 2022 12:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUSY=ZZ=citrix.com=prvs=25767bc97=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1obLgM-0004q0-8C
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 12:51:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 554cc748-3a75-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 14:51:55 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 08:51:52 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by DS7PR03MB5654.namprd03.prod.outlook.com (2603:10b6:5:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Thu, 22 Sep
 2022 12:51:49 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec%7]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 12:51:49 +0000
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
X-Inumbo-ID: 554cc748-3a75-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663851115;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=wkTGiVYnFDDPSIafd98ivdGUO522mdE50dFq4hr0Gws=;
  b=RqMPe0kWwyX4goQvI6d85qPTGpQVY4vxVFQWoNeXl6M+pl6vwZ/3JDxq
   xf7iuTsOp43iEsC2sRXVJzP10sqIr5mZSATGKsA1ofsSdprWcNErzwBh3
   ef7DxsAZ9pxdCgXs8T/9OgHsfeOopjd4Zp9wy7S0qIuGaZf2EbNVLWpwN
   A=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 81102334
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zUOv6Kve3Tni77HLYBZ1UUhy7ufnVClfMUV32f8akzHdYApBsoF/q
 tZmKTyOM6mKYmP2c9B+ati+908HsZTQzYAxTVRk+yA8HysS+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4mlA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYMe5ct1GTFtz
 L8ndmwqShOIm72PzpvuH4GAhux7RCXqFKU2nyg6iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q/T/PVui4TQ5FUZPLzFPdbLe9rMWcJPmUWwr
 WPa5WXpRBodMbRzzBLVqyv03LSUwUsXXqpKKpKnrM5Eh2bD31IyAzhIfnW7oMSQ3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6k6nMsSzdAbJkssp8wTDlzj
 FuRxYq2XHporaGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi8EDSW517YRY36piG
IronPort-HdrOrdr: A9a23:Y3w9/akNioCTkOCpjKwGpc8J0ajpDfOcimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7Sc+9qeu1z+883WBjB8baYOCAghriEGgC1/qq/9SEIUHDH4FmpM
 NdmsRFaeEYbmIKx/oSgjPIdOrIqePvmM/HuQ609QYPcegeUdAE0+4PMHf4LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpDWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1+cJi+EzSvBkuPJlagkEuTzYJ7iJnIfy/gzdldvfqWrCVu
 O85ivIcf4Dr085NVvF2ScFkzOQqwrGrUWShGNwyEGT3PDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6BgUd7DzJmtXf2eP0AgfeNQo/glieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsaqRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGdZA8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu168HLzou
 WwbLp1jx9NR6u1M7zz4HRiyGGzfEytGTLw18pZ+591/rXhWbuDC1zzdGwT
X-IronPort-AV: E=Sophos;i="5.93,335,1654574400"; 
   d="scan'208";a="81102334"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU+DLPf7TUePc+5cpApbpE6DgWiEVJsdT+6oNAuBCeqK3xbVelRkrNemJK06G1flSCC1o3BnOKQFqlXVRv+Nvm7AQc+Z1eWdvFy6hnNm6hnbxsI2rM2p/qsYgccAlr1dpWMntlOtczesrLDxCGehEQr2Wc3qMi7OdnqM5+t39upUzEiNj9q1YJvJKA++wi1U2cFAZfHMAW2eDlHIHy6BhRdvaKYGz5dirT6jWxhK7zo8iL9F8tRLvEwhUpBsBMKuD2lkrECEvuYkFw1mSMQpMOHyq7A5t4wDRAGpeUqwFOVK8an34Yhk8BbAibKwL+eOppM986x6WNB1dLXU5QC19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGfyu/UkZ7YBCwCZuNIYtIwDxlbwfmJsJou5ZhQvv/M=;
 b=gQ0jWibZbMTdNyhJUfNleyPCyaz0C/7iKtgOmWCTwZKTgGIDQtWVryZgy/QSxEoMO5GJYMkBYZapFjT+jLfAuoailUjY8RjMtrXdZFchB5h1AHESFMSNjzFgqoHog9aIU1RyRShNmdlv+kAK2aWeaQtORUTwJ35nG5mXpk7bsDqNuy/npR05aAYe22jDHEyvMcq3woIPKoiwlFBJ+lahj75yKSFYqUHjcsJIJsA+w+scLjne9sbO2l7UCCYA7YmaBxTYqdb72G2mevy66qHQZYV3A/8KKkGPjTyFYOIsBjCTskLgJSlzouEx9bfOUsyJbP0kQ0DgDBzBGEEyKvcEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGfyu/UkZ7YBCwCZuNIYtIwDxlbwfmJsJou5ZhQvv/M=;
 b=om75dUp6zmRUWLvaDrfVqqru9sS3kL7F5dNukAitMUtqQD/yWFwKoI5ztKXw4Vpalf7VWMxodVHJveRspzqmIgryFUt+ikQblrpWbLBuZh1VdeVtMe26lOMa7MxRv3scDCkhhX4wmRRl6ZsCKP6TG+o8JjPZfD58pVhLP1LnFsA=
From: Edwin Torok <edvin.torok@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Design Session notes: tool chain (and other) dependencies of our
 build and runtime system
Thread-Topic: Design Session notes: tool chain (and other) dependencies of our
 build and runtime system
Thread-Index: AQHYzoIUneM8XWvFi0qNsSgpxIUjbA==
Date: Thu, 22 Sep 2022 12:51:48 +0000
Message-ID: <0229EE64-884E-4F03-8476-7F210FD8A8C3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|DS7PR03MB5654:EE_
x-ms-office365-filtering-correlation-id: 516bbc0f-0983-474e-1901-08da9c9936c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GJNbi/MEySIsTNmHnvYt65qqwYAZjytxkRBN+KwOqseVea4aph3IGZngrA3I1YQKd5AMGGPnpXUI0SIwtWVRA4DdfiLDpw7YSVWUMG9yFjvI54AxSRtEevPSeqy3qBgfZDCaP44h6vB5QHoJ5cr9T0UGWkq69yLvg2rcq00z588+biwiM6KBlc7L5wKRNZcs0btl4mKLIZRxpQSrFvrXzkbHq0mnCmGQi6XIYJiyu6rrPAeCNwe00hAzs4ukDwFeAdz6xwFm01nIYWPiQsT+YyXqUm1pKbaLn0sHAgt6bejYrxcbw5ayHx1NSaOHc047qaPiyWOMnugEVoFDqqLeLfMWvuk4oeBP6/f5Yxv6m6Q1HKuFdvfFhl7RYhFD9D3oU1hZnmEEO/P+7KgZ6N0WTlfp9/iUtBIREyNPztCuikDc4YB6VyoUSPengwptDwmhOxun5Duov7Sw0vXaC6gqfQCvBPIk/sblhE46SJD6fTZVdPTxwePRYjOTSEsj3mhQC9aDvSxs5Z9GsEyrtd0sDyysSCSXW6bXPuGzkMlFYnu0NgeE9S5fCTUdcS0SUCNC//0RHIiNW6yE1VeQA0h+u1915haNuGXik8roLkCB1SIlX1PPXCkjC8HT1BCfk0LkGSNjC+zsXsEAJ4Da1ClQVOq1bRLF5tVciUJWKNBAVdjiz8LGzbC9PK5OELPpS7Z7hTMiGgmq+vrki6L6sWS6JXyjiL6T2wNEXg9Wo9T3VzFnIEKEr6FHZM9EmQSjVIy2YKFDBLUgs8ymBNe3N/RWuicFvLLdNQ00TnK8Klri11GQecrhcnA/gdEkbCmGTStRCfD2vGkqj4VvTuXV+rBl6w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199015)(478600001)(6916009)(316002)(91956017)(6486002)(8676002)(71200400001)(6512007)(122000001)(966005)(5660300002)(6506007)(26005)(36756003)(2906002)(76116006)(66946007)(66556008)(66476007)(66446008)(2616005)(64756008)(38100700002)(41300700001)(8936002)(186003)(83380400001)(33656002)(86362001)(82960400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?67SHXHc/PRi6icmIFcW/BP0eoWjQKX7SCO8AVQ9/5lDsq0i0rSlID4MNlKCT?=
 =?us-ascii?Q?GDxjoxJKS8BIe50XJTZr3LVmmK+Rvcnoy1ipeRPVHJS9xegNtZ79WC+IeP0y?=
 =?us-ascii?Q?zg4gf5x2Z3Uh5XpbW/snKHTy7Ku4S2J5dzzNfVVbE1NGASPraM05JIVAKoMi?=
 =?us-ascii?Q?ggZeMLYChob4nwB19wKwfrOf66GEUFMObHFQF+H0aF4TEo3QvAfFKhqE5MZO?=
 =?us-ascii?Q?H7rXQ0Fy50XC63jRXazgmn80xiIrpdZs100ephSrJeCPh+8LDrDiadzMaKEd?=
 =?us-ascii?Q?lPCMcf4IiDNx7JCJrriInEtIM7aG7RmFESYBbye0tvOwcH6P1EgWs0yKqZ1Q?=
 =?us-ascii?Q?maW9YT0R9qwwit8zf04dk+ssCiuufTlwiqv9gRBvnJe1YZ14CUOBLtaaozpM?=
 =?us-ascii?Q?4Q1IIAdttUzBq1f1ABXCYUfQQkgCItbsypYs3g5Qz9oSURcZqC3j8ZAEsCWG?=
 =?us-ascii?Q?2L3dLWxN3nhhx+PMAnEe97DZtHBYHSt33RPLjYFpaIvYzP72hDl4FY8Pc2jN?=
 =?us-ascii?Q?8rn05/4Zu0wNya8azWzIKdMWcD5cj4n3CkGNUsBDQkEuKvdxtV5/ELdE75Qq?=
 =?us-ascii?Q?xwptUdA8q37AzSuPraMw6B/YLf47t4i4LdLIu6he8N+CPY803V49THmSU+xh?=
 =?us-ascii?Q?kD/L9TS+ycyIv9ysuqdmjlDzeqQObttnPWpMPWTNaSLw5nsy527x1aZImKc/?=
 =?us-ascii?Q?zkWGmm3yP/RZD6iiD79DllUrP4IS2kZL3OfQbqxl8Lc5cqzyS53gSHl5Rpzp?=
 =?us-ascii?Q?EyXOkk1BWecPdcJ8xdncliW75lVV8DfkZnQygIHJ2YmbeMy6gXXB0CO+uE93?=
 =?us-ascii?Q?PNDA9KdT1FQotIg8wJFH/aNN+yYQu9RFuVjXz7fTdv8ilD2WpHYTG2bIHh7P?=
 =?us-ascii?Q?PgbiQIsLd7Y26lPgnLLei++jLAnEzC/ojzhNtkpYMfYIfPejnHrclLcez2lk?=
 =?us-ascii?Q?o9WOCuSkgkzFBo2ADdjQlA3/rcG20ecd8OJUy8RtRH9uPXkd108LVtjq9jCW?=
 =?us-ascii?Q?d/G1mK4q77Cy5vfvlZin9+cHABbV4hhkE3MKw3yWRqWNpJWQq2LhHTIX48Pr?=
 =?us-ascii?Q?9ijE1h2A1EnIWHFiBewEZcMSie5Rzhi2MWGYBu4jnkzqVuiHQ98/vrWVvuY1?=
 =?us-ascii?Q?SOr1w/3pqsJA8IjkrKd6FIQcmvfInuVLsLGljKnSAZaQ42b+XjGLdmEq58KJ?=
 =?us-ascii?Q?EdHVi/4zvLBpxk0/ba/SM3/ujtqUHYBZKzaD7F0DhGNjIT8tTcfMbHgRB9xl?=
 =?us-ascii?Q?5C5FiTzzeFmjtbv4tH6tvoaa9HH6OD/ackbhUrvdRPKzrVn8oX50z7CmqpGJ?=
 =?us-ascii?Q?j5canJoY2iq9mdziAu1SXHKUqcFhHYxDZliC4grB/jHnWGV0FAcFuZtiQtWg?=
 =?us-ascii?Q?+/8Ju069kwfV/7qglHHiCn/HR/6Vrvub/IT474vOJ2xDnE2vDn8ij+BlgHwg?=
 =?us-ascii?Q?ZmOdOYfzHAMOZQY+KK6kJtcIxbMZu9uNC/Ev56vR+PGndFwllyb/FwqBOPwY?=
 =?us-ascii?Q?NbFcj04i3nEHMVCDpvjuVmuSkpoaeppWhh6g967nDTc1VUgu/fqKvFXgd1oO?=
 =?us-ascii?Q?fBewam55ZOXxC5iCiHkjpyRCwbe9bVHdK134o2zYfqfj+vYU5PBoEWWMrqJ8?=
 =?us-ascii?Q?hA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F3E0EB939B2E14D98FABB50DBBAE6E3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516bbc0f-0983-474e-1901-08da9c9936c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 12:51:48.8653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnOVa7sd1W6C3ogA0Z7tOohvWVEW7CFF5GA1CfHrpBUk/EZdXP36yfKmtK0Agw1PO85W/g97rHDQWR1ndGvicQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5654

Hi,

These are the raw notes for this design session from the Xen Summit: https:=
//design-sessions.xenproject.org/uid/discussion/disc_JEWVIhuv2TRAo2AXAZnP/v=
iew

Dependencies haven't been updated in quite some time:
 * Toolchain
 * system libraries, and other runtime deps

E.g. when to drop Python2.
Testing on old hardware might need it. Old hardware is difficult to keep ru=
nning,
e.g. older than N years.
Vendors may not support it anymore, but that is a separate discussion.

What distros for newest versions of Xen, as minimum?

Minor releases keep working.
Next release can make another choice. Not necessarily actively break, but s=
upport might be best-effort.

Support old guests of course, but what about build?

Might limit testing on old hardware, if it is difficult to get new distros =
running on it.

E.g. after announcing new release, announce set of distros for master.
Update list at least once in release cycle.

make change for 4.18.

Accept nominations of distros from community for consideration, and then ta=
ke decision.
Or perhaps use backport (e.g. EPEL).
Distros which have support policy (i.e. they say how long a particular rele=
ase is supported).

Can't test everything on all distros, might be package version based. E.g. =
GCC >=3D version

CI testing vs do we want to fix the breakage or not even if we can't detect=
 in CI

Informal survey on xen-users, resend patch on xen-devel (perhaps survey if =
lots of concerns raised)

Distro packages, even if not available by default.

Might be helpful: repology.org  for checking versions=

