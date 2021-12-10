Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A500B470220
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 14:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243904.422012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgLQ-0007NH-LO; Fri, 10 Dec 2021 13:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243904.422012; Fri, 10 Dec 2021 13:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvgLQ-0007KI-HH; Fri, 10 Dec 2021 13:53:52 +0000
Received: by outflank-mailman (input) for mailman id 243904;
 Fri, 10 Dec 2021 13:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/FQ=Q3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mvgLP-0007KA-D3
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 13:53:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 993a043d-59c0-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 14:53:49 +0100 (CET)
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
X-Inumbo-ID: 993a043d-59c0-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639144429;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=K9Pv3Lb/PCZAj4cbvQBpniDqNC4AKgW7KAkYeI7rHQs=;
  b=Vu0qewPeQ4EUck+qza636JXXm9Mxc/gmLj5JfzVHpQPob6F5N1gZG75m
   EEr4i/34+FcTcUpf41YdqJuGwHpenO4ayAeRzkmdpu1Nv7ndhqSKJpLPN
   jK3sobic9aIyBWzRA4mUCkMjn1jqBHcYzlw02tMK5QjgA2HOADUVpIIeU
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lXeu65xEWVYWhBb2Qco1O8YSlS55Hv+TmhIyuepMWtvzXz0Fh+a1QgTxo3IDttJbPBm4TyfUq2
 Fy0qzvI+OOq5kKcIWhmcAQvGsCJEo0xNNe03R/nj8L1PE6RWZPD9dPAzKcYUAPJUYxnv3kZo8F
 FcbrsBkMO1TPKoBu85RV4KCg8sdYvnEWpKT/ISFK6D4XK1LK3c8Ejh4pwY+2HfPpHZANEl3LHp
 JK3Cdt/gzoy+VWbhaUEOE49AfK397sBP7uatonGVtweTPFWFeM5w6KAHe+9kMjNrsNZLvTDB79
 u8090koMyXloTFx8qLezC2KY
X-SBRS: 5.1
X-MesageID: 59242958
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JwGGoa9mDH51O9aWPsviDrUDXnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 zRKWTjQbKreZ2v3KtEnOYzl9kkA6sPWnIVhHQQ9pXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug6wrRg2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhY6
 /xn74WJSzwVO6DimPxHCSNBSA9xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFjW1s3JETTZ4yY
 eJAZzRtcxX7eiZWFW4SMZwRsMeVniPwJmgwRFW9+vNsvjm7IBZK+KDkLd79atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCslz01cYBJKu8B1ASA5KrMuVyjHzMqQWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFjFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBuG4jeBkxY5pcEdMMX
 KM1kVkJjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4AOXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:tCWjiK22TQpZtjZ7H/rTJAqjBShyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhQdPT2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzM4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 TxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72xeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJlBXv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlbhrmGuhHjPkV1RUsZ6RtixZJGbCfqFCgL3b79FupgE486NCr/Zv2kvp9/oGOu95Dq
 r/Q+NVfYp1P70rhJRGdZA8qPuMex/wqC33QRevyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.88,195,1635220800"; 
   d="scan'208";a="59242958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnwqbyW2+PR2z2y7CTZjQ/Mg6rjCGFmHtnk0h9vkd77GZvdbPpQGQnMY4jj7CccuirUCQhESXu44VfRi2H84+5wHxGs/KYpLjgOTDPVaMtIkMq3kuRu950TnNtGwhwKCECA6P4dJFlCfxtFdgg7zDm+agMzj1lv4C5BMUpV3DgJ9ok9SrrXjiSwhSZyi3DLk2Y/9N7FFh9PXdAyG/nvUAXlE+iP8UuGmExpJ/MxfI1LcJ1hxGG35C+Yt/jAjVB7hCcJZsW2ZHi5b3eiUV/sht7WNdTnzRQJ7VTyMOn6HZrmDdqVIZHuXtfekIq10la2KH/r3jc6RMYNMG785cU7Wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKFk9O7qIhJQjZvK2iwmn2evIFBeA8AxkEvFqmx7VMs=;
 b=R14PO487Ao8zzGyt+wEBeUZ9PA0F+SM4kWU/sjg2v3UmUj05C4YQjSkgTPSMmJB2twRVWbhu1/LKW5iOAyDoRofE6b1iDaLUnTQgDmGEVSEolIOH73LswqqnRG6s7QaBQL7OGtdF/PNpFhzyBg2mCJWUtJxbrdUA2V9Tb9x0D4S+GwAdDb3mKhDRSivZ3a/7tcEJI+O10DaFV3fL8mvhT14gs8S1woKPlWEkoIWqywaY6LPpqjz54VcDlq1EBV6YguUI5xOqmpp0kdJNfb8uMKXi3OGtPb5/FoH8yRcJUiTtGy0meVmvh0i9IXE9DMqvxWTSv84j9LAGHMqYyKwnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKFk9O7qIhJQjZvK2iwmn2evIFBeA8AxkEvFqmx7VMs=;
 b=mo5liVbs881p7WIb9n7JGtSVLOapm3d5xlJ2PhWzS0nvJah4Kd6wajkffoO1j/ZgxatjStLD6oXdWBMOW5C6moanwEmx2EN7Ps8RPk4SyxCzJThZCp5pvTQ6lxYk62XCVnF68c0T+np1c2uVgClTh/88hfeYtsq2eOxfzK0mr7Q=
Date: Fri, 10 Dec 2021 14:53:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 11/18] AMD/IOMMU: return old PTE from
 {set,clear}_iommu_pte_present()
Message-ID: <YbNb4lMN71Lvj/bN@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <33819694-2787-4bd6-1830-6b4eb81cb4a1@suse.com>
 <YbNCpA1PDtINnn7j@Air-de-Roger>
 <1fe2b37d-b898-c86e-dd4a-482bff9597db@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fe2b37d-b898-c86e-dd4a-482bff9597db@suse.com>
X-ClientProxiedBy: AM3PR07CA0133.eurprd07.prod.outlook.com
 (2603:10a6:207:8::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b577eb40-16a3-49f6-f9b8-08d9bbe47a9c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4762:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB47627E7FF93AAD2632C2D3738F719@DM6PR03MB4762.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uyr/qeNfU3PHi6pgPf6g1qX8Ye5mXCvOGO/+zEEKL3KXkRXrFgzlPHn+gR3/bU/7IoNbV8aSe/XvOCJYlVTC00NBrsZ0uJ/czNrAaH5ZIbHDQNRF3nteZarip6dzQHIMwF/o9Iay9BMjmW2AQOFFSk6SuJIBGqpywgT+lnijzexnYch70kZ+/qeW5B7hYzjUggMmr8em8lfjFSie6nAbD23I+7w3TNFY1EsWe3KcbFjtyTqq4bXY7Zp15daN3WCFWl5WKjzNtmiYawBctS82524BFpj9RD6xcqOBULxGmDfr438tSMy9yf3SqUeelM4jAxWZ3sftEfeLr3LKkvjc14dHNPT6mVpA5nyzdohnQ3Hq9X0TxGkJJMmhUYkrfBjM2mueoyp7HEbaUWA+8Y0ONZ544NhAndPqY/ARcK4Z+l3ZxjY+siZqnENgqSFlU5LEaZAcvfgbfBe/wR5fCKqhV9hdug6D2utYl1R55g8XYzdzmJvbsusQz7Ch5kx+7OJZF8bwLQYVd0TS5qnLN4Y0wH49i6mfLBKJs5fdafD5f3xL2KLWeW83sz+trzLU1Nqzn/DwtZnPkCN28gSHEKRxnNOmia4r9+UjHrvvQx3raTV77KcLmEEoN9eWKgMtk1Bqow/DuQnH64so+2r1Y/OU3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(9686003)(6486002)(8936002)(5660300002)(54906003)(26005)(508600001)(85182001)(66556008)(33716001)(66476007)(53546011)(2906002)(316002)(86362001)(38100700002)(83380400001)(186003)(956004)(8676002)(66946007)(82960400001)(4326008)(6496006)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzJ0ZGNoU29zM3VpVWk4c2h3QkViTUlTRFhNeGw3Wkt1MlVNaTJaVStuem8z?=
 =?utf-8?B?VWxFR1dENGFPcW1VVlpYdFJka0pzZ0xEWUZXZEdtbFk0NlJybW5EQldnV1lI?=
 =?utf-8?B?SUprVUsxeUhBQXpSNmZkcXZYWGo4d0MwZS95LzBuaDVFWXBMcmpHRHlUK0F3?=
 =?utf-8?B?eVdNc2JYRmlhWTFkSytGZEVQcHg3RDZPTGd6Z1hrbkIwTWRJRjBMbGRZWkQr?=
 =?utf-8?B?bHVNZzAvNmFvdFA4VGpvTy9qR3ErNTB5RkduREZ3cW5ROFN1TS9sUmZ5anAz?=
 =?utf-8?B?clNvMUxJOVJCTGRvUFZJbWd1T3NiNW1tT2s1UU5UYlFRL3p2cGFKVmRlYXYr?=
 =?utf-8?B?cTh6bWwwcHMrMkVjZ2l4a1JhSW9iemdUZU5Zd1hUaE96aGhRM3NsaFpwU3BN?=
 =?utf-8?B?WU9wTEdEL1BXWlpEMGdDaXpoK1puaUFXQzEvdjdzTmJ2ZFdJWmJqdnY2bmVv?=
 =?utf-8?B?U0tnc1prbnlHTVYxM2x4QnEzbHRGeDJpbUZXV1N2NklWaDJSQWNYcHZEZzFP?=
 =?utf-8?B?R3NvVWw3M3psRWFaY1hMa3pENG9DQXpHd3FaNS9xSTN3VE1wazRuNWFBMkJj?=
 =?utf-8?B?YlhURFhaSVloeGx3cXkwdVo1b1J4d1o1Qi9kTFhpNXl3bkxONDAreFZWYzc5?=
 =?utf-8?B?Z3o5K1BzTURGTWhuMEQxWFhqWUNpb0ZkcHhPcHZoRWVzZFo2QjA5SERPSHNj?=
 =?utf-8?B?bnVoSEZYVGtQaFZDUi8zK2M2MHFzTlpRSVFLWGZHMnRNdUxpQmM0U2JEQ20y?=
 =?utf-8?B?VjF6UWt0VzBBcE94VCtWVWV5ekZTZTN4ZCt1VndYMGpxdWFpN21XQlpvaEkr?=
 =?utf-8?B?UzU5Y0ErWmVlTWtxRWtUTXIyRXNCTkR3bjdoM0t0YnYxcmlMYmRIVnVnRElu?=
 =?utf-8?B?Q1p2azVJSndPcXJ2QXVnNzFaVTgyaEdrQzAzQkhvOTR4eTdOUzEySU1ibVpw?=
 =?utf-8?B?VE40ZElmcStXRHJMekhPNmx4QjJPeGZkd3FsWThwRHhWQTZUYUJFNjhWWjdH?=
 =?utf-8?B?SytmMVRMelc1Qi9FSTNadkRiWDVuZWlla3Z6WjlMVFg2NGdDRitKYXZLbzlR?=
 =?utf-8?B?OWExY0dTMWZMc0VROCtuQUZaZWgzYkRXK2c2VDh1ZTdhMkkxa3FDaXJkN09t?=
 =?utf-8?B?OUJUNVlGWjhOQ3RIWThYVVY2MzdiSW9VLzA1M25vVkphOEpKTmMvY1gwNFRV?=
 =?utf-8?B?blNMbGhSb3FyanJCelNKaGFGNFdTdktWV1R1RE02UitKZTZWZHBYaUR3ZmNS?=
 =?utf-8?B?ZU1jUzljNVVwZUtIM1VlMFNHSmF6MjFSajVicGZnQnlhWU5xeWtGZ2g2bUdC?=
 =?utf-8?B?MXZla3lYdG5LSGlZV2xCVEUwb3BKa3d4dUQwczhpR2V1UHBFaVZobDVGWGpk?=
 =?utf-8?B?SEx6SUNSSExaZDVTVlQ3UUwzbXRtZmYraG1uSnoza0h2RkxtbmVRSDZOTWcw?=
 =?utf-8?B?MW1DMjlacjB3aHBsS0x5V1ZqRG5rc2p1ZjgxM1FvcEZoZjhWeWtHNTFSSm9o?=
 =?utf-8?B?azg4cldOenhiMzJWMVYyb21oWkFKUmthUGl0aWVmR0tGWWYyckVJRVdXak5s?=
 =?utf-8?B?SXMrYkZrZElZV3JrOStmU2JYaVY1OG9qNzVoL2J2VE9RV20xOFZQU0VyVytn?=
 =?utf-8?B?VnB3WDh6djhHbTliZk9FZGFuYm9yYkh6WFhmUVJjZllhdmJxSGd1ZnVhNzk0?=
 =?utf-8?B?eUFKaGp4M29zK0QzODc4RklOdU5tTkdBWFNIUHg0S0o5c05WeVBxaHBValg4?=
 =?utf-8?B?ajV0NmNZMkdWU0htbXFDL1pMRjVWdDMzeXU3eUhoajJiR0tlcEFSYUdJMDBJ?=
 =?utf-8?B?NzQzd1NEaWF0MXhTa1VMUkVablUxSXRMeTRKK0dDb2VtZjdnRUpGV3FrV2JE?=
 =?utf-8?B?cVlwU0xxUndhL1hCQURJcHVXdGNsaTMrZkFBcGpmRitVdUR2TmZqc08yQ2Y3?=
 =?utf-8?B?TTMvQWZoVXZrT1N1MG9BU2ZGQVdMUm9NMU5ZZWREWTBHSE9CV29RUEhSaVRn?=
 =?utf-8?B?SVZRUTRsRVpKY1diZmVUeStuZ0pqQkEwLzdlc1pHOG1kbWtYeUJLMmRNdFZl?=
 =?utf-8?B?QmVkd1pscUtxdk1iZmo0R01GYkQ2ZVBGYThLYjJ0VThyQys3ZUQ5MExDVGMx?=
 =?utf-8?B?enhncjV4eFh5ZkF2UXNmQkVyTWxmcyswSy93TjNzK0VtWTM2RzRaNWRTMWRy?=
 =?utf-8?Q?D8DMZrHt3ddA8SkOMMuYMdc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b577eb40-16a3-49f6-f9b8-08d9bbe47a9c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 13:53:43.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECpkdlbSLzGnEC2OnpvtmC//ulSDuOIGj53jLX1BrjIex903MP1G2Rh3ffTOiIvX6zwn7QulYc9sQhmzinxCtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4762
X-OriginatorOrg: citrix.com

On Fri, Dec 10, 2021 at 01:59:02PM +0100, Jan Beulich wrote:
> On 10.12.2021 13:05, Roger Pau Monné wrote:
> > On Fri, Sep 24, 2021 at 11:51:40AM +0200, Jan Beulich wrote:
> >> In order to free intermediate page tables when replacing smaller
> >> mappings by a single larger one callers will need to know the full PTE.
> >> Flush indicators can be derived from this in the callers (and outside
> >> the locked regions). First split set_iommu_pte_present() from
> >> set_iommu_ptes_present(): Only the former needs to return the old PTE,
> >> while the latter (like also set_iommu_pde_present()) doesn't even need
> >> to return flush indicators. Then change return types/values and callers
> >> accordingly.
> > 
> > Without looking at further patches I would say you only care to know
> > whether the old PTE was present (ie: pr bit set), at which point those
> > functions could also return a boolean instead of a full PTE?
> 
> But looking at further patches will reveal that I then also need the
> next_level field from the old PTE (to tell superpages from page tables).

Oh, OK. I was expecting something like that.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wouldn't mind if you added a note to the commit message that the
full PTE is returned because new callers will require more data.

Thanks, Roger.

