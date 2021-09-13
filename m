Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072840975F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 17:33:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185774.334505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnx6-0001dj-Er; Mon, 13 Sep 2021 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185774.334505; Mon, 13 Sep 2021 15:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPnx6-0001av-Bf; Mon, 13 Sep 2021 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 185774;
 Mon, 13 Sep 2021 15:32:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srN1=OD=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mPnx5-0001ap-6C
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 15:32:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df0a8208-14a7-11ec-b3ba-12813bfff9fa;
 Mon, 13 Sep 2021 15:32:58 +0000 (UTC)
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
X-Inumbo-ID: df0a8208-14a7-11ec-b3ba-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631547178;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pPeROkWkD+UwU1sWZrf/MXZ+XSftST3GSOomuRhw/hk=;
  b=eSv5DzEB9gVbWE+Ywos1OXRlx26Oq4NS4pxzCnQQwkjb3A9zW0HcM2Lx
   sxaIlKUl/CISPXuYtIflx+Su9PZNgLuEXW96FVggRaTFiGpQ84m1/9qkU
   TXDpqsGg7zhR+n15wVGUQnH78IoS/qRAmloxrjOtFGhgoy2ZAE7GLdS+f
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QNLwAyyZzbgymAIzuct5xh6d6+1WEsT+mGzfLzuZVZjoxgi6DPkA0HMv6Lmuzba0+cdhwufqFT
 kiK7XSkJnGGDE9FejV3KGY/QNS3hMDoYAQCSXW8uWjr8S6sq+/A4J5m8cdMapFOfFPZi7BZiGk
 hwV9DE/93Q4PUI3TWAjefhxvbcL90ipuMxt+tT2cKE0m8OLjUF6XLxoPQ7++izr1gt+GQ9YYtR
 XgfFECaQJZ+BoUD/u4PJH3PWpFh7/HkdOZjm+zV4YZ+RJIk4KB38RxkjiOQri4bkHfCk1xdxXz
 XhdxTusULy6ukwrA3442AKc3
X-SBRS: 5.1
X-MesageID: 54365829
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QJ1BnqKeh6mu+k6wFE+RyJMlxSXFcZb7ZxGr2PjKsXjdYENS0zIFz
 WsaWDyOPPuOamX2etFxa4y38U4FucKDyd4wTwZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM6wLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2F2Mkh9
 NFPuaWSdgs3Ip/HyectWRhHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gps3Z4TTayPD
 yYfQSJ0TRfkQxJdAGseFYs6gtWqtiP8cjIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wv
 H/d4yHnBxQyMN2E1SHD9WqhgOPCg2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGpKw/5AqhQ9/7UhCQpH+CtwQbHd1KHIUS7QiRyqvZ/kCBAWkeTzNbQNgnssYsQnotz
 FDht83oHzF0sPuWVHeU7J+QrDW7Iy9TKnUNDQcPRBEJ5NTLq4gpghXCCN1kFcadgtDwGBnxx
 S6Ltyk0g7gPjc8N2L6/9FqBiDWpzrDMRxQw7x/aXUqk6B14f4+vY4G06Vnd4u1EJYzfRV6E1
 FAfh9KX8OcVSJ2AigSKWKAJHaq1/LCBMTvVm1kpGIMunxyq/3OgZpxB+zFWK0JgM8JCcjjsC
 GfIpQ5f7ZlUemC2ZKV6Z4awDcUC3ankFNL1EPvTa7JzjoNZLVHduns0PAjJgj6rwBNEfbwD1
 YmzfYG1XUoeC6he7gW6Wfsv2u4o9io/2jaGLXzk9ChLwYZydVbMF+xcagDTP7xmhE+XiF6Kq
 IcEbqNm3z0aCbenM3eNqeb/OHhXdSBTOHzglyBAmgdvyCJdEWc9Arf6xbo7cuSJdIwEy7+Vo
 hlRtqJeoWcTZEEryy3RMRiPi5u1BP6TSE7X2gR2YT6VN4ALO9rH0UvmX8JfkUMbGAlf8BKJZ
 6NdJ5Xo7gtzpsTvpG1GMMiVQH1KXxW3nwOeVxeYjMwEV8c4HWTho4a8FiO2rXVmJnfn5KMW/
 uz7viuGEMVreuiXJJuPAB5Z5wjq5iZ1dSMbdxagH+S/j221oNYzdH2g0aZtSyzOQD2arganO
 8+tKU5wjcHGopMv8cmPgqaBroyzFPB5EFYcFG7ehYta/wGAloZ66YMfAuuOYx7HU2b4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LynUx9RLu41M2qRd5Vm8V
 HWQ94QIIr6OIs7kTgIcfVJ3cuSZ2PgIsTDO9vBpcl7i7Sp68ePfA0VfNhWBkgJHK75xPN93y
 OstopdOuQe+lgArIpCNiSUNrzaAKXkJUqMGsJAGAdC01lp3mw8aOZGFU334+pCCbdlII3IGG
 D7MifqQnalYy2rDb2E3SSrH091CiMlcoxtN1lIDeQiEw4KXmv8t0RRN2j0rVQAJnA5f2ud+N
 2U3ZU14IaKCo2VhiMRZBj3+HghAAFuS+1DryktPn2rcFhH6WmvIJWw7GOCM4EFGrD4MImkFp
 OmVmDT/TDLnXMDtxS9jC0dqpsvqQcF16gCfytusGN6IHsVibDfo6kN0ibHkd/cz7RsNuXD6
IronPort-HdrOrdr: A9a23:lXqL9aFMnEKK2PiVpLqFeJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pas854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1EtTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqZmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87ysIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXoHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1nackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMG9yV0qp/FWH/ebcG0jaRny9Mww/U42uonZrdUlCvgglLJd1pAZGyHo/I6M0rt
 gsfJ4Y0o2mdfVmGJ6VMt1xN/dfOla9My4kD1jiVWgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,290,1624334400"; 
   d="scan'208";a="54365829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqMeOQB+cqMavrUM5tpTckMMB6QUjZeNOnExttexzZBL78se/cKUAFRDp3syH+ueEmJh2PXhhw5gCbUGoUEn/7pYACTltXxMcRklYKH6uO5nXV9l0aGKi4/9GeqUGQSyahgfxzUFowJ3WmL/yrjFcpmOrAW33OFPi95smNSGdtkx2TbUlIQz4LhMDpEe2MsD2X4BsTUeGEWBdzdoSW9EUs7KT36/s8JsYwmJW487oECNFXaAiAZV7VxK1p21vNohJHrq9RjqfEKF21lN8sdwPt/PQ+0bY+m2z5Mp3Jfml9CHcBONoZRh0i67KOdrIOad4JAT3kzsI/GarsFNN8I3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=N5dRS7s+ZDTghHB0p4T10LOuo63+vSRBRWP1ItYIYfc=;
 b=OmjaZO1+RnuxnY5Sjkmzvtm5og+aYyoCgLAPfvM7KFR7h2sJLg0V0UokQh0EyFJA95mZPs/Ln6BxFuHwlDP2gZIdJOYHTdHsOx5uTYdENhFZdQeJc9MwXEuB/74Lee0UdlEfWs/Qs/7YqjfjQrHBZLfGhXLF3UwbC3Juq+cAeaa4yYJtQ+8NAu8cIyzZ9IUyVPrzzfh/ed16oMciIAm5yIfq+uZr52ux3aAnV+OhSjIJxygDho4su8T7WHHN0zoPem2nrOZK/qc2GJ35hTlVG/mspTjw8jx+YnmTv5k4XeUIR/W4ViUsRry4ySQ9rkZxDJi+mcAiXFsl2Ey++lwu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5dRS7s+ZDTghHB0p4T10LOuo63+vSRBRWP1ItYIYfc=;
 b=sKSDnqm1MNv25JIruakIijszWp82uk3NqXoQEsgfrtgzHuXG21JDx3b0X4ciFIO799fPBImuGH0wcqteMATnqdGHQ7kZO6qkqhDIrVIdVJg3mEtZKkNyyRh2sko22/nQd7cprWFxnJN0waF+ulxC00pLcgfVDAVvd/KVb9lZz00=
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Wei Liu
	<wl@xen.org>
CC: "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
	<xen-devel@lists.xenproject.org>, Stratos Mailing List
	<stratos-dev@op-lists.linaro.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Doug Goldstein <cardoe@cardoe.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
References: <87lf40vay1.fsf@linaro.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Is it time to start implementing Xen bindings for rust-vmm?
Message-ID: <abfa4f44-8c56-af3f-485e-41b58e790d92@citrix.com>
Date: Mon, 13 Sep 2021 16:32:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87lf40vay1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0397.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c223f48a-63b7-4f27-be8f-08d976cbc16b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5032:
X-Microsoft-Antispam-PRVS: <BY5PR03MB50327E83ABF13F4F06E078FABAD99@BY5PR03MB5032.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A4WDFE6nyM/kz5QiKjXxfIr+MKFwvJ3gtXBIEl59bEaUiUYz72IZQ2hsszSPWKxGtR0kihD5pmbgI2Vj4ggcfQ0P1JB96gqLE7uuptZkdor4seyaAWn+DetniHPin/00b0qrNF0sVfGwVC0pB0G5ymKtJAskhruLQhkRFXP/1Zwx5RFeLMpEqYv7R0inL9El8dpGokE3O4G9mK1ohgD7OnKSdKaGcMH+H6wJx19Ww8zbZJYWYYSqw0TSlYHI5l4Aqyt9/54iiWybI8Si5C327+TK5BOHWfGX0oUP6Pwn6xIKVgDCbdv6mgojPIR0j2NNCsEe4Q9QN6lpza0NfNyK8GsZKvo9gWMZr1i6pqdCmY65Hr+AWeH39ORvJGRkCLjEKqhrdgI8FXFBCQ9fd50AlTX0osV9MWqnnc4ayFI6GCbNE7rMISQ5qCcboEbBc9R+i5aVwiJXBl1AfO4LZ0I6CbwGW8b2a8eWsdm9jokfYcSPQPcUL4FVHcX6Kf+SXBhSwE3ft+3kHkLAZrf+RzsIf8jaUqLpnt4oPkL7rt7QA529c7uyP4MFPeToSnL1LX48Mvews13Q2UUgqLunbq6Sa/80jQ8YKjCQEUOKe61b4g3DB+NHrptssGClF0SGOesqLyr56eichmj1DZLdm/41yYWEKXdZbKZYQAMAMdodwzZiMhtL30KajIuo3ImnTQ+4L5XydAr0VZN3be64pYkt4hGZGUqm4DTqdSwJJDQRLr+d47NoVGQ/BFEIv/lxEUJHpnNgPakkwusHusBDy9zZyOHxNKNFZnnGJMSCkXA3r+aBb5Vt8BOLdLkAYMDeJ62D
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(6666004)(186003)(316002)(66476007)(16576012)(8676002)(53546011)(66946007)(110136005)(26005)(4326008)(66556008)(2906002)(55236004)(54906003)(478600001)(2616005)(66574015)(36756003)(5660300002)(6486002)(966005)(31686004)(956004)(31696002)(8936002)(86362001)(38100700002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emlOUEc0WVdhaG9UcWNIL3ZBei9sU0RtdnNaSENlZERvaHJjTzJNbUlkZTc1?=
 =?utf-8?B?ZVNJQWU4RnpJVER4Ykt6eWI5YXlMdWdCbGVzUU5iVWkvUzl3bWJURjk2UGxy?=
 =?utf-8?B?TFhHSWx6QkJ2My91R2k4dk5pcUNoZ3lZWUhhOEZua0pWVWE2WVVXd2NTVHNJ?=
 =?utf-8?B?Uk1UUmtadU9sUUNWUHcxK2hnR2RJU0xYekVwVjFxSDZSNGVJY1BpLzdQUEd3?=
 =?utf-8?B?cTlwQ2t3Vms1bUljaU1sNE84bXU5SjNoU0ZSUHZzSUtMR3lxZmRGSHdaVGZr?=
 =?utf-8?B?UTBKdzVPOWlWVkxqWXQ1U0ZyK1NneDB5aVZsNks1YnlIYXdVTkRvUGQ5My92?=
 =?utf-8?B?eXhNVklxRElXeHhUb3ZVQ2NTY0xOUWF4RTNsUkJpYWhJdW5Da3U1RXl6ZUJN?=
 =?utf-8?B?bnh2MUYwbWp6TFpIQkE2MVc2SVA3b2txN09YMkwwMXdreUN5T1lNOWcrS0ZK?=
 =?utf-8?B?Y3E2TU5jdzZ4czNza3Vhb05OTVFxVVdKdERyOUc2ZzJhM0lpeG1XRi9YaWh1?=
 =?utf-8?B?dTU2VFhjSi9xT0NWMUthYk5rMTlPeHZtQkR4VzVCZmpSVlBqblJLZGN3MUpC?=
 =?utf-8?B?YjV4RjVqamwzdnY2cCtwQVFxS2c0L2k3eTJBSnczTFJjSnNjWFh0YnFYaFNT?=
 =?utf-8?B?d3lHSmY3ditwWDFQcXdXNHV2S2R5NDRVMklrMjBncjRHazBhVXJuVWVGVGNX?=
 =?utf-8?B?QjNmbGR1allZVEFFUUFvWlB6akgyOWVmOFRud2lJQk9VeWZWbE0wVUMxTnYw?=
 =?utf-8?B?OHEwQXBEdzB1Snh6QnRuWG5Rc3VwaTF1Q3ZTc09SM2pUbS9MdFJYU3o2cWVT?=
 =?utf-8?B?QkpYb0w2Zmc1WjR2S2VyY0FEckhYZFU5cVVSNXhMNEEwMWJkcDlQWUh3bHBx?=
 =?utf-8?B?UUwvVGZ5cVN3cnpiajFUUTQ3SmRWOFV3YWdVRDRna2FoQzN4blZMN0xFK2Ni?=
 =?utf-8?B?ZkpyM0lnWjFaS29TREd1WWV3VVV1bmtRdWR0SkhkUzlHSnB4RG01b0xHbzlB?=
 =?utf-8?B?cDViMzQvOFdyN3JINGlScm55dkhwVkoyOWt3UUtnRGVQTXB4NW8vdEFQOVg1?=
 =?utf-8?B?bTFIZUp4OGtuY01TOTRFcHZzL0VaZ3g2Y0h4Snc3eUhJODNXa2xjN0Q3dW1z?=
 =?utf-8?B?dVpaZGtybjJXQlZ6RXQ2VHh2UERLSU84SE9TL1JSRk0rTzhFSnNXbGMxdGFU?=
 =?utf-8?B?MUd1TTZ4WVRCb0VYTjdzK3VRQnllelcwam02TUpLYlovV3dlNVJsd2xHeUto?=
 =?utf-8?B?N3hRZXZjTzZZa2NDV25Na3o0Ukljb1duTDRwUFlkTDBPN0VxRVBES0o0WDZk?=
 =?utf-8?B?dFc3RzRRR2k4cWcrUndMa2FuZ0NCanp2N3hvQmowR04xRWh0ZzdTTDhqT2lC?=
 =?utf-8?B?NmtkMDRXRmFueXFWbU1scHdjTVJBd2dRbG9KTHpiNnhFc0UzTndPdE1SUWt6?=
 =?utf-8?B?WnN3ZExGYUNqc2s3ZUxxK2FGZ1RDb0x0ejVTZG1vT0NqRk9ZQnNkUm02TUFx?=
 =?utf-8?B?TGNJdG9rSU9odld1OGpDeTNETFVCdTJhVUg2VkNYbFFJTWY1WWEzbDdRTG9m?=
 =?utf-8?B?L09MeDZTcDBvc203WU83djVzVkE5ekZndmtyZ1FTZUF4NGNpYWh6eVFHM1dm?=
 =?utf-8?B?YjVrc3hvMk1zWitOdW42Z3oxU1FEeUlzd3N0NXZ5K0Q5K3FnRWh6Mmt0bmp0?=
 =?utf-8?B?am1NbFRNUTRzYjB3S3ZFaENxRE1HekM4alIzSFVGTVZaR2g4VHl6c0JIaFAv?=
 =?utf-8?Q?yTzZ1txD0NL3a1Ok+sbVfTKi7rQYZFhsIhXLsan?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c223f48a-63b7-4f27-be8f-08d976cbc16b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 15:32:54.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJakhdMhqCWRxujejKlKx/Mbb53G0saHrh08YSXqh+dgLCXk+wW/YQtX0Uyu9zUqi8hLK6SFEzNHg6cEQaU2X+Z6ZnN7qFpukbCWi72DRAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5032
X-OriginatorOrg: citrix.com

On 13/09/2021 13:44, Alex Benn=C3=A9e wrote:
> Hi,
>
> As we consider the next cycle for Project Stratos I would like to make
> some more progress on hypervisor agnosticism for our virtio backends.
> While we have implemented a number of virtio vhost-user backends using C
> we've rapidly switched to using rust-vmm based ones for virtio-i2c,
> virtio-rng and virtio-gpio. Given the interest in Rust for implementing
> backends does it make sense to do some enabling work in rust-vmm to
> support Xen?
>
> There are two chunks of work I can think of:
>
>   1. Enough of libxl/hypervisor interface to implement an IOREQ end point=
.

No libxl here at all.

As of Xen 4.15, there are enough stable interfaces to implement simple
IOERQ servers.

https://github.com/xapi-project/varstored/commit/fde707c59f7a189e1d4e97c1a4=
ee1a2d0c378ad1
was the commit where I removed the final unstable interface from
varstored (terrible name) which is a dom0 backend for UEFI secure
variable handling.=C2=A0 As such, it also serves as a (not totally simple)
reference of an IOERQ server.


There are a few bits and pieces of rust going on within Xen, and a whole
load of plans.=C2=A0 Also, there is a lot of interest from other downstream=
s
in being able to write Rust backends.

We've got a placeholder xen and xen-sys crates, and placeholder work for
supporting cross-compile as x86 PV and PVH stubdomains.

The want to have a simple IOREQ server compiled either as a dom0
backend, or as a PV or PVH stubdomains influences some of the design
decisions early on, but they're all no-brainers for the longevity of the
work.

I started work on trying to reimplement varstored entirely in Rust as a
hackathon project, although ran out of time trying to make hypercall
buffers work (there is a bug with Box and non-global allocators causing
rustc to hit an assert().=C2=A0 In the short term, we'll have to implement
hypercall buffers in a slightly more irritating way).

Furthermore, stick to the stable hypercalls only.=C2=A0 Xen's C libraries a=
re
disaster for cross-version compatibility, and you absolutely do not want
to recompile your rust program just to run it against a different
version of the hypervisor.=C2=A0 The plan is to start with simple IOREQ
servers, which are on fully stable interfaces, then stabilise further
hypercalls as necessary to expand functionality.

It's high time the Xen Rust working group (which has been talked about
for several years now) actually forms...

~Andrew


