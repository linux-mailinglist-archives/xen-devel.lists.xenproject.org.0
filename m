Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC836569A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 12:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113525.216375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnvN-0004uh-SB; Tue, 20 Apr 2021 10:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113525.216375; Tue, 20 Apr 2021 10:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnvN-0004uK-O4; Tue, 20 Apr 2021 10:48:09 +0000
Received: by outflank-mailman (input) for mailman id 113525;
 Tue, 20 Apr 2021 10:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYnvM-0004uF-8q
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 10:48:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 283ed0ad-6e40-453c-bdd5-8dccc43d932d;
 Tue, 20 Apr 2021 10:48:07 +0000 (UTC)
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
X-Inumbo-ID: 283ed0ad-6e40-453c-bdd5-8dccc43d932d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618915686;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KCQxEqnBNB58sxclw3tKgYZHwrzxTPV2N7WrUMvHlWg=;
  b=YCTFKqEYodcOo97isGIqN4PYS6wopuT8KW6Y0n7JfW6wzo5MjxEkdO8o
   kQRs0++W2Ma/k/4r7CZl5cufhSYirvYFBoUSSfV4t01xB43EW1r1AHUJ1
   6Q7N2DEKweRqbmfr4V7rXUJchRlh5qdUW5q0/RbS90CbVLDhK2RPVPuky
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hsx6ey/JqP5MGtoCkb9UdfYcls7yfi2jePRSnlpsj6wjt47siP8OG414rZZ7CMTvwelC22Qn+l
 IE8m/EE6zcUCMeqnBJ4sMh8o+Y451sf+o4m8b2t5UtZebeHKPb35v50xepB8PF1L2Kgxhcbqgv
 PlMTq89PGVtqxta+sCDwtB1ih3sGPeAVMdUf5YqMif3KLlkpzIEvPpYOnH0QRR2oXc7X10vbps
 DtDN071O6B0deRd35ff3yuMl5wQJdxibkwSG8qbyIHdsmcnMNeZkFTELpolvpOnvqWxn1vhSMp
 bjg=
X-SBRS: 5.2
X-MesageID: 41969143
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IToQaKFDnVQoNcDPpLqFWJTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYfNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nFPiTLH8DQuTFupn3j5rgexELHFoK7wOJgDOu5tfBYmWl9z0ZVC5CxqpnzH
 jdn2XCl96emtyY6juZ7W/c6JxKhMDso+EsOOWggtUYQw+c6DqAS59mX9S5zVUIicGprG0nid
 zd5yonVv4Dl0/5WkGQjV/T1xL70DAogkWSuWOwpXf4u8T2SHYbJqN69PtkWyDU4UYho91wuZ
 gjtwny1+s1fGH9tR/w6NTSWxZhmlDcmwtbrccpg2FCSoxbUbdNrOUkjTJoOa0dFyH34p1PKp
 gJMOjg4p9tADenRkGclGxuzNuwZ280DxeLT2MT0/blrQR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIZ5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdQPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMBIbDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEfE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhGU/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+kLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTaRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC90FJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAahjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXDWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxagVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 r4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PYRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4ulHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBdlblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGIBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+kPzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789sN4sAZUBXYlM78nJs4aercJDREhyjc4h4jRCHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI6PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wNSWUgKuJZijcji4Ur0i+9DozPy3hV7Gd20HVAjV7i2o+v/WHBO1pJWDep26lrYQ==
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; 
   d="scan'208";a="41969143"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfypSUCS/6a6slyMzqt8QS/I9kHOl2Amu8RgeJgprrW6ridGwE4E8bjC/cbdTjMxkKYCs0ZWirG4N9AzNR/N+3+hBJrFTsMeUtz4vLrjpPRziNOvQIHTi8Vk8Oo6DSwMFip/8MXKp+MWvbqRHcf/2Q/G+sXK+KD9mpaFuxscyRlfD3ZYiOiyV/R0KnbOKohG3Q4AaTmyziyXiT7QZnUwT/+jWVb2w5DWKGVmDoRd1XvEBUXrFDb3YTuoTM5FjOFUlzrmLbDFKuYxvvanpdo3OTGu7OZf1UVmG2Ornl08o/Wwl9Smi1cN9Ng/opPrqHzECZ8T5izDzYg617Yxn9tWAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSZM1C9NwkA2kYkTZnqODAYhFVafX95CVM/xLgHsC4A=;
 b=Lif2UuP8XRZYqIhboQra7naGtWR3KUP6bqhQ937JleCLF9p4XKTLzmgPQwt7iK/6CZCTPApC8USZr7fjk3iv5CIRKjmgxzCA7mGBI//UALyTWHrZ4ofGFInqb/Z+s4DsW/FV+flD+bP5DBQU+0MdWc68C2XrwKkIhqVcLTKAjbWPcfUXWwra18J+n2WnfrboByE3gRnG5NVnuvAXI8Z4XzDYwHjyhEXrzLnthTvELBnNwjRO/S3OfXlPf1TkSM0gaecdIWfSJKWcNY1uz0hTT+GgCeDUciRVhsQUeJWv25kn7WGv110mcEm7/UFrj5xjaL++qj8y33GfNa4tLc6EfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSZM1C9NwkA2kYkTZnqODAYhFVafX95CVM/xLgHsC4A=;
 b=KJXI6pqvnKGrVvF/YiaQWMU1grBUu1j//13GBGeLyHV7VZNV30+KzL4lfpIKyZdr72sT2gyJleZ6ZjjTXrQEsR3oEJeAvIKyGlZSqLyRRTE7mBgVHqI0ic6BMGN7daeVnu2nSEPP08Umh2AGzJg7cTxdtrbKP7AXDBd8wzqYi2E=
Date: Tue, 20 Apr 2021 12:47:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] x86/cpuid: support LFENCE always serializing
 CPUID bit
Message-ID: <YH6xXeYVTEKsswQp@Air-de-Roger>
References: <20210415144731.3356-1-roger.pau@citrix.com>
 <20210415144731.3356-3-roger.pau@citrix.com>
 <1bcda034-b08d-ec06-05fa-2d0f5cb26339@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bcda034-b08d-ec06-05fa-2d0f5cb26339@suse.com>
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aef37349-0fe7-47d4-cee4-08d903e9c600
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56086B6402F6ECBA2C74651B8F489@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7u5QsCvrnPLV6jmSB8aygfAqBG69ZukjRSbK4eLsWUBj7y398oMBc+VKuCJAVXC0XSDpOH7HVCbNPpBPQadr7ryKqOhltSwYEE7qT0CnyecHEe77ObfDVZNIW6gx9egBaUPdWyygYkSLuD9NmHvleJl2F0ktCQpIVU9FjuxvBEYhKga3TSRF7B3twhbSoVHUWkHJvLs3LubtOcX1CEbJSV1xrYJ5s31i3UiMydoxfT1xRRkzoMvGqSA59rOzco+Eg0nWITtIWqDap0mTBQpqqeP89D0ll0sAJ675HaEKtq8Gyc7hgUgZiDc57UBRAQ4qQ6J2vnL4NLUtbqYWGI3mbsBGarNp+wRL44oF+8BCzaerf0JOTpdq4IagJZBDOHVOKJjC9/qDTAhTEsI135mC7w49ibe86uwBHwSHNE7TP/B8HoAiXXoGsX0UaDOWMpGIaimEWsVZ5ldrvBldCav+TYrKeriU+pmA0QKdlDidklT5jeOIZQiScSqBjm9ZKP+H64W05+0gcmYN3HdTFuNNBC659nT85cpp0RTX4Y9tQ+uKSPmrBTe4wS5Cx5hE32JQpVnAApXNpwALbfUvQSqtJnLwhkV+rHciTL+fMQGvoP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(186003)(16526019)(6666004)(6496006)(316002)(4326008)(9686003)(478600001)(26005)(38100700002)(53546011)(66476007)(66946007)(54906003)(66556008)(2906002)(6916009)(85182001)(8936002)(86362001)(6486002)(33716001)(8676002)(5660300002)(83380400001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ni8yejZpK0FYZjBKdk02dXQxeG1MdDhOanAwZ1VMc0dkM0Z4SmJOTVFXZ0U1?=
 =?utf-8?B?cllCTUtnWXJPakxUeU10QVhZR0dseitnaDExalpGTk54Y1dlekQ5WC9JcTdm?=
 =?utf-8?B?L1hRbnhxbDRFbis0QmMyUHBnSHZCeXF5STNrQjUraGpHVGRnZG1MWjhBNTly?=
 =?utf-8?B?aGtsTFhBeWRIcVZDcC8vc01VZEtuRXNZUkt4Q20wMjVrdi9JdHdJQjNiM1o4?=
 =?utf-8?B?V2RmS2h0bk9Md2xkWU91WWNuYUxzMTc0d3NIOTFoWFRVYW1IV0xEek1ibzAz?=
 =?utf-8?B?S0ZpY09idzRycndBMzhFdXBoUjBvLzRreFBCZnpKWFJFbk8zVVlXL0E2M0RS?=
 =?utf-8?B?MHNaME5OUWw4Zy9rUHJpaHNvbmtsSnFlcktYalhwUW5rbU1ZN0NOR2podjI1?=
 =?utf-8?B?M0hJVHVEenBtWWJWWlJkaUJvSjFZQU9KWFo3MUFvS211NDVJMkhtc0VYVno4?=
 =?utf-8?B?RlhDRVZpVFl0T2FpOXd5ODBNOVBXTE5KbnU0azNzZG1TUWgrQXJRTTJvU3hT?=
 =?utf-8?B?aTF2TUFwM0x2bHJmeitNcGQ3NjAyVXpXdWgrM0xBazZoTHpkSlVBOWdUNk1x?=
 =?utf-8?B?ckdMT1BmUFN6UkRtdGN6Y0owYkdNcVkrWmV3bWhZZmRzeHhMakVrM1EvUnpM?=
 =?utf-8?B?TEZIUFo5N1ZOQmpUamJrRUlUbTdnbVQyOVE3c1BrYXZxRUxCbkdPR2txejdG?=
 =?utf-8?B?MUpQV1BFVUFnM0RyaEFnSFo1Ym5wMnJJQ3lZK0lqQkwxRFpTd1Jrd1JCU1Nn?=
 =?utf-8?B?dzFkbWNzM0JZN2NVcVNUM1pZdFhBRzljcGZQbExCVUVhRTBCamtXVFQ0eVQ3?=
 =?utf-8?B?WmJyeUhGNWVtR3RJUG8wOWluME9jZWxaQ2I2cExqQkd6RFlMSDk5TGp1cTJp?=
 =?utf-8?B?R24yNDVLNFg2TEJaOEoxdEsrdktJbElwRDFaMTVTL2VBZE4wV0I4c0c1bWor?=
 =?utf-8?B?TUVVMkxuSTVUcHhETzlTeU54eHZ6SmhrcUhhOU9PK1liR01UNDJnWUVrWnMx?=
 =?utf-8?B?Vk53T2hMMUo0S3Jnb2tjdzdzbjBoYi9WYU5xaVg0SmQxUzNYbml3N25XbUQr?=
 =?utf-8?B?bTk4bXVIQnl5SklkUlNXdGZtWnNaQlJ6QjRLeFJMaUt3dmF1N0RQU3JJSUhP?=
 =?utf-8?B?K01KYzJ2TjZBbzBaZ01lZVBRZnhqZEFocWc0dWhBRDNmbDVwK0xTTi9SZmYv?=
 =?utf-8?B?cHRtWXRxWHh1bi80WFhUV3lYRTNrWGVoU0V5ODdmM2RTbXJtRWJuS1hnMnNO?=
 =?utf-8?B?aWd2Z0JDRFg0ZWZxR21hYVlVRjlOem1OWS9wVCs3KzM5UmRzdjJRR3RPTVBI?=
 =?utf-8?B?YWJmTG82ZDBUbVYydHVBbTdWek9PMTRGdDFTMVNiaWlNd1pXQlhLZm1qRDRJ?=
 =?utf-8?B?cnlkSm5GRG5hcWpCV0Qrc0w4RzNGcWtkTVhwdHQ0aFNyamxnZU9KSEdnejRO?=
 =?utf-8?B?SFo3aGJkWUtsOE1qRjdOM0lTaVhoUlhZR1NaQUtoai9CYjRrTFVRNkNoVzlX?=
 =?utf-8?B?aXh2S0pRSWNNTHJtNE93TUFOeXRMR0x5dVVEdEdEOWRQZ1RrTm80K3hYTVNQ?=
 =?utf-8?B?MC9WZC8reGVrWi95OU1RWlFwVnBNVVdXYVZDMnVab1NRY0wxMGt6UlJYMW1H?=
 =?utf-8?B?VnB1a0JQeXVmU3ZjMUg5TmxiVTl3VVQ2TjBSdyt1ZHNVd3l0UndGYXh2SnhE?=
 =?utf-8?B?cTE2LzI3N0J4OFBER05ZL05CNXBLd3IrQlhqd3ozZzNQR2FJN1pXRzFBcDA2?=
 =?utf-8?Q?ueU5YkOZjiNt8TpbPZoKzqqTJUSf4u6JqUctwq7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aef37349-0fe7-47d4-cee4-08d903e9c600
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 10:48:03.6011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye5941WnWbUemEv/4MbIaQz9oUV0PZjBkiDCkdnLqNfGJC3UlNvacIYNEGyER1ceWvdJ6gNq663aFPC0E0OcnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Tue, Apr 20, 2021 at 12:35:54PM +0200, Jan Beulich wrote:
> On 15.04.2021 16:47, Roger Pau Monne wrote:
> > AMD Milan (Zen3) CPUs have an LFENCE Always Serializing CPUID bit in
> > leaf 80000021.eax. Previous AMD versions used to have a user settable
> > bit in DE_CFG MSR to select whether LFENCE was dispatch serializing,
> > which Xen always attempts to set. The forcefully always on setting is
> > due to the addition of SEV-SNP so that a VMM cannot break the
> > confidentiality of a guest.
> > 
> > In order to support this new CPUID bit move the LFENCE_DISPATCH
> > synthetic CPUID bit to map the hardware bit (leaving a hole in the
> > synthetic range) and either rely on the bit already being set by the
> > native CPUID output, or attempt to fake it in Xen by modifying the
> > DE_CFG MSR. This requires adding one more entry to the featureset to
> > support leaf 80000021.eax.
> > 
> > The bit is exposed to guests by default if the underlying hardware
> > supports leaf 80000021, as a way to signal that LFENCE is always
> > serializing. Hardware that doesn't have the leaf might also get the
> > bit set because Xen has performed the necessary arrangements, but
> > that's not yet exposed to guests. Note that Xen doesn't allow guests
> > to change the DE_CFG value, so once set by Xen LFENCE will always be
> > serializing.
> > 
> > Note that the access to DE_CFG by guests is left as-is: reads will
> > unconditionally return LFENCE_SERIALISE bit set, while writes are
> > silently dropped.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > ---
> > Note this doesn't yet expose the bit on hardware that doesn't support
> > leaf 80000021. It's still TBD whether we want to hardcode this support
> > manually, or instead rely on a more general approach like the one
> > suggested by the shrink max CPUID leaf patch from Jan.
> 
> I'd like to give Andrew a day or two more to respond there in case he
> continues to see an issue, before I commit that with your R-b and this
> one here. I'll assume you'll subsequently take care of that missing
> piece then - if not, i.e. if e.g. I should, please let me know.

I think it should be something like the above, in fact I think it
would be perfectly fine to merge that chunk into your patch?

Thanks, Roger.
---8<---
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 050cd5713e2..daf501779fe 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -314,12 +314,9 @@ static void __init calculate_host_policy(void)
 
     *p = raw_cpuid_policy;
 
-    p->basic.max_leaf =
-        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
-    p->feat.max_subleaf =
-        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
-    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf & 0xffff,
-                                          ARRAY_SIZE(p->extd.raw) - 1);
+    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
+    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
+    p->extd.max_leaf = 0x80000000 | ARRAY_SIZE(p->extd.raw) - 1;
 
     cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);


