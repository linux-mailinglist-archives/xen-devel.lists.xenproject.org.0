Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C484A9730
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 10:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265318.458660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvIb-0006P5-Og; Fri, 04 Feb 2022 09:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265318.458660; Fri, 04 Feb 2022 09:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvIb-0006Ma-L1; Fri, 04 Feb 2022 09:54:37 +0000
Received: by outflank-mailman (input) for mailman id 265318;
 Fri, 04 Feb 2022 09:54:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFvIa-0006MU-MN
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 09:54:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741bf21d-85a0-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 10:54:34 +0100 (CET)
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
X-Inumbo-ID: 741bf21d-85a0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643968474;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=nrhw4Gl5cjKq3B82uTDbfZ0cuYcJTthEIF+ScbFjrv4=;
  b=WQDVi2aA/UfTFMzJu9aFjshWCnjNO7j/eGzAG0FnNMOW66JAXPA6zUsm
   d4aMwdq0BfN/8jAO9kF2BXnsK025cBtVSoC4SQv2kdCMMC4lB5+jKavlZ
   sxJlZgUwjcolClRGfOC2FRst/v+18zdh/NuIWuldJfIuFFSLHEH0evrcJ
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tzWl6HIjNOc/2DL6uHQ7oClEes8YA7mtrK+3mYdM0GfiE/foUd2K6V/XNCXLXzIPx0qrBO+SQj
 y7no/JejNzKkGWAO94+Ptc8riBnfRk7nAeBYJNYb8s9PN63n/MsCX1YcAzVXRM3PUwbPwlDvOk
 xuuI5JlFxGI3Ooqe5mW7OcHaC99seX3m5LVSvZFf+zp1R4evbWjxhvgBp+TtNr6Wdo/VXWWdeh
 G/9XRfnjdZUgTHezPxAh7Y6R+ekUns2BBN0FQbNkfx17IsXRusNeUD/h++AjP+VQMdi4HAI09O
 UpQHxLNaept0D+W7q4d7SccU
X-SBRS: 5.1
X-MesageID: 63401626
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:F9AON6swuCulVRlFNri0xvoxUOfnVNxZMUV32f8akzHdYApBsoF/q
 tZmKT2EPPiCa2X3Ltt2Pd6/9x4H65fTmtBrTFQ4ryo1FX4R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2YThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6LuAUwIYNYDwiOU5c0V2FSxQI/0dweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JsSRa+AP
 ZRxhTxHbxPlelpIK3MuJZckxPuHtCPZMDMJpwfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKd+2+orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGr6I/6UiqRdnVRACjrTiPuRt0c8VUO/037keK0KW8ywSEAmkJSBZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTNrd94sA9eJwBICl8YYB4PYDcV4v3D/K81gzzRHo1aRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zsK4YRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yP7FWyzyGsnTKuMDiriUWWyC
 KM0kVgJjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwORXAhD2zzRl3zvpX1
 XKnnSCEVy1y5UNPl2Leegvg+eVzmnBWKZ37GfgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3iyacFjaNyw4NdsCn/9X9BoGAMDlBn7xs1ALaoez9qYPMZwxeLgs7ut4yvBoC
 fICfq297j5nE1wrIhwRMsvwqpJMbhOuiV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuGOuiyy16RvGQGnL4gVUX/PdQOKl7n95JnKnKtg6Zvcd0MMxjK2hCTy
 x2SXUUDveDIroJsqIvJiKmIop2HCex7GkYGTWDX4azvbXvR/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxSu85w7g/6t3jo65h4j5lRHibPU62Dr5AI2Wd2ZUdvKN62bIE6xC9X
 ViC+4cGNOzRat/lClMYOCEscv+HiaMPgjDX4Pk4fBf66Stw8ObVWEleJUDR2ilULb8zO4I52
 +Yx/sUR7lXn2BYtN9+HiAFS9niNcSNcA/l26MlCDd+5kBcvx3FDfYfYW33/75y4YtlRNlUnf
 22Pj63YirUAnkfPfhLfz5QWMTaxUXjWhC138Q==
IronPort-HdrOrdr: A9a23:w5/+da1vxqyqEN54d7dElwqjBSpyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXxOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mJryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idhrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1/DRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amHazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCS2B9vSyLbU5nlhBgt/DT1NU5DXCtuA3Jy9vB96gIm3UyQlCAjtYkidnRpzuNLd3AL3Z
 WBDk1SrsA8ciYhV9MIOA4we7rGNoXze2O/DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63401626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnG/azxWoZc+7I37nEwGxY8SkeBmdUFBkM4PM3w3OFwKSrMHC49mvVVMtJmhG0aAKawgxPD5y4AzFHuYcIQEBXHhnWyzlrnFVlbQYmI0H/m1sPhtcKEg/9IPR2REmPLJfRHH+dHx7wsq/NPJC/liAGbdsftt++cQQVdOpel33FW9/Bd/ifMGIvzcoXCJC0yK4BqL2ZyBanHRCAmTlkGis/q4rplHXdKHb5qrT+fCh4HI+Io8RbbOkMDbR72RBnS5Z20qocqpgqqPPyIj+IMP2gsLI8zp9uRZXP9Eyg3GBuc3265i3L1oyDfpyeno3hGSYXTUyxs/OGf3/RtZsQWtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLrXdBKq1Kb7cup8F/PSzD52IEIcQ//gq1iU9TcYCVY=;
 b=PWyFE/suoqRGrfJSQZpy1nY9CCOU3nyG5UEAg9E3Ore4JDgqFmTbzqri9+nr/a/GR/Tpu/MRHOI1jF4D1WgFboAqx0no+jmCWLkQ2mV5YthSw0UXRalg+NrEopweQ843ZIpblGRGMLP2anR+RklVMRLA0oV41jSOn2Q9hDpW1TirGd7X4DCqvte6Dmtp/CFwLAhjpRMthdiQ309xP0eK3VQ/RZjy8O2NMsRFD24RHXSW/ztEc3C2x20ysIXsvV7x96WqKezRL1uqeDdKvdBeYRpqGELXXL2a1rezd/C+l8znCoJED4EY5k3LoXE+mfekrJBGqfjec9GGBUXT5bVEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLrXdBKq1Kb7cup8F/PSzD52IEIcQ//gq1iU9TcYCVY=;
 b=nZXlLrdV+eOs6SO7ixSSbRJyeshH39OAVTT7YO63y8DjeZt5hCZxZxeDxTCtO7aaKf4vf8sb1yy5NM2kVcn6GtSvfB2rauvLliIf5M3/rPi9gNxeV08kym3AnnbzeBUd1hle1GdiFfo1AMt/qLEEOOKsF3tJrmI1KMghUdgoChs=
Date: Fri, 4 Feb 2022 10:54:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/vmsi: add support for extended destination ID in
 address field
Message-ID: <Yfz3zLFpA3DWt27m@Air-de-Roger>
References: <20220120152319.7448-1-roger.pau@citrix.com>
 <20220120152319.7448-3-roger.pau@citrix.com>
 <2e96bf2e-a31e-da9b-2f08-adfa0928e5b9@suse.com>
 <YfzwepCoIvJ3cI0v@Air-de-Roger>
 <d4ff7ca4-e728-5f5a-e569-ae42fdf17157@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4ff7ca4-e728-5f5a-e569-ae42fdf17157@suse.com>
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a41d2be-af8b-40d9-2ec4-08d9e7c4534c
X-MS-TrafficTypeDiagnostic: DM4PR03MB6061:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB6061488FCE3E1801ECFC9C808F299@DM4PR03MB6061.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmwpnSBWhOJ3Iwl61DyCx3V1FIbItVo8z7mkPaQYHpYIvSg6MhulleYLP0raO2KbgQxQPiQkNa6Nh6lQZkWKJix3bDZbmJzKVo+rIl5gOOK1iml44OOFLybNzVZ7ArV2ftUDRxEv0mB22j5Svr9K3lb/MxbkfAQy/uGwlo0RlDHeixWAzc/s4Ukjk2JqNfDC54PXRwZ7CAgJ8dLe4kqKliM23Ir2XO++j5iiaE6kM6R4wp1X8f25/o3jjYj7op848EDwOUXzKjNlzq4RDVC3TDxA27AuDD+djsiYt3lfl4RvjxBps8W7Jv7ExwPu5y6FVPhLSiyhatsolyAjOuWZuQyug8wTbOGnUc2bQTy+TngAnbMlnmmTveQP/PS0HD+sOENGr/ymB7r05HogRkiv/5TB1W0SRh6PifeIAhovrtjwYXAAVd43ljqbTeXiVRCz7Ttfyr7i3XA3TYjCtXcNN07fvYH6GkBRzDs/w9GpScBQ+hO7QHn73SJVMVSs0EIxKiIpKSexghIX2SJW542msopupS9MS1JH9HskwedBIIjD/pyHfNw/u5sp3KgysiRPFDs2NRWnEEUAIlxHegq1X891frKIsIm1X2UxMgp/IhPYYpZWifiVkBCGX1XWOyHYyktnXcOJA9OBDUE+ZKL3xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4326008)(66946007)(8676002)(8936002)(66476007)(66556008)(2906002)(83380400001)(5660300002)(6486002)(38100700002)(82960400001)(316002)(9686003)(6512007)(33716001)(85182001)(186003)(26005)(6916009)(6506007)(508600001)(53546011)(6666004)(54906003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHF0NHYxcVNrMXl5b3Z3SE9OL2pNU3MvaGJnZkQrYkZ6Y3ZITThtY1owemk4?=
 =?utf-8?B?MzNiN3B3dmpKVFZ4TUdpTGhBQlp4OWNUNk53a0UyRkltcVZjUFBkWkVsZ2Fk?=
 =?utf-8?B?ODZ2dXVUd0U1SVZOUm1Tb2ppVXJRQ3YrZ202M1lqa0ZJSGZLMGhnSlBhS2Rz?=
 =?utf-8?B?MWtnNTJxa2loTDVBUlRuRk44TStNd1hNSnlMcEgzUS9icjZyOEFWMW5uRy83?=
 =?utf-8?B?OW1WZGRjOW9jTnNBQjdqVmpYWktBU0RieU9Ga2kyNW0rQlRBTnN1VkJnZGRa?=
 =?utf-8?B?bUVpNXNmemdPbTNNbUtwaEZHUzgyd1BqVmlYTkNrbldFakNIRWtVeEppYlVN?=
 =?utf-8?B?ei9GSi9naW9KRGpieTBlZ3Rtc3M3bXhHOWMvOXZrZngrYWVUaTNsTGVLNzZG?=
 =?utf-8?B?clcyQ1kvMEdFdDZpbWIrekpnTUJMK0grWEE4OVY2L0xnNmFsNmF6UVJIa3cx?=
 =?utf-8?B?SFJielYvTXpBZHpGbzNLYVdzYnVBSUpGczZzdlZjTElQNjN2TkU3RUZRNG1Q?=
 =?utf-8?B?V0VNaXRvU3BzRUtETjJNaEh1ODVvUVFQbHUxMjRENGhxUFB2SWhZVndXbHRp?=
 =?utf-8?B?RlgvYjhWTWN1SnBQdGtpTEppZXAxU21zSDc2UG9HYVN3TXdua1BlOUxsN0pk?=
 =?utf-8?B?dzJzdGN6UzZVQWl4QVNQdUhmUjMvNnBCRWRHcGZNV1NKaHhmKzVLZzVTTWJF?=
 =?utf-8?B?TjVaaDVVRlpOZytxTlJ2Y1pwV3IxZXM2RkFHQlNFV0FOazgvN0lETFYwSEE3?=
 =?utf-8?B?YWR0NVF5YzJHRmlENEkzd0xPSng3cWVieDAvdjRLalZmTFg2dzMvVitRK28v?=
 =?utf-8?B?Q0xxaFN2Q0drM3hKb21NNGZ1TTg3WldjK0NVZ2VPSS9GdGZFRFF0bHZkYTFZ?=
 =?utf-8?B?ZnpDVU5QNkV2Nms3V1Fydm9WVUxzLytkYUNkc2VoRnBEVUt1QjhmeUIvVEZX?=
 =?utf-8?B?MTRyZ0NCT1VaN3JodFhiYkNWME0yazJIWitzZ05TWC9XWFU0OWVQVzA2ODF6?=
 =?utf-8?B?STZ2MGFWWG02blVQWks1bDRGZWNXY0IvVnd0YUdyNkpzeVhOVFBQKzNsZExq?=
 =?utf-8?B?dUkyNmhCRHlCRGwxK2JNa1c4RnRoaDRUQ3UvaUZFMnVpSWJVOXpacnVLYzdq?=
 =?utf-8?B?T1BSeGEyZ3lTSGhtRkdrTnJHUkx6ak5YYXRsWmdQNTF6MUZKQ1FKYzRYemRi?=
 =?utf-8?B?MmE2YmVuVlUrclBZTDE0YWtJbDY0NGw0UUlUL1ZSY1NZZS8welhSMlZ6cEkw?=
 =?utf-8?B?Smd5bHFWVFNwYW9rQjk2V09pMzZmODlXL1hmRUtQQmhLbmRwbjhKWU1jRGpp?=
 =?utf-8?B?QzNCOXYrblNEemppY2FZUW9JSWJhRENqMzNGQkVuZjNPUGltN0EzNnpjcnZi?=
 =?utf-8?B?LzN2ek9TTkZsV1ZYRi9CSTRWc0xxTEpXb2QrdEM3dTViRUY4a3pjYlhwZklr?=
 =?utf-8?B?aDJUUHJrTWFsZ25BZjlZc2p0NDVHTTc1bHdheHZwN21Bc3NwSkRQZDdvUDlw?=
 =?utf-8?B?SVFucGQyeklkTlh6M0hOLzkvbVR1RytHM2xqdDhoZEJaL3R1U3FUMk0zeW9Z?=
 =?utf-8?B?Z0pXZkxacXI5clZ1d2M0Q1pOSmN0eHlDNEw3cjk1UUk2QjhyRytpRDhlSTBY?=
 =?utf-8?B?U3JISDB3c1VVT0kwQ05ENkd3Z2hXZzkxY0J3MG1sTm43Z1M5Zm91Ynk2b3VM?=
 =?utf-8?B?VHRrdHB0ekh5ckRnWTZuaFlpMDBjbFFxZzlXeWV0ZFVaWWtuYzhuYVFwM0tR?=
 =?utf-8?B?YzJmSXFBUklJSENobGtnSUJybTdkQ1ZjVm9leWNHRHFORHcybWJrWUVLWGJq?=
 =?utf-8?B?UTBnY2JPWlhxRzlNZFB3c3pCZjRWOERuTk1hR0EyZVlKbkdJNDN2ZVN5V2FO?=
 =?utf-8?B?aTQyeU05cEhYUHZmQkhPRFo1Ui8xZjUwZFZLQURtN3l3YTdVbVVSODNkUkhJ?=
 =?utf-8?B?a2FIS0wyM0xFeWVQMUNrMmFkWmRzMUt1K20wSkhQZUVWUzhnV0l0ZHZldVds?=
 =?utf-8?B?Y2xGTEVmUFkvVVpIQi81R1BLbHBuaVFkTW9pN0dZbGNWUDNBcHBYMUlzdXJz?=
 =?utf-8?B?VGFraE1GZDlIVCtNOGp3ai9iY2h1UitHMkdrM25WcjlpT2EyL3NHSVZKMFc5?=
 =?utf-8?B?ODNPSDBBcGdUTm9MVHFsNk1FWVJsejN0NUxIUVRWV2VFVTdWeHRFZC9rL2kx?=
 =?utf-8?Q?mvemuzeFRxri/721VvD33mk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a41d2be-af8b-40d9-2ec4-08d9e7c4534c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 09:54:24.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/Lj00Ko09SMBSH65ingiNZvifRsUliarq8ZvaV8DtoiJjIE7uWceajaG4fDYz3g0LLDpYI/FMl9JMqQCIdTjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6061
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 10:30:54AM +0100, Jan Beulich wrote:
> On 04.02.2022 10:23, Roger Pau Monné wrote:
> > On Mon, Jan 24, 2022 at 02:47:58PM +0100, Jan Beulich wrote:
> >> On 20.01.2022 16:23, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/msi.h
> >>> +++ b/xen/arch/x86/include/asm/msi.h
> >>> @@ -54,6 +54,7 @@
> >>>  #define MSI_ADDR_DEST_ID_SHIFT		12
> >>>  #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
> >>>  #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
> >>> +#define	 MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
> >>
> >> Especially the immediately preceding macro now becomes kind of stale.
> > 
> > Hm, I'm not so sure about that. We could expand the macro to place the
> > high bits in dest at bits 11:4 of the resulting address. However that
> > macro (MSI_ADDR_DEST_ID) is only used by Xen to compose its own
> > messages, so until we add support for the hypervisor itself to use the
> > extended destination ID mode there's not much point in modifying the
> > macro IMO.
> 
> Well, this is all unhelpful considering the different form of extended
> ID in Intel's doc. At least by way of a comment things need clarifying
> and potential pitfalls need pointing out imo.

Sure, will add some comments there.

> >>> --- a/xen/include/public/domctl.h
> >>> +++ b/xen/include/public/domctl.h
> >>> @@ -588,6 +588,7 @@ struct xen_domctl_bind_pt_irq {
> >>>  #define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
> >>>  #define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
> >>>  #define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
> >>> +#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK 0xfe0000
> >>
> >> I'm not convinced it is a good idea to limit the overall destination
> >> ID width to 15 bits here - at the interface level we could as well
> >> permit more bits right away; the implementation would reject too high
> >> a value, of course. Not only with this I further wonder whether the
> >> field shouldn't be unsplit while extending it. You won't get away
> >> without bumping XEN_DOMCTL_INTERFACE_VERSION anyway (unless it was
> >> bumped already for 4.17) since afaics the unused bits of this field
> >> previously weren't checked for being zero. We could easily have 8
> >> bits vector, 16 bits flags, and 32 bits destination ID in the struct.
> >> And there would then still be 8 unused bits (which from now on we
> >> ought to check for being zero).
> > 
> > So I've made gflags a 64bit field, used the high 32bits for the
> > destination ID, and the low ones for flags. I've left gvec as a
> > separate field in the struct, as I don't want to require a
> > modification to QEMU, just a rebuild against the updated headers will
> > be enough.
> 
> Hmm, wait - if qemu uses this without going through a suitable
> abstraction in at least libxc, then we cannot _ever_ change this
> interface: If a rebuild was required, old qemu binaries would
> stop working with newer Xen. If such a dependency indeed exists,
> we'll need a prominent warning comment in the public header.

Hm, it's bad. The xc_domain_update_msi_irq interface uses a gflags
parameter that's the gflags parameter of xen_domctl_bind_pt_irq. Which
is even worse because it's not using the mask definitions from
domctl.h, but rather a copy of them named XEN_PT_GFLAGS_* that are
hardcoded in xen_pt_msi.c in QEMU code.

So we can likely expand the layout of gflags, but moving fields is not
an option. I think my original proposal of adding a
XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK mask is the less bad option until
we add a new stable interface for device passthrough for QEMU.

Thanks, Roger.

