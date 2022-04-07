Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B19D4F7C2D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300605.512842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOnP-0007Gp-6G; Thu, 07 Apr 2022 09:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300605.512842; Thu, 07 Apr 2022 09:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOnP-0007Eg-2C; Thu, 07 Apr 2022 09:51:19 +0000
Received: by outflank-mailman (input) for mailman id 300605;
 Thu, 07 Apr 2022 09:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncOnN-0007Ea-7h
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:51:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4352da93-b658-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 11:51:15 +0200 (CEST)
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
X-Inumbo-ID: 4352da93-b658-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649325075;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=cYqpbDQqf02GR5KQJXZmp/6iABf7gag6MoT1VAJi9kQ=;
  b=Ajb5I2MFORAOOb5NreiiN6bNPCq8irx9ZMQVGqsoQ2chqvaLowGJEBEq
   fd3XUOrfZt3mZAXUEWMsCGgWAtzHw5XCXuJxE7mahspTetHURJcdawzYO
   9x1vrGJJipz/sN2vOcdI9+N26lBLoN7sCppfaiIzvSM3QWLXMRlfA/MId
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67664722
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AGvxvKqG/qlHj0ADdGl4YkLqeaZeBmIbZRIvgKrLsJaIsI4StFCzt
 garIBmFbK2MZDT9Kd8gPdi2p0kBsZSEm9BrTQpu/3s0QXgaoJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Yyq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBM5Xvl903byZjVGJuDJZB36TrJXelvpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVHN2YwNk6ojxtnNVMFEcowrt+UpFL0KmBT9ECf//Fr/D2GpOB2+Oe0a4eEEjCQfu1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQrUansSc2Z+VrVK4q2TqK7bH45wmDCT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkiXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawdRGp+ZgPc1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpy/5Ld0NsG4hfR4B3iM4ldnBO
 hK7VeR5vsE7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5PRm0oCCrWnCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnkMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:eAXxtKnSe9t61nMGGzY8uQU930/pDfPaimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICO4qTM2ftWjdyRCVxeRZg7cKrAeQfREWmtQtt5
 uIEJIOd+EYb2IK9PoSiTPQe71LoKjlzEnBv5aj854Hd3AMV0gP1XYdNu7NeXcGOTWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7kl6xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklWqvoJBiKp7zPLd
 MeQv01vJ1tABKnhjHizyJSKeWXLzgO9kzseDlDhiSXuwIm7kyRgXFoh/D3pU1wha7Ve6M0md
 gsDZ4Y5I2mNvVmFZ6VJN1xNfdfWVa9Ni4lDgqpUCfa/ec8SjDwl6I=
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="67664722"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8sDRbVsvDwBQ2Tl4YwaCxQkGyDCzdtbIHqplyEdSyo4D7W8Ld94VPvJYdtwowm+klUKQlZb0MuzbROES76iMGVRGHZYjZDus+PHQxR8zyg3HuLWlj1PW9HwrjdLgElZzzdxnJro64W00BMtnQZB4wiYyNWF+EQ1K3xWEIDvuoLmsd5me14vSFWehN5/jIbmkBzKohI8ltELuuLzDhntddmTjHeuphAXgAawv+Hyxi/jaiVlp/Q/bMsfFEnbKPOwwO5mfwX1OzJLhBI0XPbHqtgZR/LjNTobCGkYmMhN8R9MLm/NENmSpjLPnWs/yIF7DpdIqbmUd0ZNAbfN69ikfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COJ4dxymG6NuCRh1xh1Ff+0ACQ+F40iSsjOWKPSgmSo=;
 b=i4292OfXq+938Ou1IoHAAoQDFwINTFljyvH1ndANb5pp7RTM4ER4o1vprvwgSrysnRSFFXlzsfxNi72mMfprSbGK4v64kI7EQEqVm3Lm6tnJJpO3+eMXRr/QT34MWUn6Agu6yHpxzV+cSvkXqDQnGdEHfb1eIIXiePhLLPo1QIYAQe/0CxCe9qtvvPgfNmqfIZkDeFU044dGBVg212YlH1X43loAmZ0cPCPh76GzPpgjesIhF7wfqIz9xJ9cuo5VJcUXigFicnWAJZxcTAZELTVyOedqvj+1efCY6crdu+Bb7B9nD7Rg/7F7XlDtU6jQ+FPPmIJCnc2ZHFxNP39TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COJ4dxymG6NuCRh1xh1Ff+0ACQ+F40iSsjOWKPSgmSo=;
 b=YtggFnEVn6DTx2JzTGtnL1Vv3sST88fiPqHH+6gI9fouz0KwQ4cYxc4pls7RzXD0OMDbwNv45+LX3j6WALR4HmETwOy/Ifvfr1d2S4SU7/FmSCyR5MCdAIY6vnqjqIl8sRBzLGNyum2z1sNIVWTJo16buXMEy89j+oC6OzzKbF4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2] osstest: stop anacron service
Date: Thu,  7 Apr 2022 11:51:04 +0200
Message-ID: <20220407095104.39545-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5617fbc-1d35-4f71-667d-08da187c24a9
X-MS-TrafficTypeDiagnostic: MW5PR03MB6905:EE_
X-Microsoft-Antispam-PRVS: <MW5PR03MB69058021E812BBBC854805678FE69@MW5PR03MB6905.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mf//jhiQJXAnlp8ONOWXLBAWL3r+RGNoJOuSdTV2RVYG6dVnLgJxYC0YfovMpwcJJW4CjkcXXBHrPbOJYg8Abnll+wduZtAMG/cE9LDuf3byg9NbC3F2MRSvoq22tJNkXqV2FNel9GN+o/Bd7lJ2z+8tS3NMawwi5AKrIm5U7RlW8Z6Fm3Lalyp79N5GgauIHRkc5Ciui0hAyNYb8I9IEx6eb/Y3dPXLqcgHvDyMHiwTUXjFaXMjcKplVJnBac5TTIpOBiiDOeTqlrr9LPBXE3fwI+6gDZiDkIj7a6nDvLQcOjQwLAF03ZgN5ZXfQUV2nN1He4MhBp5OCzUEdlBxoBS7oA/9+rUSY20MeP/Erw8gXDgF+kwXonmF2xMRi1XTknFpf3IaoWl5/woRzUJsgQhSF0uzJtpjSKuqM6gdq5w+eAhbwtA1aNi5tZuyBW3/bjjV+P1/PI7wddYtk40evArRyXyxr9JAppdtWYFqaykeYfKGmzt/JvL+UjBjx8DDQfdPBaKX0NAxR0hcRgTdhwmoCBsCwRcg7/i6MkWIw28aYmil5lWmudQ3nzT529KlWsjqg0vMp0hv+t95SCY/anna1V4BEXZOrFUYy/srXB1FaPNdBmL1YNUdmVxb+McwUN2JQgBES+GX68pcT8XwJ18xtkC53PwufXTfb/ONEhMfbixsoVXHdcmuR9DSB2u1f0dSj0OsQQOy5wPC77RRvYUlGmcwuJTK64tazbbRpmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(966005)(6486002)(316002)(66946007)(66476007)(66556008)(36756003)(8936002)(6666004)(4326008)(6506007)(8676002)(83380400001)(26005)(107886003)(186003)(6512007)(2616005)(82960400001)(86362001)(1076003)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRscVhrd0dLZjh2bDIvYXpaWmhqVisrMzhabnNyVmhzRlJzZEh2V21mM3Rs?=
 =?utf-8?B?TUVDUGRBQUNXa3hYSU9TdXlhbloxbGdOMUlNdE02cmFIN05uTCtDN0hpV05u?=
 =?utf-8?B?dE5vNHlXRW44T21FV01BSmt3Tzc1YWV3WlM5dEN2NSsyVU5qd0RnM3N5WG5l?=
 =?utf-8?B?djJQWVZNVWdtbndxb1hHZHA3UDJCTndkZHlGekIxL25OY3c1MzNHWkEzVk5j?=
 =?utf-8?B?cFJHVXFSZ25UTWxBVmN2NWkwdDZLa1g5ZDVwL3Q3MlZqcG0zZFlZWFI2d1hZ?=
 =?utf-8?B?Vll6UmduUTRFMUlNN3RNeHhGd1NNZnoyWEhDSnhiM1owNmhnTmNaV3JTMEJX?=
 =?utf-8?B?KzQzQjQrUHRNK2dPeGRpRm4wVWxrbUR6cmZxZkJYY1NlaitFNFQ2M3pVUEF1?=
 =?utf-8?B?WE5sbXBtZWFiNzRJcEQzWFk1YlkyTElobGNqSllsQTlKb3FjVllEN1p0YUpN?=
 =?utf-8?B?ZXNCZkdRQ1ZCenhpOVpJRXEydGNTa3RDcGhYcTZoZ0VkZnlWWFpMVExmbHZP?=
 =?utf-8?B?VUR3OWhWOVhXby95Y0hSdmwvRHJnS1RnU1h4VDNzS0g2a1AzeFNwQ2dHcFNr?=
 =?utf-8?B?VGwvV2NlNjF5VWhRZ3FESzZCb2QzRFkyWSs0b2ZsNmlwZlVSNzNRd3hyc0hh?=
 =?utf-8?B?TEx2c2pSYW41YzBDajM2dS8xWENvU2pkMUk3dC9hRVNLd2tSSVlSTkhoSlUy?=
 =?utf-8?B?OElTMzA0RWloSzZIWmExclRva1NFV1NUOEw4U3ByS0pQRnRsTWZEdU9uSmJC?=
 =?utf-8?B?SnYxZHFZWlQ1bVQ2eGUxdmYyeDlDdForYlIrNkdsRWt2Y3JWenBaUExRWHNV?=
 =?utf-8?B?a3hiMzRYTWFkVmJJUXN3c1FvQThNVFdEM3RhaFJ0VVpTMmJQcFJTQnM2VjV0?=
 =?utf-8?B?SCtEOEYxV0lsYS9KTmZCcFJrbE1YWktLdE8yai94QnlOQzB4V1IvcXJwTWZI?=
 =?utf-8?B?R1lUM2YydmczR3o3RmphYXlvTGNHZXk3UG85dmtUbFAxUVppZ21MZ2Roang2?=
 =?utf-8?B?TjBCQUlXaFVLTGwzR050MHVQK0JNLzRvRlZmMEJKczdBL1NwWUdUUlBrakd0?=
 =?utf-8?B?ZjF5QjlCa09pWmlMWXg4cXdhMzl1ZFRDVnRuT3dsSlJ6L3crSmNISEN1aTE5?=
 =?utf-8?B?VVA5MlNaZ2hlWVp3THFRYTBtaGtTd0tlK2hzMjhLMTd2T3dxUFFUaTA5R3ZE?=
 =?utf-8?B?VFlsa0ZVT2JwdlpURUx5Y3lPQmFFOUQ5cThZa1VYUXJxZzljdzBSZTljalcx?=
 =?utf-8?B?aCtqV3ZwYmhhamtacHlTZlFGaXVwQ1lHOXdTRjFCMlJ4TnVRZllqbVhWVTBW?=
 =?utf-8?B?czdmT2Y3YjZkYzJIdy9mbmpHdFJQL0pDb2pDcVZGUHRJZkJZOXYvOWpILzQw?=
 =?utf-8?B?OCthR2U1c0luVzJFZkhQcThzWG5rQnFnWkNoZFRmN1JNcG9TNVV6cHpncmJI?=
 =?utf-8?B?RGlvMFZZNEZuYkRPK1NpMVd0ZTdiM2M1ZnhnR29ldHJNTVFZRTdwdkFTOTZO?=
 =?utf-8?B?azRuMXplY21jK2ZLR2IzczhmKytFR1NUdVVYS2wzV0NEOGFQNEJCSUJGS0Mr?=
 =?utf-8?B?OEZxL2VwSlZpaS95WncvN21RS1JoanNFeWVRK2ZiYjZSRFp1TG1FaVBpSUY1?=
 =?utf-8?B?VWs0K2tGNS9ZNStzVU4wNGduWUZxNGwzMDV3a1Y5a3ZKaTlCM1lITklBaGcr?=
 =?utf-8?B?bWFWdVdrSHlDSkZoV3h1N3haQkFRc0ZadU12NG1aem13TDNrZGdKMG03Z2RD?=
 =?utf-8?B?c2NtM0VtbkJOKzVzY1VhV2Rpak9xOTNMZW1DWTFxU1FCYXJoRFFIVUZ0TkJI?=
 =?utf-8?B?cUVVSjZsWXJsWmFaTUJjSzFiOXVGTnpQdUlGcDhwWFgvS1pqaTN0akhJZGpG?=
 =?utf-8?B?c05razdXZnhGK0QxWDlVYVJXSzJIMG50L1JKRkhYMHdzV3EyRUxKNW1TVWFL?=
 =?utf-8?B?TjV3WlZXWlpiazZsWVpoVjlWSDVPZ0tMbVltQ0Jlby9lMjlhK1lXVm5YY0dY?=
 =?utf-8?B?RGhLSmdZU1o1a2RoYnNlNzkvR2dUMVM1c2RxMDJJSytNakJNSDJ6OGQ5NzRj?=
 =?utf-8?B?Z25DR0llb28xd3ZpOEIrb3VQYWdNOHVGeEZybUlBNk82dmVVcEVGbjFFZU1M?=
 =?utf-8?B?NktFMEVMSlBqVWJCYTJVWm93Und6bzJ4Y2dDeVZ4NWlSV2R6UVJPOXk3YU5k?=
 =?utf-8?B?ZWdXN2djWlhkRGlsdVhuTzl3WS9QSEtpRVJQdGphSXFKNE1rRlZzcHpsYi93?=
 =?utf-8?B?TGtnZUJHeUY0RllJdnZHOHNHUnNscUU3UVl0VXFGUThRTnZnczNYRnpQd2JO?=
 =?utf-8?B?N2JTYVJwS0VubUtzaDRrMTFmL2dDSE5TV3ZQVmRuWGt6K1J3NFJ1TEV6dDFa?=
 =?utf-8?Q?V3SWHDDTVF6y83Fw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5617fbc-1d35-4f71-667d-08da187c24a9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:51:11.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0+gdKLmbqNWzHs5Z9S6FDxjarcFMa7vB2ZIBNgd2rcZGz7RgN6k90SZfrhDFhmVscqT9eIMZ4OKyJhuTr6djA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6905
X-OriginatorOrg: citrix.com

Just disabling cron in rc.d is not enough. There's also anacron which
will get invoked during startup, and since apt-compat has a delay of
up to 30min it can be picked up by the leak detector if the test
finishes fast enough:

LEAKED [process 14563 sleep] process: root     14563 14556  0 07:49 ?        00:00:00 sleep 1163
LEAKED [process 14550 /bin/sh] process: root     14550  2264  0 07:49 ?        00:00:00 /bin/sh -c run-parts --report /etc/cron.daily
LEAKED [process 14551 run-parts] process: root     14551 14550  0 07:49 ?        00:00:00 run-parts --report /etc/cron.daily
LEAKED [process 14556 /bin/sh] process: root     14556 14551  0 07:49 ?        00:00:00 /bin/sh /etc/cron.daily/apt-compat

From:

http://logs.test-lab.xenproject.org/osstest/logs/169015

To prevent this disable anacron like it's done for cron.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Don't fail if the service is not present.
---
 Osstest/TestSupport.pm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 8103ea1d..156cac79 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -3151,6 +3151,11 @@ sub host_install_postboot_complete ($) {
     target_core_dump_setup($ho);
     target_cmd_root($ho, "update-rc.d cron disable");
     target_cmd_root($ho, "service cron stop");
+    # Anacron is installed as a dependency for task-laptop which is only
+    # installed on bare metal.  Don't error if the service is not present
+    # or else nested virt setup will fail.
+    target_cmd_root($ho, "update-rc.d anacron disable || true");
+    target_cmd_root($ho, "service anacron stop || true");
     target_cmd_root($ho, "update-rc.d osstest-confirm-booted start 99 2 .");
     target_https_mitm_proxy_setup($ho);
 }
-- 
2.35.1


