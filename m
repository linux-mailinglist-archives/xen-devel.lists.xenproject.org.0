Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2F36940C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116384.222154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwCt-0000LK-5F; Fri, 23 Apr 2021 13:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116384.222154; Fri, 23 Apr 2021 13:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwCt-0000Ku-10; Fri, 23 Apr 2021 13:50:55 +0000
Received: by outflank-mailman (input) for mailman id 116384;
 Fri, 23 Apr 2021 13:50:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/M9=JU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZwCr-0000Kl-Vf
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:50:54 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 528f8f19-b7d9-4caa-8662-55f70936ccce;
 Fri, 23 Apr 2021 13:50:52 +0000 (UTC)
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
X-Inumbo-ID: 528f8f19-b7d9-4caa-8662-55f70936ccce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619185852;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=f7n9y6DY6W1fiI4umbmYYhGAhScCxzCUlwlRstZzDLU=;
  b=EGbBhrQ/DJkBTEOFAa3yMyI0cIaoU1PvEM0m1BK3ofGU9KrSzDYDpk/k
   kT918wciFjULStvSAcFpHL7pxTbOfxHKczmd11iTWt7hEcSAYsYx0uMhu
   eaVeMdt5McXbIAWpXiLVBZ0ahaL0aB7OiRVI5VuXrkcBRmsNEagoxqyGs
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: A5wRHdE1pReb1u7l9s1Jpl8Yh2Ayed8BziryQ4QyvY1mQo2WxoxAcGwlKW83gdf9UVVaFq24Hx
 Az0MZ96xx0QmfpLa+z2ltKKR6jglyfS998KRojDOfHX10jnxoUVT5sQPiZOGqzKibshYoLJr0Q
 t6fVfmuSmGrAFoBFl0n4aE8MZctW1vbTf0O44z6x6iM2iMgDxUegCCRmc/OLydN4b3bQ9jhXcC
 v2ENyf5vpsSm/UpetR489M25iLLuQyNCF3mjtNxpDS6PRYnsztH5i9HxJsV7o7N2bb8iWLThEW
 6s8=
X-SBRS: 5.2
X-MesageID: 42276964
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AOac5q4sDm/69DtAdQPXwVmEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotn6Bp0DRveN0VwShVPC5ZRLu
 vh2uNsoT28dXMLKvmhDn4eUOTZ4/HNnpTqYRkJbiRXlTWmpzWu9bL8Dlykzg4TOgk/u4sK3E
 rkt0jC5qulu+ym0RO07QHuxrlfhdeJ8Ko7OOWikc4QQw+c7TqARIMkYLGauSBwnefH0idQrP
 DpgzMNe/t+8GnQeGbdm2qc5yDF3Cw143HvjX+06EGTx/DRfz4xB8pfiY8xSHKwgCBBzbIMop
 5j5G6Xu4FaChnNhk3Glrz1fipni1aupj4amfMT5kYvILc2UqNbroAU4SpuYfU9NR/9gbpXdd
 VGMNvR/7J/f1+cchnizxFS6e3pdHEyEhCae1MFq8yY3hNH9UoJsXcw9YgxmGwN+4k6TIQBz+
 PYMr5wnLULdcMOa7lhbd1xDPefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEQ6PuxcJIF4ZMukP
 36IR9lnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzCWwGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLFW6mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzdP8NFwke3WmLpoRTYVn/3E3aPvq5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gXcS
 JFUfHau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPF0v1dL0EquiOYGw65grDGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy1weuWyNVJVZvqGY/8/qdtcZA/8dKeNMPDSOMyYwtRdhqW
 9FZgNBbFTYDCnShaKsi4FRIvreedl6iAKCOtVVtnrbiEWZqagUNzsmdg/rdfTSrRclRjJSiF
 E02bQYmqC8lTGmLnZ6vP41K2RWaGOcAKtPCSOMYIk8oMGuRChACUOxwRCKgRA6fWTns2EfnH
 boIyGvdfbXOVZFoXxD3qH28FR7S3WFcytLGwNHmLw4MV6Dlmd40OeNaKb26WeXZ1cY6sw2MT
 3OY1IpU0tT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlm3LpeTqK0AF/hI3ZpsOdz0qNUXWe
 aHdwL9FkK+N8oZnyiu4lArNyl/pCN6zbfG2Bj54HO523B6K/zIO1hiT6waJdbZz2WMfYf97L
 xJyfYO+c23OSHNT/TD74f9RTtKMAnSrm67VPtAk+EcgYsC8J9IW6DGWj7J3kxd1BowLM3IhF
 oTKZ4LlYzpC8tKRYguYCpX8VoiqcSXIGYqugLwBPUifVtFtQ6tA/q5p57Jo6EoGEuPuU/ZPk
 Se6TRU+57+LmC+/I9fL6I7OmJNbkcgrFxk4eOZboXVTCGnbftK8lb/EnizdtZmOeK4MIRVih
 Zx+NeTmeCLMwL+xQDLpDN+Zpt0zFzPe7LFPCu8XchS89K7PlyQgqylpO6L5Q2HNgeTWgA/no
 1KdUsZc8JZrCIt5bdHlBSPdg==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42276964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxcrKqQDev7FQICtbdgnUw0h0sGXn+TJfI2m+gW5KdhZtnhG+pRd3j02wQUAc4xqZAN2s/N5BWeU6OHuFyumEy/MZpIh2VyxZSRPUD6gaFchZHMRlJ8snbnsGyzlY/zEpH44tkFDcl3/qhJoHqjlVSU0in/ZTItQvLlbm2G6FaZ200pVifFXWr9mGngtfHGlugSm3hZwbvEHBOvcbLpC5leaD+jURPGd68zLVqSnryxHIoqRXd68JeB0gXlh2vYEux5CpLCZMC/+LQwdhvSTrUHWLimBSVwO3TfuBOLizd2TptygHoY9LyDGltoiP+YgyEoXqV8CrkqaXO4gTFkrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3JarhgN2oZ2sKovCT3MqZGx9SBCRc+5Nra94LPLA0Q=;
 b=ChdhNogEQUwqkYiBQilHxeicUNdWFsOTWMou5g72TyN4zgJ9qHjOyYFMj4RnAK5PNpnEKwuieipiFQ1VK4Nck+AazAQh6qPxLcvVB4es78GnRifGTC6NXdkJ9PLKLt3PdAmUwmgs2PNALlew/rCPBXZzZZRm/INPPVppZcZNE6ecld91NG2xE3IiWjD8IhIdkL0/lNk2l7RkBVjPUEbSjORrQDfmG35y5spl6nwzNqk7gEqrTWqOPVZ95rIqmTNzI92iQmrT57eyAS8whRCxzZ7cUr5KyFNjd+WXv5iAq4zSZw6xRxLv7NxlgFppJxKK95Iqhc2j6u0nmLaumiamHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3JarhgN2oZ2sKovCT3MqZGx9SBCRc+5Nra94LPLA0Q=;
 b=sqnzy6Mz2xevLhYlWRJShQzeEqTFWPQJcojGqI5hRsV75853hm2gM7s0UEFuTxl39sfIDp/Uzs2UWn3FFao7FCRhTcHDD4szj1ly6TDCzinbDXblQ/v0ESfrCXvq0LzMgW1wkZIIuITIYs2puGjgeOVHedfvJBlW+7ei8m4gtz8=
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
To: <xen-devel@lists.xenproject.org>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
 <YIKYaCr13TiwxqRq@Air-de-Roger>
 <98d0b627-de38-f7a0-7487-cbf83864c82f@citrix.com>
 <135f8bc2-d07c-c531-e498-9f0e15207cca@suse.com>
 <e386f7eb-8ae8-2f18-b9e8-30a319354ec0@citrix.com>
 <d03bbe0f-6ba3-8383-82cd-be340483f09f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <36eb2fb6-750e-4a27-9e76-82fcf344029b@citrix.com>
Date: Fri, 23 Apr 2021 14:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d03bbe0f-6ba3-8383-82cd-be340483f09f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae622e4f-26c4-41b5-3572-08d9065ecbe2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3799:
X-Microsoft-Antispam-PRVS: <BYAPR03MB379915DC125877F1F83F74C9BA459@BYAPR03MB3799.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1V8TfyziuYPhhqW1ziJH8ibJuMibpymKKb8MieU15H3KHdPo6Y2MJUq8RrfPHztatkbT5fHpN6OgPDf4l5R9WLonf9yb7rnoMV7s3clwo2nE0KYLJprBN/a63SKGO/dIx0IMzREm8KdHEgNbLM1wVFSbOKpviymRq3+y2SE+HPH2DP6yEC33YYNxcjX/6ZDt4IwSZaZrnWenizq1zvvV8+YbNRTJKQxgdxFNClaTlJF5o94PZ9cCipSxAoks3QikUdgplMM4UfwwOgZDa1PW8APY1oaDvgvzUTehGH6WNK9TAxb0xwmNuvqSa+u0F520tD/tKoIXoZkdzlMNZHRXzhRB5oj5bcFyO9jCYf/yZCTuqtNbrH3fxgPYLi/egOyvBJY2CU1DFYPeb3qaYQ8E3gtrQlqDA45SM+WRb3TTNXRZWgZ0howZgjuzGw/G3WDmP1+hSK+iuvujHszhVVPxR5CUQJFtGOyQVbYDW3jXnUkioqp/IFI3+z4Nx2A/jUhRhekIr81hsk+ZlVXU0Pcj6I9LEZP0Tb3wyvxKj3sIEwBqH1XR0hZlrCOR9fQxhYal2KMQDJa3nTZNIZUo96S0NT9v7+3bfC1SHj+JkASQyafXQbL4W8M8/BrgLb9Je+2yRmFgeJt8DB/1KcIPhj3DJNv0BGkPAvWwvDNENWIqakwvgjT5GFkCIVRw4S5Fd7n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(366004)(136003)(38100700002)(956004)(66556008)(6916009)(31696002)(6666004)(316002)(86362001)(16576012)(31686004)(66476007)(83380400001)(2906002)(36756003)(478600001)(6486002)(8936002)(2616005)(53546011)(66946007)(16526019)(26005)(186003)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VEZZVGtiSGduVWNCY0RPbmhxMy9Ta1FuNmtlbWcreHdGMDB3aUVIMTdRVDZw?=
 =?utf-8?B?aU1jSlZQbHU5UWNKajQ2RENqK3d5aFI5MFZ3Zk1xa1pSb1UrM2FqUExyRVNr?=
 =?utf-8?B?b3NuUTNhZHREYXBER1RQRUYxa1MxUWxkbUhPVDF3NGVtTURuSlVMVjRBRUhy?=
 =?utf-8?B?YXUxWFgxL3h0QVhXLzZTRUNFSDVuajRJOFRwZzhISzJrckc5SzBodzVHbDZw?=
 =?utf-8?B?Njk1T3BxekE1L0oyRFJqaE9PMGxVc0Rqa3B6R3U5NGo2ck0ydXdydldERUtn?=
 =?utf-8?B?ZkVKR0RSS1JDTm40YnRpTVJCRDkrQVJDbmM3bkptd1J5V0d5TXpLdW95NjlB?=
 =?utf-8?B?bXFSRkNISnEzUEswaVZ6cjVNdXE2VDBGSkYyUWlkbDBDb1V3amVBdlkwVWNV?=
 =?utf-8?B?a2xrbjMzSW5RZ3lIL0VhM2kzWkE2ZllpT1ovZ0dPNDZSdkY4S3c4NHdmWXht?=
 =?utf-8?B?TUZEckxNYlRLOE8xS1FKdXBkcWhBUFhBeVI4UFU0S2hOTkJISy9pdmZSUHRW?=
 =?utf-8?B?MU0xVWo0QTdmZDhLUldUU2JadDBjUEFpc1VtRXdmK2wxaWg2VDV4VlVHajJO?=
 =?utf-8?B?MVo1Q1Q3S3hYc2N5TjNQb2pjMGpEVjhsQkpSdkh4c1hoQlVnejFxUU9LM0dm?=
 =?utf-8?B?dXJXazZoc2d1LzhvZXRCdjE3NlZldXpxakVHYVRCZW1FMTRWejZ5YTNuZndu?=
 =?utf-8?B?dENUZXBIS3FXNDZZRy9OV2NCK1A2UW1ZdWVmekFGVjlsc2RzZ3FOUHVlL0h0?=
 =?utf-8?B?S1l6UDZvVjBndnUzd21QVWNxaXFaZnlNT1dxdjZ0d1o4VEQ0eENqV0V3bW5l?=
 =?utf-8?B?QS9NUklzekV1NmtiN244RGM5bTE5WFhwdFRpNE9WRGZVN1plcDJ2OWZnbHRY?=
 =?utf-8?B?bjU2QjZUTDdybW5rMVJaeEVpU01FaGFZdkdOeEhWalBRZWlhaEx0NG9rclEw?=
 =?utf-8?B?SkFJUEoweG92MHhOdDZveE5jVzlid0h2RWJXck14QjhoT0xvNnYybUVrUTFW?=
 =?utf-8?B?NXdwQkR5YjJ4TDB2L0xkbVR4QzBRYm04T3NBYUFzNmJxTzZmZWkyeXdITFZm?=
 =?utf-8?B?dS8raUt3eGtiVEpYQWhuc2hCSjNWVWhZV2VpdG00dlNtOEFaUHM1d2FsWERC?=
 =?utf-8?B?bWQwZDcrVlBxdktIYmVjanJqU294bUV5SjJuWG5DT3V1dmI4aHlrcFlYQVZW?=
 =?utf-8?B?eEFmNE9qYU56cmFkRVJhNU9tMmN0anFzUVFMRCs0M2h2b3NkakpLbWVibm40?=
 =?utf-8?B?OWxxbnNPdWtCaXZmdDFReml6a1dWb2hvOFdwNktwdVlVR3g4cTRYL1kwZUVQ?=
 =?utf-8?B?ZlFsNFBVL0dVSnhRUEk3YTdwNS9ma09xRHNGZW1xbW0zNVBCMmYvN1BqcjN4?=
 =?utf-8?B?MHNwMWJhOHBVNmxBOUtPZWdjVUxRakJtekoxMWREZnRaaEx6OVFKRE1QNUU3?=
 =?utf-8?B?NG16SDZWRU9oVGVsbGY0OWIrcjBWRE5BWU8zaGVkalBEek80cFpBbzBVMlln?=
 =?utf-8?B?U2Nad0lrS0xjTm5kem1FVlYyWFZjQVkxV1BHNjhkRHRML3RRMENMOWVLa1Av?=
 =?utf-8?B?dkZZc3BYaSs4TnFuN0grbkp0QW9hbElmSlIxSUdWR2YrRXZnbGxtQXRINk9n?=
 =?utf-8?B?RGNMamtzU0ZJM0lYdnZwVTBjOTJyc01rbU92cGxuQWRXbFRuV2FWanZSVWhl?=
 =?utf-8?B?ajlDaStYdFN5SDd2M1JRVlJoQWRTTmpHaFNWZkhvU0phbGRRL2JWTjFobGtE?=
 =?utf-8?Q?fq+cJ1Dwl4TjIKVzLS4tTzzPg68abtUoxp4Iq0U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae622e4f-26c4-41b5-3572-08d9065ecbe2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:50:47.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG7V7ZWyh577xp8KEYMgp3tPPAe39BKjmRRor4AMFZxtaJbPqm1IE2+wmxMNvULYp9BtqQuBHCWDx03XEhCpCoKx5mQqE0FkitiBFpqpbUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3799
X-OriginatorOrg: citrix.com

On 23/04/2021 12:08, Jan Beulich wrote:
> On 23.04.2021 13:04, Andrew Cooper wrote:
>> On 23/04/2021 11:58, Jan Beulich wrote:
>>> On 23.04.2021 12:51, Andrew Cooper wrote:
>>>> On 23/04/2021 10:50, Roger Pau Monné wrote:
>>>>> On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
>>>>>> On 16.04.2021 15:41, Andrew Cooper wrote:
>>>>>>> On 16/04/2021 09:16, Jan Beulich wrote:
>>>>>>>> clang, at the very least, doesn't like unused inline functions, unless
>>>>>>>> their definitions live in a header.
>>>>>>>>
>>>>>>>> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
>>>>>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> I agree this will fix the build.  However, looking at the code, I'm not
>>>>>>> sure the original CONFIG_COMPAT was correct.  In particular, ...
>>>>>>>
>>>>>>>> --- a/xen/arch/x86/oprofile/backtrace.c
>>>>>>>> +++ b/xen/arch/x86/oprofile/backtrace.c
>>>>>>>> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>>>>>>>>      return head->ebp;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +#ifdef CONFIG_COMPAT
>>>>>>>>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>>>>>>>>  {
>>>>>>>>      if (is_hvm_vcpu(vcpu))
>>>>>>> ... this chunk of logic demonstrates that what oprofile is doing isn't
>>>>>>> related to the Xen ABI in the slightest.
>>>>>>>
>>>>>>> I think OProfile is misusing the guest handle infrastructure, and
>>>>>>> shouldn't be using it for this task.
>>>>>> I'm afraid I consider this something for another day. Both the
>>>>>> original #ifdef and the one getting added here are merely
>>>>>> measures to get things to build.
>>>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>
>>>>> Without entering on the debate whether CONFIG_COMPAT is the correct
>>>>> conditional to use it's not making the issue any worse, and it will
>>>>> allow to unblock the build. We can discuss about the CONFIG_COMPAT
>>>>> stuff later.
>>>> I disagree.  Fixing this less effort than the time wasted arguing about
>>>> fixing it.
>>>>
>>>> But if you are going to insist on not fixing it, and putting in a patch
>>>> like this, then at a minimum, it needs to include a TODO comment stating
>>>> that the use of CONFIG_COMPAT is bogus and needs fixing.
>>> I disagree: It is (for now) just you saying this is bogus. The (ab)use
>>> of the handle infrastructure was there before. You could have sent a
>>> fix long ago, therefore, if you were thinking this needs fixing.
>> I only know it needed fixing because you didn't build test your change
>> in CI.  Don't make it out to be my fault I didn't spot this 6 months ago.
>>
>>> I can
>>> see that you have good intentions, but orthogonal issues shouldn't be
>>> used to block necessary adjustments (and this applies to other pending
>>> build fixes as well).
>> You genuinely regressed things for 32bit HVM guests, with the
>> CONFIG_COMPAT change.
>>
>> The code may have been using inappropriate interfaces to perform its job
>> before, but its actually broken now.
> In which way? COMPAT gets selected by both PV32 and HVM.

Hmm ok - with the select in place, I accept that it is only a problem in
principle.

~Andrew

