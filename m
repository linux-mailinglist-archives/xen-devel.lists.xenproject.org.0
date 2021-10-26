Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5941B43AD88
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 09:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216278.375823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfHEZ-0000ll-Vb; Tue, 26 Oct 2021 07:50:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216278.375823; Tue, 26 Oct 2021 07:50:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfHEZ-0000j7-SK; Tue, 26 Oct 2021 07:50:59 +0000
Received: by outflank-mailman (input) for mailman id 216278;
 Tue, 26 Oct 2021 07:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d0pl=PO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mfHEY-0000j1-Dy
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 07:50:58 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a679813-00f5-4fc6-b57b-1c35dc6b8f64;
 Tue, 26 Oct 2021 07:50:56 +0000 (UTC)
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
X-Inumbo-ID: 2a679813-00f5-4fc6-b57b-1c35dc6b8f64
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635234656;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XMRXnqP50uBsedac2gcVUwVfr+OkQhXNUwC+ZKzBG2k=;
  b=AtCmoQEa3lsfxB+/0uv3hiNoMQMSaxJaj6Gf4a2AGyI1EOZ0QKKrbh7N
   N/zA0/Wh9q3xLNiYOOeWQrLlopv2UvNNYriDWfHdbrzEziGR4PYe96Xx6
   kTgomTJSYqoU5kH7nT1MHnfERrHj6rQJNpcoCFFKfVbQe8Zi34oI4ZZ9V
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WLYFi2Y4xNYx/oAemPMAM1t8EbxW5+y7Ol7bl8p6Mkc+1r69GEnc0pREjv2d2UenPWI7/+v7po
 xUqwfVrilSefHw9Rc+Tnmgix2AbSenEBJ12KxXru4bCptFvtpa4QHgaLjrLsg4F6Bc4V5/+EOY
 /TbiVV4evJlsfw8LiylnUuowESo1CxrNHkEocBdjakY8qoaL+bG0SNd3mdppJN09w7Ke0Ng1Hv
 6qohqUt340xc6UDl+i4QztXoLmosRENZ1RmZbYs6y+zxnoeIB54o+1HjggaleID7aEhT5YPN01
 /R3eksUus3KW4FptII1asyxr
X-SBRS: 5.1
X-MesageID: 56078497
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G3Jb8a3pn/ZNVnXBhfbD5et3kn2cJEfYwER7XKvMYLTBsI5bp2dTz
 jFOUWqCbKqCYGemeNpzboWy9RwB7MfVyoBkTlQ5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhjpNez
 IR0npqMQCQYZ4fmhb8jSSB1DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIEAg2ds158m8fD2a
 MgjZGZldUn6PRhCEVkWFZxhsfyuiSyqG9FfgA3M/vdmi4TJ9yR73aLxKtPTdpqPTN9Mg0eDj
 mvc+iLyBRRyHN6VxCeB83msrvTShi69U4UXfJWR7OJnhWq212MaCRAIfVajqPz/gUm7M/paK
 kcU8y5oqrIg+UiDR8P4GRa/pRasuRoRWMFZFeEg3wiLxrDJ+AaSBmUCTTlpZcQvsYk9QjlC/
 kWAn87tQydutrKVYXuH8/GfqjbaESoIKW4PYwcUQA1D5MPsyKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarT1VnBjyj2/sCRZgEw7wTTGGmi62tReomhYIC57EnB2vxJJo2ZU1qps
 WANno6V6+VmJZaJmS+WSeMBBoa19u2FOz3Rh11oN5Q5/jHr8HmmFahL+y13LkptNscCeBfqb
 VXVtAcX44VcVEZGdocuPdj3UZ5zi/G9S5K1DZg4c+aifLBgNyCDrRhFY3KZ/FG0umIxyp8lA
 LqEJJPE4WkhNYxryz+/RuE42LAtxzwjyW67ea0X3yhLwpLFOybLEeZt3E+mK7ljtvvd8Vq9H
 8N3bpPSk31ivPvCjj47GGL5BWsBKmQnHtjIoshTe//rzuFOSTx5VaG5LV/MfeVYc0VpegXgo
 i7VtqxwkgOXaZj7xeKiMSgLVV8XdcwjxU/XxAR1VbpS51AtYJy08IAUfIYtcL8s+YRLlKAvE
 qBVK5zRU6QeG1wrHgjxirGm9ORfmOmD31rSb0JJnhBmJ/aMuDAlCve7J1CypUHi/wK8tNcko
 q3I6+8oacFreuiWN+6PMKjH5wro5RA1wbsuN2OVcog7UBi9q+BCdn2u5sLb1ulRcH0vMBPBj
 F3IafrZzMGQy7IIHC7h3/DY897ySLsgRSK33QDztN6LCMUTxUL6qadoW+eUZzHNEmTy/aSpf
 +JOyP/gdvYAmT53X0BUSt6HFIoyuInioaF01ANhECmZZlinEOo4cHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBmo7iFA47faA15ZOAOBiXIBIeItYp8l2
 +oopOUf9xe71kgxKt+Dgy0NrzaMI3UMXr8JrJYfBIO32AMnxksbOc7XCzPs4YHJYNJJaxF4L
 jiRjavEprJd2kudLCZjSSmThbJQ3M1ctgpLwVkOI0WytuDE3vJnjgdM9TkXTxhOykkV2exEJ
 WU2ZVZ+Ir+D/mk0iZEbDXysAQxIGDaQ5lf1lwkSjGTcQkSlCj7NIWk6Nbrf9UwV6TsBLD1S/
 bXew2f5Szf6Osr223JqC0JirvXiS/139xHDx5/7T5jUQcFibGq3mLKqaEoJtwDjUJE4i0Dwr
 OV3+Pp9NP/gPikKrqxnU4SX2Nz8kvxfyLCulR25wJ40IA==
IronPort-HdrOrdr: A9a23:39iHaKGa/mjUObWLpLqFDJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcV2/hrAV7GZmfbUQSTXeNfBOfZsljd8mjFh5NgPM
 RbAtZD4b/LfCFHZK/BiWHSebZQo6j3zEnrv5an854Ed3AUV0gK1XYeNu/0KDwTeOEQbqBJaK
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfKla9CC4kY1jiaWgOKsk8SgfwQtjMkfII2N0=
X-IronPort-AV: E=Sophos;i="5.87,182,1631592000"; 
   d="scan'208";a="56078497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvAQvCo8FlZimrMz/X1h11h9a6xN9dEljc5UwChqNglUgAWbV+nYc/7CFs8oi57RB9TZY1Rvo7q7LunjXQKOLjI5ecBvm11wK0pG5K95Wz2p/Q/x2WVJZlxTEXeu51a1XQTZ9o2nmJP4PXHLitTofK+DDr8782QVuJ5CA5b/i/lndP3ssEHvz4fnQLBp+cclUYnBw+el7C1wc1ptIX9yK03Uib5NoakWobeLLTCN4aCnnw12tRgqWQBvEio0FVOkGUhgmaCqIwak4vP4EPy7MTjEhrYxIoKT0szmr9nlU9h988Z6dNZUZrc3BAZrjzeU45RCpOEskoox2yO9vuucaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHC3fXAxMyexqu0p8bQKtwUW1tQhHhpEtL6dn1Etdos=;
 b=ZLPQ5V4rtJqFtV9JJdZmpk78sacmfvJAs514hNj+WVSVXOuWEpKwKaudM844na2J+Bn7Wry7xxmUzf95sjgCL5xsAftCvzu+UlfyJdTGSW7tmasoyXrqQaV4Hm3atB4WHkPYMivwGg/Rd8p7mHDvNQtQGjhMmovBgmmGniDGIG7mLJHyuqxyHCJtGpnEq4uRI35GCTnyfwYR3H7ElUkk6mvCN5zQSL8doTe7vHK8T17oLDdyc/7MEOL14JUlwsiP5rEC3Cy7Wcb3DbKNxJdwtDxY9rYE9N5z/tTe+oERvYbMjkWMx3J/X4p3VHIt3+FJ1tr7mu3uQAPvBPXyhP5sew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHC3fXAxMyexqu0p8bQKtwUW1tQhHhpEtL6dn1Etdos=;
 b=vYGyT4r4vkr3FFznOHunB87FFK4YWe/2ArsGG3swA8IbCIzNtZbjs3cD/ks5eev5XzdS81bgkILNblh7dudpjsEYxZeFGGEthsCHW7ZdVgAsKKgH0QOyqLUJPgZYjuTDWHP6y+vWJBPTGjG8zGxKggJC+8QLgJKlTi9mbxJPEJc=
Date: Tue, 26 Oct 2021 09:50:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Michal Orzel <michal.orzel@arm.com>
Subject: Re: [PATCH v3 05/11] vpci/header: Implement guest BAR register
 handlers
Message-ID: <YXezVjnA0E+iV1rI@MacBook-Air-de-Roger.local>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-6-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930075223.860329-6-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd5d7e8a-c332-404d-8e81-08d9985555a0
X-MS-TrafficTypeDiagnostic: DM6PR03MB3577:
X-Microsoft-Antispam-PRVS: <DM6PR03MB35774C8B9A15E7C8C6E71B428F849@DM6PR03MB3577.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzeoxsTW3Wb/VQkzNOKqE37oYjPEQpz41/Ldxw9k700pSkkK09nnJZGw/bRs/sZ6ku26AxIxZ7YQRRnwhuRd0sz38nX9onSUTL8UtDtPfjYULsvYEP5m0hsWqZQUZ5Tj94o6On4Eqp5wSSJfPj48YraKI7WiMjWpVhHavUgsA5E1I/41mDMFzAQ03c72jPwYUBrg7tVMKhmUyArYme54a8qEi6Pdehy7KFvfhIz1r1LTRP8+tuXXPlkLWwKAVK5lzqVBSTKE0zzHjIp04dHUeBmRbzJ6bYzMZCc2Fws278R6aayNnKeYTRTGhKfVZ2ckF25rqDdV3GL7XoKKUJn1z0ylBuEXEGhw5NRT6BlFD8re+7HLdNLYifpKogxMn7TVnDXKNQsFbF77Vl7DlY6N6iGJeF2wNIL0UKL7TFdvtzWLgW/QrgY9OoaM6L2aTHW0wmE6Ji5xf+EgY7yNjslEp2ZG7agm8BzP/3v3Y2J8acofHenyWD4Eb6LMFS8VnnYEfTkDHfEAcZ3W4V1KhOaLAv8F4a9g2iGfdq2S9rjn4jUllqF3T1PllL91dT/YQyZnbd1lQr4Dz57oX8E0f7YucQPrEFdQ+lX0+i6++9UnLo70Kgp9K/mMnRCb9zryr8zJwOi917b+Q7KO5V/hOQySfjfDqjDQlM+gq3jcHQHwJDUAjTKAhG1opBjwHHHx23brUDFiyub7aarKcNYI15wvMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(6916009)(4326008)(5660300002)(2906002)(82960400001)(38100700002)(66476007)(66946007)(316002)(7416002)(66556008)(54906003)(956004)(86362001)(6666004)(26005)(85182001)(186003)(8676002)(9686003)(508600001)(6486002)(83380400001)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVZY2FKQXhBeS9MOEN2V3h0ZmRvUmJ2cUsvdEpmVGoxWU8rWHFreDFvWkI1?=
 =?utf-8?B?cE1kdmNnajZGc01STGcyY0ZKaVlPYmJlU1dEaHowYmhLTEVWV1drU3JCQ3dr?=
 =?utf-8?B?WXZNNUZ6TEdJSlY1Tlo5RGJsZDQvZzFkbGdxdFQyZ3hIOTlhUzEzalZKUkVZ?=
 =?utf-8?B?V1F5U2pqZTNEcjR3Zit1aDB4TnlrSldacUVxM1krTmRrU2VPY1Qya2d2c2F3?=
 =?utf-8?B?REF5MGswdjF4ZXhmREN2UUxlKzd4T3Rndjc5a08zMTdqYlNjbm5GVmozZ3lt?=
 =?utf-8?B?OWR6ZS9EcXJTOHY3cXBGWkJXSlZQUWorWnhNZzVtcnpVdi9MbStoK2h6TDFJ?=
 =?utf-8?B?SlRZRHp0K1BQeFpmdHBxbnFZTEdGT2pISHRHSHlaWDN6TFJMZ1JIa3psL0pv?=
 =?utf-8?B?RFRpQU50ZVgzazZqMmo2eVFUMjBnWkVVOGhjMFgyYTZhaiszMnArL091Rk1v?=
 =?utf-8?B?aC8vakZVWnUrQ0NMTE4vSVJUdFlNK0FHdlFGRjZLeFNuRnJadkErRWRLV1FB?=
 =?utf-8?B?RjkyQitNV2NhdmF0Wkw0NksxSXBsRUhEeVV2Y0NFbzl3V0pMSDljeXRHWG1H?=
 =?utf-8?B?dXlOVm5nYTZGMUgzZ09xeHFrcWlUNWJZUjREcDBza3hjK3lPanFEYm1kY3U5?=
 =?utf-8?B?Y3JXZS8rVWhXZzBTUmNud3lUR0swODZhYmlIdExRQTQwWUVsTjJkeEFuUnA2?=
 =?utf-8?B?YnlpcFdHYWFRVWphbko2TG1BeDJCY09oSzZVNk5raWhNcTRUSmdkUlBiVmxP?=
 =?utf-8?B?QTlMRHpPZmg5QXM3cWlyZnRhdUJ5QVhJSEgzZHpRamgyZUw1MFI1ZTJqMjVM?=
 =?utf-8?B?RlVCdnpDM25VanlJNnJkMXcrdkNDbmNSN1JtN3lrdksxZ21wVUJad3VQS01i?=
 =?utf-8?B?UE5xejduc3hkZy8zYTNIZzdFRGRrOEFnOWV3THQ3WlJzRXB5M3d0WllRNkpo?=
 =?utf-8?B?VnljWmhrZ1dBWDBKYVhRYWJ4RHdPSEU5RXRTMXdzbE9DYWNTaUxDT1FYeHRt?=
 =?utf-8?B?ZkpOR3BweVFJdU9lMHV1N1NuT2JjZ29CTGRmR1BxTjZRV1VyeXIwSUEzeDJx?=
 =?utf-8?B?S05qQUZmSElBclVXWjlaZlRNVTd2WnduYmd0dEtSNTF4RnNNS3l5RmxIRWRm?=
 =?utf-8?B?T1AySEZBUTFVbGd4eHhlbnlxd3NPL29FRlEvTGJUQzl6YmVlMFNlOStReTRt?=
 =?utf-8?B?VFNkNXJlaVk4aVVjMWZwanVmTml6Y2o1TFoyU29SL2xQcGZoUk5OR1ZTQWxX?=
 =?utf-8?B?ZEdybWhwRDNXZER2bGEwVXN0bHFmNGtkYXpsN3ZjSUhZYm15U3Zma0UwbDVn?=
 =?utf-8?B?bDRvOUdLbDVVdmRmR2E1eXladC9NbW5BV0d3T25MaU4yTnhlZ3hWeFk1c0xW?=
 =?utf-8?B?T2phL3pGRUFLQk52cXZ5MHhrbmtTcnNiUDcvd3Q1eHJIVzdxTjA0KzA0bndt?=
 =?utf-8?B?YzVkRmFIY0RNbmgwTENKbjQ1WU1TQVlDZjdoSDVNRkJYa3JabGRoUzk3VURB?=
 =?utf-8?B?dkNHYnROVzJqcStIZktzYTdEM3pkQkF3ZXRIQjN2SUNqM2o1ZW9rd3g2SFlM?=
 =?utf-8?B?ZWZVWTZpeXBjRkZVdWFtekQzSE1xcklIWU45U2JNbUpDTzBFVWhQMnJSdzdU?=
 =?utf-8?B?MDBObm0wa3cyVzBXN3dKM1BTcWU0QUllYlZsejFSRzJaSVFQRnRwd2VVMjRM?=
 =?utf-8?B?Mi9DTHZaTHlINmpObnZubHhTbFlSVmN1Uzd3WW5zYlFsTEJRVFA5TFdKc2o5?=
 =?utf-8?B?ZnhOQXJsR0JCTU4rQVBudDFwR0pWV0N5V3RrSHAzM053YTY3UnFsL1pmQStm?=
 =?utf-8?B?SVcxcXBuL1hBS3VuUG45Snl2U1g3UmhOeVZRaVM1bHRrU3R1UTd2ekZkQVoz?=
 =?utf-8?B?UWNYQVl6akEzTW5uWHZPbmY3cUZJWUtIQnVGeldaRU9GT0VvMk9BRkRKVS9t?=
 =?utf-8?B?OHZxd01oa09KYzNlcVRua2xVWlJvVGNKUjRtcktRZyt0bTBBNEZUYWJEbWpn?=
 =?utf-8?B?a2tKc2R0bHZBaEVveHNIRjA5ak4yeFJyWU94TENXRUJyUURCWW1SZ0dUY2Fk?=
 =?utf-8?B?VGoxTllhQm5PMDl5Z1VhdE1lMnpTczdlS1UzUTVFQ3hKSExBcnd0WGpsZ1N0?=
 =?utf-8?B?aGhrMkVyRnk4M1IwTTlySXpqRGU1ckt1Qml6V1hwUE90TmJCR3d1SG9oUE9y?=
 =?utf-8?Q?cMql0QpPZIwwJ0CwcrHsXiM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5d7e8a-c332-404d-8e81-08d9985555a0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 07:50:52.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itwMeqlOtudUDpliWq/geYUMyNknE9qCdD09IJA8t1CZeAqTGQ+N9VgVCtI+oQPlowJ1Rd0yYBwABgfD6Au6tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3577
X-OriginatorOrg: citrix.com

On Thu, Sep 30, 2021 at 10:52:17AM +0300, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> ROM BAR is only handled for the hardware domain and for guest domains
> there is a stub: at the moment PCI expansion ROM is x86 only, so it
> might not be used by other architectures without emulating x86. Other
> use-cases may include using that expansion ROM before Xen boots, hence
> no emulation is needed in Xen itself. Or when a guest wants to use the
> ROM code which seems to be rare.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Since v1:
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>  xen/drivers/vpci/header.c | 30 +++++++++++++++++++++++++++++-
>  xen/include/xen/vpci.h    |  3 +++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index 1ce98795fcca..ec4d215f36ff 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -400,12 +400,38 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>  static void guest_bar_write(const struct pci_dev *pdev, unsigned int reg,
>                              uint32_t val, void *data)
>  {
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +        val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32
> +                                           : PCI_BASE_ADDRESS_MEM_TYPE_64;
> +        val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +    }
> +
> +    bar->guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +    bar->guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    bar->guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;
>  }
>  
>  static uint32_t guest_bar_read(const struct pci_dev *pdev, unsigned int reg,
>                                 void *data)
>  {
> -    return 0xffffffff;
> +    const struct vpci_bar *bar = data;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +        return bar->guest_addr >> 32;
> +
> +    return bar->guest_addr;

I think this is missing a check for whether the BAR is the high part
of a 64bit one? Ie:

struct vpci_bar *bar = data;
bool hi = false;

if ( bar->type == VPCI_BAR_MEM64_HI )
{
    ASSERT(reg > PCI_BASE_ADDRESS_0);
    bar--;
    hi = true;
}

return bar->guest_addr >> (hi ? 32 : 0);

Or else when accessing the high part of a 64bit BAR you will always
return 0s as it hasn't been setup by guest_bar_write.

Thanks, Roger.

