Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CE4F83E4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300928.513459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUJ6-0005H2-JD; Thu, 07 Apr 2022 15:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300928.513459; Thu, 07 Apr 2022 15:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncUJ6-0005E8-Fy; Thu, 07 Apr 2022 15:44:24 +0000
Received: by outflank-mailman (input) for mailman id 300928;
 Thu, 07 Apr 2022 15:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E9KF=UR=citrix.com=prvs=0897b442a=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ncUJ5-0005E2-2E
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:44:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 967ec1b2-b689-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 17:44:21 +0200 (CEST)
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
X-Inumbo-ID: 967ec1b2-b689-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649346261;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6uyf1+YGGVGpV5zOfNWYZNyYmjT26kg3SBpomHFwZ7Q=;
  b=E+i4DP25dCEgBwoHLZ2JnluEgv4RNhcGioFNQIQC/2BTU7xKslcfh5WC
   obMLn0s58mP74Mb/HCQAXRj5UfU8qNc3y69Ob6ZSkc8WxDUCMYk799BUr
   +702ix9+VNkPBQKNDxubG4c76BZg64ddHj5VDCG90ExEswnDWEswRE5jV
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70682955
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eP1Me682pNkDedtlFCbSDrUDRX6TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2seD2mBM6yIYmGkLY9/aou//BkHuZfRzd4wHlBu+Ss8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnYbsbyUCfYr9pOU+fxh4Oh1vAJBW0rCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYoWomyTjWAOw5SJTHa67L+cVZzHE7gcUm8fP2O
 JJHOWA+MUmojxtnF0wQN4Azm8uS1lr2KSVlrmjPnLUuyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkWM9GVxD6t+3ellOjJ2y/2MKoRE7ui//Isn1yXxUQUEhQdUVb9qv684ma8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+O8RWQEmsyHFMDRgMFbSI58uTesKs820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsFJG9eFoSfLkWVsDNdWfhoB3iEsI2KBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtJVXXoXw+OhHJhggBdXTAd4llZ
 P93lu72Ux4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnhAhQIlwel3SSvxMfjQikLVY4DlK1X9BoTFSctIUypyz4kZ4Ou570YbJw5Yf8s8+kL8BK+Z
 6BtlxmoahiXdgn6xg==
IronPort-HdrOrdr: A9a23:btlffK5fGIxiudkNIQPXwCbXdLJyesId70hD6qm+c20uTiX4rb
 HSoB1/73XJYVkqKRcdcLy7Sc69qDbnhPpICOoqTNWftWvdyRKVxehZhOOIrlHd8m/Fh4tgPM
 xbAtBD4bPLfCNHZAXBjjVQ0exO/DBKysCVrNab6WxsQ0VLUshbnnlEIzfeK1ZxQgZeA5o/Cd
 6z2uprzgDQBUg/X4CDHX8CUPHEp9rX0LTcQTBDKSIGxWC1/EyVAJiTKWno4v7WaVI/oosfzQ
 ==
X-IronPort-AV: E=Sophos;i="5.90,242,1643691600"; 
   d="scan'208";a="70682955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw9FNh8iApjWXIGYXYv11VCegtFpLsh4KsyW6MTQVhMUs9GQcRA4NKkJ/h0dT+IrtoceWyB1fnV2WPX/38P3jxV93nBUI3E2vF/1ssshuwxDEx+3iNVgshd9yYp/iRFtRtyaetPP0EfkBE5ly1wwy/+rnAeWlqZRnj+AA/gY3TWhmVk/4RId6AxDbozAFZR2c88DqwvJvEpoS9E9ZuAgjQP1QAlAd2flHPM/iTBGk22l9C2y8Wg2JYLHILPBZ/Rk4LYDjOHWvcmhxhTpriCNEI6dhQFgm1FQm7oEzPmFvWfJ2V1d2OWoypVWuUTd0RJ9sX/DT8Wjml57wYch60rVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJSCYQC13VBjLksu7bWsgiNW2ZBpgAQuRX+6zZqKSvo=;
 b=EP/t3eemlMUKvcJ4HszO5ysVWpXiV0dT5zcOIHcrpRDkESyjly8cWGyhrJyyUnjky77mX+NsKoGCk9P/oXZe4MylqXqqz/4MufffPjgR7HMcHfAYHFiuRCxBdjKOtF4wI/qpAGU4LMmVlBznid5wmgc2werjnIdGc1zRWKubBKDLiQnV7KnGiZIuT2BM/jGb+PDmtIcn39VLDqNZa9WaRwcWSoutju0NtjBh+huv935NkbS7oCCWXre1qeOtLO9KubgY2v01BdBnoiubud415jy/RWUtXIeqSHVVR5mOK+bfhRoQuWUF0UnEB/WTibLH7xxefUrTyuG5NIuwpNDtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJSCYQC13VBjLksu7bWsgiNW2ZBpgAQuRX+6zZqKSvo=;
 b=IcMOXVuFRoM3rj3crzRRZNLNHGr/RPo6GckiOSSBdKqO7N6UmVHb2GjiG6kY1XeY7KVmBvPiVek2G+PPPBh1wDYG+PoEODj7eAWvBUqu0qCoIbv93BrcdKExVMceHzXYEFrh0K2mxKtuUPOkXIwLoCNuuN97VqfBVZIhnLx9wTY=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Konrad
 Wilk" <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"Wei Liu" <wl@xen.org>, Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Thread-Topic: [PATCH v3] livepatch: account for patch offset when applying NOP
 patch
Thread-Index: AQHYRMuYkv/j9QPlc0OOPsJ/our1NqzZJyyAgAAFroCAC27ZFg==
Date: Thu, 7 Apr 2022 15:44:16 +0000
Message-ID: <PH0PR03MB638290EA5503FE0FED792C44F0E69@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <8db632ef-9d9c-d17a-54fd-49912d88d599@suse.com>
 <YkVko/vqhfAfS5Jb@Air-de-Roger>
 <ef884c3c-26b4-1bde-9344-aa9be30c1cbc@suse.com>
In-Reply-To: <ef884c3c-26b4-1bde-9344-aa9be30c1cbc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5ff6291-9a26-4620-ecf8-08da18ad78d8
x-ms-traffictypediagnostic: SN6PR03MB4096:EE_
x-microsoft-antispam-prvs: <SN6PR03MB4096D2C7283FBEBE9DFFD401F0E69@SN6PR03MB4096.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cMCWUcPsqL8EDelbFBzatzzVS9/M2NwkDI/rpLI+bbff27M1uL61WqPmztvHFtBATuH7YtryGasBDW0GAypK95bQiv1JH1qEMYPr8YRoimX6llDfPPf8251n1dqjBi8J4izMX9sQFUcwNAMpUaW7xJ2UofrNm0txSaWHbi1mu7+i6kAm36vG9uV2rHZh0nDSMe1WjAjSx3cbcOpHGsPKEbf14V1lEcpXYzx+2gyykdKqAJ8xb/DdErHV6MES7Ja4e20QH/YGRRpSmqwjj/9RX3V1Mf6MFElEcRdKTXUslX6t07JaTgwXxRk9LnJVo7Vzfwh3ymMjPrjpIZkom7dEFDr7a28WFQDDqqQqoETVnLmtDPehA6LIBADPf+a8pUmglHyuEugfqrxX4jWWyhvfTcRQ/dAv0nTOMOHRvvIgZhUYIfupBgb0X8P1y9qPEpPoZbmFN6Qh+aDtZWEQstDy3jYEWK+xuP6vv1U5bmBftBUFhymREpboeoouhBf/7x3vaK9XjVAA57MTBe1Y2ZJBce4mZiYOjLUDOy4AZXxLat20Gqt14zgm4DYX4bksZHLtAPoS0wS+1oUYbUDSebRkqZnCHbaAbGm7MbrP2sGeuDEmRkhz/GpsskIJsT8kop0oGXxlO9W51OnhgwDT7lstFVZb3mdlyg8oNKU0QwuuHfv8GnuskJ+YmcWI2BQK2wcSh4EEmEASZsrgrGaRyVqqMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(508600001)(5660300002)(66556008)(44832011)(91956017)(66946007)(26005)(186003)(64756008)(66446008)(66476007)(38100700002)(4326008)(122000001)(76116006)(8676002)(71200400001)(82960400001)(110136005)(15650500001)(8936002)(7696005)(2906002)(54906003)(55016003)(9686003)(6506007)(53546011)(52536014)(83380400001)(86362001)(6636002)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Z16kSkf0nuPVOKH86Gb3qzRLQMv3eE6aBqj2CnYbrHFvSpPAs17Tt/wYkw?=
 =?iso-8859-1?Q?wbEepQEEO337BY0eIkYSDEe9O4B6Qh4m1lQ/Ts5sZHh2s9q5vhQCE7jYMs?=
 =?iso-8859-1?Q?S1Eq8zKmFCvmRJQLNLAmk/nJzAepZrZCswQUtEA8IiCQvcwz6e4i/VqECd?=
 =?iso-8859-1?Q?UoCRhqD46zfFrJqEpkZ3GPBaMvsLmSRBvuxF244Nm0z/C3IQoglQWizaJj?=
 =?iso-8859-1?Q?lWsjBw/LasZ4CaHjRtgaiE8Bngd27o9U7Ag/HGMlCNWyGPyUa1V/jFHO2R?=
 =?iso-8859-1?Q?bpyrmLCYthZug4DJ1Fn7D2AGpY5bkSR3zqgOhbXO7AQGzHs5oqg4XzLNhe?=
 =?iso-8859-1?Q?UkRgWxKqRHPwouzj0zW4SGO2+E2mOXkjkWj7BPt+gKVPQmQw7ZyQqCHiVm?=
 =?iso-8859-1?Q?Yx67VpeGbxqaMNqNwv6UpOBvpDgG9+X+q7kpYJH6+kaJ2T4QsQS3oqQCw/?=
 =?iso-8859-1?Q?1twNZzMjgNBUlsT9JfvbRgrzubmXi+1pFdY955gwnF7RjgU7zHvQE1XtO8?=
 =?iso-8859-1?Q?Tb2kadyPxSEM1S5j1SspSw5dE5a21B26NgPcEMsukcGLsO+PwwFIpP37QT?=
 =?iso-8859-1?Q?0WzwGp0c/nuRrjYuzqlW0ko4D5QNZgMC35a1OgcLNEcCzQGlOiBmh48uGr?=
 =?iso-8859-1?Q?8GWZQR5hWcQLy07jhpwajm3Q6oKCUCHNmHmlmSTPrBVO/XgeYUhYJbrV/6?=
 =?iso-8859-1?Q?2NFBGtPEXR43xfZF3hBzgN0K5VJk1hjDZZHZ8E0hoK/DMFO+7KcqrIxBxV?=
 =?iso-8859-1?Q?89C4GFVZs9Y0B+AZNOWESiib4Y2Y5/sDDw5oMLvrsdVCBBIe9toU1VKG3d?=
 =?iso-8859-1?Q?Q5+CBx2nZrm2Kgp28iQT5xFymfWX+nvWCKMpAWJIIdsRZq0VOKWs5TaD9R?=
 =?iso-8859-1?Q?MyRSOnLUzyOA+zHCEtRJc0mBr45G73+RZ6BvkaKoN5xuSr2zSGPwi+MnKA?=
 =?iso-8859-1?Q?3ZU2BVXH1Q+c1Z4OIJD8RMzGzSzopRsVhKqlcrRd0Xb8LlpYpv1hlYCC8u?=
 =?iso-8859-1?Q?C+YYicTLQL0wANcNzof3H32BhUonxw0mHK9uG17F7GjvE7QmTDnRTNviuN?=
 =?iso-8859-1?Q?lSyzpAHyw7duSAxMSJaqup+G0t/mwD5koJWO3u7UNJiQHJ5z59ZyHEb7MS?=
 =?iso-8859-1?Q?pu66T3rG2Fl9zL14AtTidaLpk861mEQINajNFwp1QmWDKoZvpiWYypmgaU?=
 =?iso-8859-1?Q?xv5j8FhC1HUqeEv4xqekzB3g9c0Jnt0ASeumKl9U6pAGGKzKIgCRPhx9Nt?=
 =?iso-8859-1?Q?j/wZMWEYUyq8eNtsk2jFwv4G6CFFCFDapBZKQedSsHrdo2A7erhsW3bHzb?=
 =?iso-8859-1?Q?pCUlCq+vwze1Tbl9hCnScir8jSNqtKCBUvAjKXiwsUptn2vniguk5mPkgZ?=
 =?iso-8859-1?Q?3KKI0d0AzBjMxXWbN7pNp7zi6jcdNg8ZXtyyJBVqMebCrwT+7uWrA+f/Mz?=
 =?iso-8859-1?Q?AQl07Hy33jD7iddvSOL7kszIPJXlY+6TI3fFttJPHVomRWU4DaDAzASrUT?=
 =?iso-8859-1?Q?Aby8tiVrPsuaMmF8XLMcC8VqXMYyiiVt1HMl3NjyDFFmZqHpN3JR02LpXo?=
 =?iso-8859-1?Q?lfK3R2IYKoawvO2fmUpADDATnByMC/M2i43i3wXuzocw8uL0X0VyKdr0DU?=
 =?iso-8859-1?Q?Ryai2wZLuXIwOct3N1cgl+x3slj+oEUpnHYg/JNYKSwuHgHqd2Wu5VKvbj?=
 =?iso-8859-1?Q?YJSBNzZ/3oB4d+Cav1aWYg8VujXiBA29GyszhhKT3wvfs4O+rEguJpr6FG?=
 =?iso-8859-1?Q?dRu0bgy0i1f+jv6zAo5N0dOhYMjhQcRo7uqF8PVxExS0whjVFMVkNqOpfG?=
 =?iso-8859-1?Q?2LlyUvIHOQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ff6291-9a26-4620-ecf8-08da18ad78d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 15:44:16.0831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xPyoWHJaNrH1aDDy9ohaiFPUPETtOPSojPaJp4Cs4bsnPjqE3lz1onSjy6Ak69Y+jg1eZPgFjMAayj7rqs0dij7kfNsdpifGQUy5sVnQ4zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4096
X-OriginatorOrg: citrix.com

> From: Jan Beulich <jbeulich@suse.com>=0A=
> Sent: Thursday, March 31, 2022 9:42 AM=0A=
> To: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Ross=
 Lagerwall <ross.lagerwall@citrix.com>; Konrad Wilk <konrad.wilk@oracle.com=
>; Andrew Cooper <Andrew.Cooper3@citrix.com>; Wei Liu <wl@xen.org>; Bjoern =
Doebel <doebel@amazon.de>=0A=
> Subject: Re: [PATCH v3] livepatch: account for patch offset when applying=
 NOP patch =0A=
>  =0A=
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments=
 unless you have verified the sender and know the content is safe.=0A=
> =0A=
> On 31.03.2022 10:21, Roger Pau Monn=E9 wrote:=0A=
> > On Thu, Mar 31, 2022 at 08:49:46AM +0200, Jan Beulich wrote:=0A=
> >> While not triggered by the trivial xen_nop in-tree patch on=0A=
> >> staging/master, that patch exposes a problem on the stable trees, wher=
e=0A=
> >> all functions have ENDBR inserted. When NOP-ing out a range, we need t=
o=0A=
> >> account for this. Handle this right in livepatch_insn_len().=0A=
> >>=0A=
> >> This requires livepatch_insn_len() to be called _after_ ->patch_offset=
=0A=
> >> was set.=0A=
> >>=0A=
> >> Fixes: 6974c75180f1 ("xen/x86: Livepatch: support patching CET-enhance=
d functions")=0A=
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>=0A=
> > =0A=
> > Reviewed-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> =0A=
> Thanks.=0A=
> =0A=
> As a note to the livepatch maintainers: I'm going to put this in=0A=
> without further waiting for suitable acks. Just in case I'll put=0A=
> it on the 4.16 branch only for starters, to see that it actually=0A=
> helps there (it's unusual to put something on the stable=0A=
> branches before it having passed the push gate to master).=0A=
=0A=
Thanks (was on PTO and away from email).=0A=
=0A=
> =0A=
> > Albeit I don't think I understand how the in-place patching is done. I=
=0A=
> > would expect the !func->new_addr branch of the if in=0A=
> > arch_livepatch_apply to fill the insn buffer with the in-place=0A=
> > replacement instructions, but I only see the buffer getting filled=0A=
> > with nops. I'm likely missing something (not that this patch changes=0A=
> > any of this).=0A=
> =0A=
> Well, as per the v2 thread: There's no in-place patching except=0A=
> to NOP out certain insns.=0A=
=0A=
Correct. FWIW I'm not really aware of a valid use case for this=0A=
=0A=
> =0A=
> > I'm also having trouble figuring out how we assert that the len value=
=0A=
> > (which is derived from new_size if !new_addr) is not greater than=0A=
> > LIVEPATCH_OPAQUE_SIZE, which is the limit of the insn buffer. Maybe=0A=
> > that's already checked elsewhere.=0A=
> =0A=
> That's what my 3rd post-commit-message remark was (partly) about.=0A=
=0A=
old_size specifies the length of the existing function to be patched.=0A=
=0A=
If new_addr is zero (NOP case), then new_size specifies the number of=0A=
bytes to overwrite with NOP. That's why new_size is used as the memcpy=0A=
length (minus patch offset). It is checked against the size of the insn=0A=
buffer in arch_livepatch_verify_func(). I think the code is correct as is=
=0A=
but I could be missing something.=0A=
=0A=
Ross=

