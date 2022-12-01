Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210FB63EF0A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:12:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450506.707788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hTb-00059Q-9D; Thu, 01 Dec 2022 11:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450506.707788; Thu, 01 Dec 2022 11:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hTb-00056s-5U; Thu, 01 Dec 2022 11:11:35 +0000
Received: by outflank-mailman (input) for mailman id 450506;
 Thu, 01 Dec 2022 11:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0hTa-00056m-36
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:11:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8055db3-7168-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:11:31 +0100 (CET)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:11:29 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 CH0PR03MB6194.namprd03.prod.outlook.com (2603:10b6:610:d1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Thu, 1 Dec 2022 11:11:27 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:11:27 +0000
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
X-Inumbo-ID: e8055db3-7168-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669893091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kEs4RlQGVRZ2Ekox37FfiQGXsUgvTwDIi1KQxWXgwdw=;
  b=Ku3slpxUTTpxtAc7eOS92b0cBRBsXRsZY/JdwEeIaeoadlMQi8JBOzTA
   SNqLqbn3qNE55wDAt/SvF/8mQzbrTQc+Gcsw821TLRjvUZeSBsilVer+T
   3/8hLW/q4pxWD9ax/f+eck/n/ZTUOkxhQ/3VEMC1NVSnQ5dQ5LkaVMfxb
   E=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 86451118
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bU8WKa7Nq7DL8xNSh4aHYgxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 jEXXjuDPPyOZDChfYpyOty0oUtX6peAzIA1TwY/+H8yHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZkPKoT5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 vokKDBXNim/n+vvh66VbNtIhZ1gBZy+VG8fkikIITDxK98DGMiGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEooiOWF3Nn9I7RmQe1enlyZv
 X7H9mK/BhAcON2Q4TGE7mitlqnEmiaTtIc6ROPkq6cz2Q37Kmo7UycUDkeQit6CuGX5ePl+E
 RQY3hoklP1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTAjy
 FKhhd7iAj1r9rqPRhqgGqy8qDqzPW0ZKDEEbCpdFQ8duYC7/cc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:EpomOquGJkt0/MMauKqNTNr57skDS9V00zEX/kB9WHVpW+eTna
 mV7ZMmPHjP5Ar5OUtOpTnkAsK9qBznm6KdjbNxAV7BZniEhILYFuFfBOLZqlWLdhEWndQtt5
 uIHZIObOHYPBxXitv7/Rn9M/tI+qjgzElwv5a680tQ
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86451118"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erdh9yygND+JgG0ujrxUraiTYFzCqQOzlUMJE9YSagoUaSuu71Dt48co6sYMCS7z1S78cSZW+vA3dby7P/M2pszpXR0EwrkW+6w6iUc0djcGEE2kDa90dSqRMVJN1dWPvZEOZT3FL09QO+J/xh7wPhQxlztGAM9wFRLKLCuN8A/FXFY9BYbhDoq3ZIC05pFQ3AXhp9qsYUYp+Mg/uUY9M/2TYFi36Og8tHfBkawL+a9HN8ZaLx27yBE/bsPN6zvAk53uHKdjc5L+h4WuT3ldxZ3i7t7hZK9J2ic7pz2WSp/ZPdrXChndemCCNFPjou/buZ0NOOHI7KuptXPGSZSHhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEs4RlQGVRZ2Ekox37FfiQGXsUgvTwDIi1KQxWXgwdw=;
 b=XCtNLhdJ9zzaKNLX7j+qh662nnZEP5z0NMfAdWS8TvIx3OJDPAHYTZDnMT5kyoXPfIsJDJ535Tzxob9ym3s+n6lPEHRU7NiMlkm8z48kcTecCflOfCF0SI7Y2KX81RvRCJk+QZEJ+Tf47DNDiVm5G7cs4dC855STEJ9iglILZFSfqaT9oqsoej538mFOqSTfpABWvKyryO/5g+tlfv4rzCQ6GtHPmQNVfSp4fHWk8/Uo0LdqvhGR0duAPROmmAJMx5BQM2DwGZ9dWnHx7sQ4+xh6iwQ/TCfXlR6IipfkuNqceilP4NyDrIT+VTMzvzoPy+hVaKJ/NtXxvkkbPVHvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEs4RlQGVRZ2Ekox37FfiQGXsUgvTwDIi1KQxWXgwdw=;
 b=u8nacejqw5ULC8OwHUFMHxOAp5/btPYy0VKfEznC6uYvTy72QgphAhwJhdhTcV9Kq2YagdHFwRVPHWviKiXxJdvqIWPAQ4Q5bkxbW7ZW+UHH28OUX32kPX8OWvt8C96kXsBO2NRIUs6qbWIdCCBGaWnqe6HHfkkZCof0UAcF9nE=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 1/6] tools/oxenstored: Style fixes to Domain
Thread-Topic: [PATCH v2 1/6] tools/oxenstored: Style fixes to Domain
Thread-Index: AQHZBNx/vtWsLc9Jpka1I/Yg40Tgkq5Y4ZaA
Date: Thu, 1 Dec 2022 11:11:27 +0000
Message-ID: <7CCC4E5A-F80F-4BC6-A34D-666D579ECAFC@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-2-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-2-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|CH0PR03MB6194:EE_
x-ms-office365-filtering-correlation-id: 381f413d-d36d-4cf8-9420-08dad38ccac0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 utBqdYdo0QHvGYH6h+DU+B3o1/vMVpfVHhZG92BOCmCIw49pez16tJC2nl0JVOxL8r32N3nJHVAcncl5lmnpgndsk9FH47kBx1iOgV56iDkdQW5ihKiUcM6vzKUzgCitmKj7cwTU6QMrjlZil0I1FD9q4hiGBGkh3Gsl6IqmJw7+p84B5usbkOTxVkbHRhCi2iSzr3rGnwNfLeTMB2BuZ8N08R9J1iyYc8s6HPI0mK+PufeyLtoSCjZuhhH/MvSArQ+SRYbpKo3mkizPv6ea5xMBfH8FCYm/pA8zt3dYrw2b5HXHSiASjgG1uaHgNIR/77VpWuQuZXEogjkeEREAQK84Zwz/HRKWujLgEd0Kz2+ZuI8ie3j/+Vi/lGjBWA3WyXkcc8uCmWjURg/MgPqxrmV2pvH+1iBjOcOY9ovSmY3Fk5H2dw3lPYYCosnlX5DR77zo/4b76wDwfKcsMIAnmf+KDz0GRcF/4wAprsRg+sYM5rqcUZaqijgHNuYk80raWqTzbg+YvAQ9wPgzoUZJBGmWZr3Md1sS+iv8s/KpflgJcvFQY+edIEBXoyfmEVVxmukuGfwDpS1GyGcfQl4ki4e4XdgfXI2O0txOCebAD2a4vgxM8ETmCGAqVS1dJGL3r4FLmCBkDs/SYKLH7k0Q3g6cHFeAqlGRAAKadxwtACfzypXvSGpiqTpDl02HTF3Kurb8SjRkMvfELfn44Qijf/Z/fBRuZwqyCtPC9sCRFkU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(38070700005)(33656002)(558084003)(82960400001)(38100700002)(36756003)(86362001)(478600001)(316002)(54906003)(6636002)(37006003)(71200400001)(6486002)(91956017)(44832011)(2906002)(6862004)(4326008)(66556008)(64756008)(66476007)(66946007)(8676002)(66446008)(76116006)(41300700001)(8936002)(5660300002)(122000001)(53546011)(6512007)(107886003)(26005)(6506007)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/SH6wzIh/8KBPPkDGpfp6DvHr0QjHfhEl3bYy194gFUjDlFxy+WPRsPb9DTe?=
 =?us-ascii?Q?qoBs+ioZPEIxvQ1eDlBaqtf4mtwHy87P/n1T+PTlphdBe1i8Oknt9chgfM35?=
 =?us-ascii?Q?sGdqrRNBLrXH8YTA2XlCDFHflafCBAF7HAT83/DSAdr3vw0wSnKP4MYLzoxz?=
 =?us-ascii?Q?bs5Eg0YGPlZpDw61Auuxz++QG7rm180GJXwPEW21kYAIotIOPnxjpoQG8Jjq?=
 =?us-ascii?Q?53EUSds4hkXuCCVXtW1gZqAaxsSNhC4eaIVHO5V3nMVVaKLUQHNQrxAhj8F1?=
 =?us-ascii?Q?fRI+qGg1XgnxZg41MnEna0au/pZ37bpwJIG9niG7Z/n80/vS6FRBE94pDVLj?=
 =?us-ascii?Q?SvlJcD62effo2vjUcCF+wAVlmcXMg1AW1aSMgebQvRlpxSfj9xtdwm2CKZ5d?=
 =?us-ascii?Q?pkMy7ZrjqTpnbyy153yn0Z16hO9m0LKPzlcEu695LmVVS8EgpFbsf9AwwzFx?=
 =?us-ascii?Q?EGSTI7numTubrlJv1uUrSFwezWlVrcpQgg7tAH67JUkr6prlFTs+FF0v4xte?=
 =?us-ascii?Q?8JdCiO485mEHlDnu57XN18rTCmBYTPVsaHxSO7ZAlvJATQXxCbhOjtMsAVRN?=
 =?us-ascii?Q?TmXy3jBHacQBfItQm/wpL5AQxSgeaXpnyGQ47ICLBFGABAu+oOrvgtDOYQdt?=
 =?us-ascii?Q?X/9r9FlmqL4oUuwcsSuRty3U2nRj93Rc8WdkgKm78OZ+xKtBRB3+eHswH+A1?=
 =?us-ascii?Q?AxUZxcU8+sDlHUhY1192+CsZfL5ukkAVcTq5En7NCp7cV9BA64AAq4E13hS/?=
 =?us-ascii?Q?IM2EpvCsIRtUOomwDUuqvuqS63+pHhqrD2aNtz6zUJm58UaoGs4rDQpXzQgt?=
 =?us-ascii?Q?MS+agc+KODDLj59/IK39zcswCpzY/jT7lpSvwuR3VqDoWU0bVpSPRHNNi21B?=
 =?us-ascii?Q?BTxC665GtV+U35nTsxevwlIFoW2KheUe7+S+nDaXdGcGKTH5IZ//JPZJuBnF?=
 =?us-ascii?Q?SmkShl3e0toilQkHiSmnKAGxI0WePqFkBu01dlujHzaHYKgdI9ksYXuhm+L3?=
 =?us-ascii?Q?5+0yBXruRLN4IFB42fa8TQ12AwSYA1ummkX4cPWIapFH0ks1lFsQnOL1Gv99?=
 =?us-ascii?Q?rd2EzJbjHI+jClkG2wNsXtDNLXl9sKc1DFjBAxxnOp6TYZJuDtwDFEGvlJg6?=
 =?us-ascii?Q?QvdyKbOgUboxJGS2gJ7YMedtDbIpbbb0FhLJEVLpzW3d0vDmI4HRXHT/68/M?=
 =?us-ascii?Q?zt5fjR6JY06erg+WfmjulkBUUdCvbdlFMzZZdXu3TOGCXYMU/XllWxApG7Rg?=
 =?us-ascii?Q?E8P0krEqjrJqAAUnSsCKzcAx7BHonmq480c7Is6L10T5KnVx2D3DLakP5N/v?=
 =?us-ascii?Q?Vb5oPwLf25BpzYLPW03+kQbR/+5wVCjf2SHUIZc5Sw3jRFXODhOVBdKcp6Om?=
 =?us-ascii?Q?5ED8lEXpRJ4BEnAZLO7UELRJgcg/IbvQSMfu3/Mb75s04Q1JfQuLcfPUj+Q6?=
 =?us-ascii?Q?b8kYu70btT+9QQD94P9ju3Y98DVhE0pMavqXuTVQxEWDEDYLry67QN+o4fNj?=
 =?us-ascii?Q?Pzl4/cypWyvYX55ZgJLo6ydVqsoxkZpVAVK4WaP1WYz9Ty+Rz2/hFMUxvrX9?=
 =?us-ascii?Q?nim3fnXQtD878+pi/1OMJlKDvoonEeCPjk2FqH31DcXGnkx4VkMqcrrsDdx2?=
 =?us-ascii?Q?yspKM4XM42B7K2qJDUF7E2s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4CAFBCDAF1C25743A8D1FFDCFA94FEA7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	97FaZhcN+SNkFxcvNZAOv/VqKJnLleogBjfoCpTmGBxzIsGBrBvXddhibDNSdOCGLLYfKslVyqosxv1J2PT72rnY7smVmni0FAcQMusZLSkC3YmTNlRQyU3D8ibPrf2bFEim2WcMi9LsX2C/p5pXppq6DRgwPbhpnQME0vSgW0QaneUJZz31QbJGqbZk2rwbDwARkKzk6OPUAIBfcEG6wq0lT8pufkupzYRGr5yyZA696w0oVU7t6EtAYZYv807D4gnNMnLUSbdTjEIq7cbnDFLRELmIbGDixE4At0k9pNavXadVuzQHlBsa9uOIiHPApxix6puAx8cL0FEAPKtjqykNWdhALOQrNwqupc6SEQBJVxclweUyBfAJslJcKTP5EmzEBlzZsH4ltTORdjiRDaCHvgCfMn4ixWKgUgXLgNsvtd5kJtJe0eppPn0eSW3WtomJ2PxiK8rdsKm0tzLzw4je3AlTeq4SkT/PGOnZN7CmKAD8oKzEjLbQHvmVm7f6y3UPD0YhUstIJSjX4hqzKKjsmegX33+kQsEiwMTB09HDtWH5Bi7c3gvRIdRpC2RyiuN4P0H6cIudiIWflw8EU0N7mJzY8Bg8WDN2K0/lCK/qfz+J3InD1xK9WHKKuIdoxiwWz2M72hBpByMuJktKE+OuLL/Pc+zmw72VZabKOf7LQMRr2WzUnCSrB7l8vQbfJBxNLyksZbkcruyCOJEkbapJt/LU2F/0nWNnjQyvtqCwrIEql0k6Mo7FYk2vYzasBMBF0Guqpx5XUHU1OZ1oiCj4ADK944/ZJo9aoTDCN6/PNkLpuIG+Tdl+Cl4xO0AS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381f413d-d36d-4cf8-9420-08dad38ccac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:11:27.6222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIdNmkjzNDYchJVnwekgK6T2IEmzqURQfN0sk3psHIRtxJmI0ojFUQjCLB2LeveZTaK/OH1AKolTivmToR8ZJlxYTmLL0dJpWTZkVF9OgGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6194



> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> This file has some style problems so severe that they interfere with the
> readability of the subsequent bugfix patches.
>=20
> Fix these issues ahead of time, to make the subsequent changes more reada=
ble.


Acked-by: Christian Lindig <christian.lindig@citrix.com>


