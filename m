Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7404C10D5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 11:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277319.473775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpKg-00055L-3y; Wed, 23 Feb 2022 10:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277319.473775; Wed, 23 Feb 2022 10:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMpKg-00052P-0u; Wed, 23 Feb 2022 10:57:18 +0000
Received: by outflank-mailman (input) for mailman id 277319;
 Wed, 23 Feb 2022 10:57:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMTg=TG=citrix.com=prvs=046033a78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMpKe-00052H-J4
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 10:57:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5adf361c-9497-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 11:57:14 +0100 (CET)
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
X-Inumbo-ID: 5adf361c-9497-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645613834;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EUi43xVVzgsLCdi1JHTfT24uDri7YIzDb2sJiSnh0Lo=;
  b=LxBALXRD2gK19brXELxD7fwkNRzyONazLOSdfcMeCQIcwb2ycWsV64OG
   wOsT5SpoFQtzmk7hfgYVGjgwZrANRhFTXIPD9aJS4LFgHH8z1t4dx+d8c
   aMd2TJUi1HR3uP0HDk0ysU77nytmE9hpsyRJCAHh3+FKYrThB/+Mx3p5A
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67054062
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xql2R6+WlxEVg1SJJV4UDrUDkn6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mcbWmjVb/nZamXwfdF0a4nio0hQvZaDyNBnTAZqr388E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24LiW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnazpFUQ7Bvbpor8ADDZoMSNXMY9i5IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZVBNGY3Mk6ojxtnNn07MI0Tp/qR3kbtaSZUhGmQvKsl2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUKsV3O2JKPxjzCGzcrfhxDQdAEkNMPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LChAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bptZJGGxM
 BWP5lM5CHpv0J2CN/Mfj2WZUZlC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/q9BLdglSdSBhbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3TApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:IbXMr6CLc2Jp55DlHegCsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsuqKdkrNhQYtKOzOW9ldATbsSobcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj4Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSXGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZjzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUjZ1TChkF2nAic0idvrD
 D+mWZmAy210QKWQoiBm2qp5+An6kd215at8y7BvZKpm72HeNtzMbs+uWseSGqC16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh5rD30XklWavoJhiKoLzP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv00so5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHqokd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MROAtPTWu7ZjDrRCy8/BreDQQF6+oXgV4r6dn8k=
X-IronPort-AV: E=Sophos;i="5.88,390,1635220800"; 
   d="scan'208";a="67054062"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe1aa+nW1gwCYzxmjDVEe+HuFlLMnDEsoDJLXDOk6gnr/+h8Sj1swPSYZztIx7H4xS2486AGO9mc+sa+KHHWOD+o3gPpktwy6cb+X3/YUQSzk94btFdXriU5eWZgEwU+DK6vI8rbfDER1jXIJntzfyD7Xr6q1Ptdp3rsilO6efDNuulo69n/oaDqAmSbZPGMfOVI7H8a3BlwgUOG9rgS5/PonjIIL5tiwwf00DkujNB/CxW1FtLcyIHr7XNXSOBYJ7iz0pQAqaZlk7Ij/RT4vYY8huQnf/n5/CWD34eP/KyAdlcUM7+iyQYWbH5BVb85WKqgDv7npznFsVr0R0m7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUi43xVVzgsLCdi1JHTfT24uDri7YIzDb2sJiSnh0Lo=;
 b=BtmtnUKQUCcXPVRJMEWZH/hNfY2uVWtd0LA1G3EAPhLNquATKa/l621PCvFG/oSvU4SvarKYc2AMugB4H73xCancJKw8YiIGlMop7srWh172v/D0Kky3E3RhqraXow9oWumjFgyp04x0KzR0wHgAIjTfR4PRdQ48X4Rmh1q4tRn5GYI8zlcYoyyoA5Fb+2NjCeZW12eLf9vGxMuE2OPtBlpYPzue7+XxVDznRtzqfnPZ4OJHSwnWB0pNooiZ/+ffu1WsN7GMIlZA6sBA8i3BO9yOFx0vAEy7AwAN4PYj/7fTAxGOTYPkMtwYqDaKhNk94f7p3dINNXHrTDIYoXA9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUi43xVVzgsLCdi1JHTfT24uDri7YIzDb2sJiSnh0Lo=;
 b=L6OIyGxj4YRBAm1VOu1ScPGgxUcDLu3U5I453g8lkPMvwGp2VOWkDRdTeLF8i2oXZHGxXvi81M0yy57RNZmGzAVsBZGJZ1EIYeT3kTePSnUtPLdpDx5I5UZ4an8GZ4uQQbtk9caRG/IX7B3BI0JjMbpgJyqfmV72iCPU2c7x8Ic=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 2/3] x86/cpuid: replace more cpufeat_word() uses
Thread-Topic: [PATCH 2/3] x86/cpuid: replace more cpufeat_word() uses
Thread-Index: AQHYKJ3yxw44MvRAME+HWfLX8yy7K6yg9viA
Date: Wed, 23 Feb 2022 10:57:09 +0000
Message-ID: <b350f070-e324-b624-29d8-1999c435f2d8@citrix.com>
References: <91935ffd-a270-f1a1-28f1-645fa4167fcd@suse.com>
 <2c1f9c24-a07e-b5b6-2f20-18eacb835763@suse.com>
In-Reply-To: <2c1f9c24-a07e-b5b6-2f20-18eacb835763@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7ce0725-da50-49ba-b7b7-08d9f6bb3d41
x-ms-traffictypediagnostic: SJ0PR03MB5918:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB59184849A4895071A969580FBA3C9@SJ0PR03MB5918.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3HVJf96Hc9YrXt17tK5n5vDPFnMc295x8eldVmin7lam9uyJ0jo9EGcs8ifFUPEeQehm2KcQB4djLoiO3m0dPrchO0E2MizmwNSINb6PM9A4AVG+/nEBE21EuitceU62UjKqsDjFe/jVf5y5q7MswWuRX9yE8E05Xqo7DVly22r2Yx/uA8XGHcn9irjQwqxGQd1WhXU/5YxXjBAWe5/2f7X2cyrgczXOKb23VX4Yd+yQrpIQzoGm1hKRjrsgt3Z4dqFmd/1KTDCP0fWN0Zfs92wOXouVPYe0bS8+jw+RZFaUA1ChdtT6dmaxwfM1RWnOvjGxA2FO4tnrgmGAAiCwkM1o5QOvzkpPcMTCVEVJGzTBigePS5/oDEbWOMcE6RxXb0eQp7J+2WUKa+7d443qbbSaKjJD3+tM3E2YUcz3ySJm2JO3tP7mUeLXIY1Of7LS3d5QTbGRVZa8HlIgL2oBWpNgi6WzkAKB5It7E9mCeRv7fBxluNMHg6RKOKifrK28Px2Cj2OgkbP5wMTeK/zf/VptlaqSrOWFYBKZANq29uIEQzr4W3QX4p9WMdB3zR/aLHHlDXgEwbLNyEllxOA1EttLAbYVPDyj+Va99DM9cKpv2aWJmG2AKkFL9GIKuoBxL/ExM46r1LAQ+IpgM8ciF9p6JwwHStp8ID9F8ERGs+NusCfoKVpdX7r/+MO9W1fpGAXG30g4ROfXPtav+2yS8EW6Mwi9lcPv5KZ3SFbC03zf/SrX2PPEpC3xi5W+3HkAkXmb2wQGKUWZWuEVDYTbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(66446008)(66946007)(64756008)(2616005)(53546011)(6506007)(122000001)(2906002)(54906003)(110136005)(31686004)(76116006)(91956017)(66556008)(66476007)(6486002)(316002)(86362001)(4326008)(5660300002)(36756003)(8676002)(508600001)(71200400001)(26005)(31696002)(107886003)(186003)(38100700002)(6512007)(38070700005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGlraTFXNVdudkl3Vmo5aFFhY2JpaUVldTYyMGRqMEJDUFV3cUpNUGgvSDhC?=
 =?utf-8?B?b05BQU9uVmF4K00wVGdRcnB2MW5CNit3WkRmOTNvREdNNEZ0MzBkaStZSld1?=
 =?utf-8?B?YzJHVzg3ZmtMcXZwMkhNVUM3clc5Q3JnOXlBbHNGOU1ScDJwOGo0MnVyM1Fn?=
 =?utf-8?B?ZlNMc3FwMDJsb3cxUkMxV2FDblZ2VURvTEdlNkVxVm1nRkZDR0x4T1dpMGRL?=
 =?utf-8?B?elZMU2RJRCtyVGVNVkVmbUhsajRRaW5XbW9qdTBrQVlUWUM4NGRLMDQ5YnpV?=
 =?utf-8?B?a0pTQkpibUo1WXZEWnlnSDFaQ3BEeU1UWHl2cDhOblBoNmVQdzl4emxmaEJC?=
 =?utf-8?B?UUorWEVSZzhVSWRxaklacGFCK2Q0NmhsdUplRllkTlI1MWZQK09BeW51dWhl?=
 =?utf-8?B?WU5MNXpibHRrbWRrSWlTZ1lGWVpYSnNWSVAwU0VZODRKRHNScjdPdTl4Qmt6?=
 =?utf-8?B?MjB4Wmw1OGFZcnpETVc2eG10Um1DS2JNRyswaWNsUTRvRHZPVVlaSTRoektn?=
 =?utf-8?B?Y2dpYkVRSGwzTEVWU2NjMk9pSFpvV0RpeG5vN3hjL0ZaeUsxNE0zY0l4dXJJ?=
 =?utf-8?B?WEd0V2s0ZmpEREVHRUF0TGJsb09oVXkwYXFFc2JUWUoyd2Y5VHdvZ2tVbml2?=
 =?utf-8?B?dnJzSkd2THJTVWE5TWNXMDhRRkF6ZmQ2a1hxK2g0M3B4WWxQaThVMDIxL3pp?=
 =?utf-8?B?cUpPbVZ1Tis4L2ZUZHNoNzk3SjZyV2ZrdGRjMDVDT1JCYnV5ZUplMzVPV2ts?=
 =?utf-8?B?RHk4ZGFuNkJxSHZQWE1WaXovWFBKZ3NkTWZCNDcxY2pSdzRhWGptWGpSa1Uw?=
 =?utf-8?B?OUVUMzlUdUEvanI1SXlTMCtYakE4cnAwa3NVaWZ4Y1p2V1VnRm5sV3pEYVJQ?=
 =?utf-8?B?UFVDNkptQjQ1SGJ2SmlLcXZaMThJMjRHTlNrSEdsT0orektFVWNVTmZKL2hE?=
 =?utf-8?B?amVJa3pXRDk4NEU0czAralo5SXB6ZEJqOXNxdjVKVGJad0dubHljNmRGR0JV?=
 =?utf-8?B?ZTYrbmxoUEc2bjhQN0NWK29uZ01YeFg1eXQyOU51RHFPVTlydTJ6Z3QxbVNx?=
 =?utf-8?B?eGJHdUx5WWZ4UHNNdGdydzJybEE3UWZVZWhtQWVqYTF1ZTd1ZkpLZUg3Ry8z?=
 =?utf-8?B?d0xtVzJScS8zNTFLMkhjTkVSb1Y5c2pBamdpampEc3B5dWF0ekowcFk2QkVX?=
 =?utf-8?B?ME5TVW82NUdNbVo2bUxkVk9jMUhlSENLdnVrWWhGMkhmdXkrTkNTdUNEWjcr?=
 =?utf-8?B?bURtYlUvVUFEYzVnK3ZPN1RpWEJyaXloTkw4QTJiSjRneVczV0hwaGUxeWtN?=
 =?utf-8?B?ek9HMVhUdTE3QmZTL1ROYWl5NUFBT3JpczZ0NDBJTzNZaDJBeWNibHRpNEt0?=
 =?utf-8?B?U3ZjZWhWWXhTc1AySWJIOWl1Q3R6RHBBcjN5cmt3K3dFOFNHWlBRYWViN2Ux?=
 =?utf-8?B?OVlUbkxPNnc2U2xPVzZvTWpJdndkSFhuZm5GZ3kvZFJUeHFPZjJhVGplcWwx?=
 =?utf-8?B?NldBZTZnbEpDbCt1TGRRTG83OFhVT044bTE2KzZpMWhkdW1DY3dUSUNhRVVs?=
 =?utf-8?B?NGJpTzJPa3B1T3J0RXhuMnVmUDA5TlZwUzhDVzExODNzSWI5SXdCSGZCU01Y?=
 =?utf-8?B?NlF6cExHNE5pQlViMFllY1A3aGNiQXE0NWQzMGZBdUtLb1Bxb3B2MGhSTkFP?=
 =?utf-8?B?cUFLbTJ5alo2MUZnSGdnMDhIUE9Rcm1pcmlYM0hnMlNtK2NNOGJVNWhIZ0dp?=
 =?utf-8?B?cmFIMThpOWF1dC9iTUVNQ3hpNWNXT0xWaE9TU3pvVE5oZmxtRE9mRmxHRGl3?=
 =?utf-8?B?a29UQlIwNHQxU2hEWGtaSmIyV1VCeDNIbTNJdmdhZFhVclV3Z3VCSzR1bFhP?=
 =?utf-8?B?YkRCdTVremJHVGtqMXFCb0JsaHdSSjh6VE5VeXMxRFBJZWlkOWJ1Nmp4dnhP?=
 =?utf-8?B?L0RtUWVnZnZWSFVEcHRaVmtwWkdzOTg2UllqMjU2MkVwc2tWZUVwemFCM0F3?=
 =?utf-8?B?UjgrNTJ6cWREeWFDNDJoc1hpZDBsMVlUZkd4b3VKODlnbUJsT3VSSEwwWnVI?=
 =?utf-8?B?V3ZHQmtpSW5qSk9FNUdZTnJCQUhsUUpNZGE0bHVpeXgyUVE0S1Y1SmNRdlFB?=
 =?utf-8?B?SWZhdkdWOGtDYU5NdFNBY3ozNVVENE9sSzRPaWhoUHhIeEgwWDhkL2JFYXA3?=
 =?utf-8?B?Sjk4SGVhLzVYQmNvUmxVeWlOby9rNGpPSFdXTjBzZDBHNzBWT3g2eEpoZDB1?=
 =?utf-8?B?QllxTi9nK1JtYllkb1kvV3NNbUtBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <922DE90C96E334408531249F38F000E5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ce0725-da50-49ba-b7b7-08d9f6bb3d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 10:57:09.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTZbow+pCG3WlEVSBDX06rbSLQ8cPT276ClJFlCEo1PV9VKe+zQiSwinqcovgWlVJJ+ioPMjfE1CPhUav6VpALHfFKhJzfLPT0nTIQtScPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5918
X-OriginatorOrg: citrix.com

T24gMjMvMDIvMjAyMiAxMDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHUvY29tbW9uLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYw0KPiBA
QCAtMzMyLDIzICszMzIsMjIgQEAgdm9pZCBfX2luaXQgZWFybHlfY3B1X2luaXQodm9pZCkNCj4g
IAljcHVpZCgweDAwMDAwMDAxLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsNCj4gIAljLT54ODYg
PSBnZXRfY3B1X2ZhbWlseShlYXgsICZjLT54ODZfbW9kZWwsICZjLT54ODZfbWFzayk7DQo+ICAN
Cj4gLQllZHggJj0gfmNsZWFyZWRfY2Fwc1tjcHVmZWF0X3dvcmQoWDg2X0ZFQVRVUkVfRlBVKV07
DQo+IC0JZWN4ICY9IH5jbGVhcmVkX2NhcHNbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX1NTRTMp
XTsNCj4gKwllZHggJj0gfmNsZWFyZWRfY2Fwc1tGRUFUVVJFU0VUXzFkXTsNCj4gKwllY3ggJj0g
fmNsZWFyZWRfY2Fwc1tGRUFUVVJFU0VUXzFjXTsNCj4gIAlpZiAoZWR4ICYgY3B1ZmVhdF9tYXNr
KFg4Nl9GRUFUVVJFX0NMRkxVU0gpKQ0KPiAgCQljLT54ODZfY2FjaGVfYWxpZ25tZW50ID0gKChl
YnggPj4gOCkgJiAweGZmKSAqIDg7DQo+ICAJLyogTGVhZiAweDEgY2FwYWJpbGl0aWVzIGZpbGxl
ZCBpbiBlYXJseSBmb3IgWGVuLiAqLw0KPiAtCWMtPng4Nl9jYXBhYmlsaXR5W2NwdWZlYXRfd29y
ZChYODZfRkVBVFVSRV9GUFUpXSA9IGVkeDsNCj4gLQljLT54ODZfY2FwYWJpbGl0eVtjcHVmZWF0
X3dvcmQoWDg2X0ZFQVRVUkVfU1NFMyldID0gZWN4Ow0KPiArCWMtPng4Nl9jYXBhYmlsaXR5W0ZF
QVRVUkVTRVRfMWRdID0gZWR4Ow0KPiArCWMtPng4Nl9jYXBhYmlsaXR5W0ZFQVRVUkVTRVRfMWNd
ID0gZWN4Ow0KPiAgDQo+ICAJcHJpbnRrKFhFTkxPR19JTkZPDQo+ICAJICAgICAgICJDUFUgVmVu
ZG9yOiAlcywgRmFtaWx5ICV1ICglI3gpLCBNb2RlbCAldSAoJSN4KSwgU3RlcHBpbmcgJXUgKHJh
dyAlMDh4KVxuIiwNCj4gIAkgICAgICAgeDg2X2NwdWlkX3ZlbmRvcl90b19zdHIoYy0+eDg2X3Zl
bmRvciksIGMtPng4NiwgYy0+eDg2LA0KPiAgCSAgICAgICBjLT54ODZfbW9kZWwsIGMtPng4Nl9t
b2RlbCwgYy0+eDg2X21hc2ssIGVheCk7DQo+ICANCj4gLQlpZiAoYy0+Y3B1aWRfbGV2ZWwgPj0g
Nykgew0KPiAtCQljcHVpZF9jb3VudCg3LCAwLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsNCj4g
LQkJYy0+eDg2X2NhcGFiaWxpdHlbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX0NFVF9TUyldID0g
ZWN4Ow0KPiAtCX0NCj4gKwlpZiAoYy0+Y3B1aWRfbGV2ZWwgPj0gNykNCj4gKwkJY3B1aWRfY291
bnQoNywgMCwgJmVheCwgJmVieCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYy0+
eDg2X2NhcGFiaWxpdHlbRkVBVFVSRVNFVF83YzBdLCAmZWR4KTsNCg0KU3BhY2VzIHZzIHRhYnMg
aGVyZS7CoCBUaGlzIGh1bmsgaW50ZXJhY3RzIHdpdGggdGhlIENFVC1JQlQgc2VyaWVzICh3aGlj
aA0KY29sbGVjdHMgZWR4IHRvbyksIGJ1dCB0aGUgcmViYXNlIGVpdGhlciB3YXkgYXJvdW5kIGlz
IGVhc3kuDQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0K

