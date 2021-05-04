Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EF37293A
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 12:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122101.230277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsj1-00021k-6z; Tue, 04 May 2021 10:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122101.230277; Tue, 04 May 2021 10:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldsj1-00021O-3h; Tue, 04 May 2021 10:56:23 +0000
Received: by outflank-mailman (input) for mailman id 122101;
 Tue, 04 May 2021 10:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldsiz-00021G-Pv
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 10:56:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76ea8337-7c06-4d40-ad59-1ccda7360c49;
 Tue, 04 May 2021 10:56:20 +0000 (UTC)
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
X-Inumbo-ID: 76ea8337-7c06-4d40-ad59-1ccda7360c49
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620125780;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=24s7pfBxLw5B9HRBk9sZdMZrfIdgjjIhoIOVsbTcupE=;
  b=ZzypOTkg9mRdtXUHeAUZcMST6RRt1EELPXaZUOAJBSoHCsQNwf59ZHho
   m/UDSKmtv4Ftkfq0fL61K0/MX50wE+6pnFNYTLHyIx1TU6mMUVakdP0Ss
   4NzZvgT6U78GjckEEh52embpuKBl9WxpCLHMEbstic/59QZ4X7TbBv8F5
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gFANDSTfiwQX/V7EffnZX9PXR4nJXWLk3fUqqFDQnSvZogL/JmayJrtNueUjqkpoFzKODjiXXP
 7E6ES4aM3RtpCH8ng1KV0sV9KFKY+cprPuUPIiYwnnR79OVCXIr04mAsyIQFH2X+CnD4sS8WCC
 hB/IU0YX1n4gNfXWt6pAmiA1xm8U9AcTRAKLdFI6FIT/xL55BYuGtkSFGXmw5Licxg0fxZfXnc
 21k8iryRH6Q8LZ5EYY4nvarTz7uL3zgyoKR/oFb2bnkP/NLCuYY+A/74soR1p+Yt8ezoMkfCTq
 c20=
X-SBRS: 5.1
X-MesageID: 43122271
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:u7qwCa36i6LhUsnx2gnTvgqjBQB3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdHFebg9AGJY/Cd
 6w5tBfoSChZHQQaa2AdwQ4dsLEoMDGk4+jXAUPAAQp5BLLoTSj7rP7FBbw5GZjbxpkx7A+/W
 /Z1zHo/6nLiYDA9jbw9U/2q65Xltzo18dZCKW36/Q9Bz3whm+TFeFccpKYujRdmpDK1H8Ll5
 32rw4kL4BP7RrqDx6IiD/M/yWl7zo08X/lzjaj8AjeiOj0XigzBcYEpa8xSGqg12MasNtx0L
 1G0gui3vI9Z36w/1Welq31fipnmUaurX0pnfR7tQ0lbaIkZKJMtotaxUtJEf47bVLHwbo6G+
 pjBty03ocuTXqmaRnizw5S6e3pdHEyEhCae1MFq8yY3hNH9UoJvncw9YgxmGwN+4k6TIQBz+
 PYMr5wnLULdcMOa7lhbd1xDvefOyjoe1bhIWiSKVPoGOUuPG/MkYf+5PEQ6PuxcJIF4ZMukP
 36IR1lnF93X3irJdyF3ZVN/ByIan66Ry7RxsZX4IU8kqHgRZLwWBfzC2wGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5PwknXR4RSE38DS8cY0+xLG26mk4buEMnHp+bbePHcKP7GCjA/QF7yBX
 MFQXzdP8NFwke3WmLpoRTYVn/3E3aPuK5YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gXcS
 JFUffau5L+gVPz0XfD7m1vNBYYJF1S+q/cX3RDohJPF0v1dL0EquiOYGw65grBGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy1weuWyNVJVZvqGY/8/qdtcZA/8dKe1MPDSOMyYwtRdhqW
 9FZgNBbFTYDCnShaKsi4FRIvreedl6iAKCOtVVtnrbiEWZqagUNzkmdg/rdfTSrRclRjJSiF
 E02bQYmqC8lTGmLnZ6vP41K2RWaGOcAKtPCSOMYIk8oMGsRChACUOxwRCKgRA6fWTns2EfnH
 boIyGvdfbXOVZFoXxD3qH28FR7S3WFcytLGwJHmLw4MV6Dlmd40OeNaKb26WeXZ1cY6sw2MT
 3OY1IpU0lT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlm3LpeTqK0AF/hI3ZpsOdz0qNUXWe
 aHdwL9FkKgN8oZnyiu4lo1Mih9r3cp1c7y0Br+9W6iwToRB+HRLFkOfcBTH/isq0zfA9CG35
 VygYhr4a+eMmDtZsWHzq+SRThZMR/XqXO3SeZtiZ08h9NEiJJDW73gFR3P3zV7+T97CuHevk
 YXWr5677DMIZUHRb1YRwtpun4S0O2SJ04quDHsCuAwfVsRn2bWVun5l4bgmP4KOAm9vwP+Nl
 mUzj1F89rEVyWF06QGC6hYGxUhVGEMrFBj9viFbYveFUGDcPxC5kOzNhaGAfJgYZnAPbUbtR
 Bh5d6U28eRairjwQjV+R92OLhH/WriYcS8Bmu3aKJ12u3/HVSHma2x5sGvyB/xVDugckwdwb
 R/SnZ4VLUKthASyKst0iazTaTrokUq13tmiAsX6GLF68yB+2fUHUZPLAvDpI5ZNAMjakS1sQ
 ==
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43122271"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwxPL+Czi1+3uath0xc6RLXiIfurmQtRaLY7X+IGZwOpLVuwjnq5JUorY7LeWQSiVh7nyvo9cC+gd67PTfNsTEASK2yU6rdvxHI92H9IwwRihHfR5sCcrLa0R7JFC7sX85aHUBYCOko8nf3XjFMCMTPvbJ1G0tG4UuXptjpg4FtZWEvCZv2jBqviP+vCZbeB4V9QplCJylQgeeRsbmi8YLGUqdsRgLv/fCaaNANjBvaGapjvzRvjqklQOTJwURVGx9tzBNSeNKbwGJK7QSo5/pDk19RPTDY10Qi5UbYqpe76mQlL7B3XyuNde44o7U9CvHM9joDnDYlvV3PYHNzNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcY4ysDXt9Hr533qwosADRT5FVEQ/4539qETJLeVOwQ=;
 b=lZ63qDqWxmt6madIZqPDTi83o5h4iyGi7JyRFbGbFGcShM8LL5ChVFgoEbarFG8b0o2vMCHxlp0sDGqXZ8tDMin0WsE5gVIbqWS/2TlI0SofvDQuiuEQOcg/dKbPn0vc4mosrxBfur4FbpCR1N9itXll9BXutUOUvbMNf9R01fi310AOws+Wq1SHKG3IJgrRgMiJ9WD1nha/lbN24zl2ZBhU5CGPLzrNnSwmLXbDIDK5cmhNvyXz05p1J+hxbTHFU1fiv+vdoCtM7RjrLWm9RjSjWIO7Q8Qenk7n0JPK1s2WSprg8+TkXdZ3taPISv2xBnorHtkl/uQU4TiItUHMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcY4ysDXt9Hr533qwosADRT5FVEQ/4539qETJLeVOwQ=;
 b=C3H6lywyXDYY733qXrkp1FTMZiRcvq3/RLMkbbuImXts5oidIBkmo0ikAiLyxo+/v2sMXVWem5ftd06Mb4rkR5DGUeGt5Bj4Lol6TNstJWKwQOAhEJPdga1R5FBaMpxbZR9qa6+KOs/Zx+5KPNfcazdC2RW3KvJomHCk9k9sIxQ=
Date: Tue, 4 May 2021 12:56:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Message-ID: <YJEoS6P1S6NbySFd@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-4-roger.pau@citrix.com>
 <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
X-ClientProxiedBy: AM0PR10CA0097.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5691a7b-f310-4d92-6f32-08d90eeb3e43
X-MS-TrafficTypeDiagnostic: DM6PR03MB5338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53387C724FA5E5D0EF0071DE8F5A9@DM6PR03MB5338.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4m7+NTXHdTe6fyd3gvhlZBMosG+GK0MogHRc6QOiWnC8TKYYr4bmCvQN5f4UsnaDS6/T194EWWokyyBnh31asl4PUtfLPHK3Dq8F2+xCF2y9rV1LwvqfjsOjqeCOr9hHIHCXN9cEFDqopyRT5oqnCu9t9i6IVNLMF8/ORB94qfEeJNTRMNxEsKXA56br9Or4lM+s+4BnoXZb6RKfdBcdLUFMraqo8cWJv5FCjmMbR7MF3uqPgjsdXyyflNgP186NYH3vkhAXM8EYpJHrALMOBBjlcgKKQnLiRFNkrHvkwIUuGtfXleG8f2KMiZFos+bXBvfMImrnTV5RG7nhzQMAPGczdD9/VSyKD3obKwQu7bQD9nA7AQbXA4AKue+AihEsVqfYrmDYRigA9/JGRpp3bOEyEuXkLUaIdWZVkKrXc5kFihnM3J2rAY+uli6ef2SnM37tMT91lHsCKC8Qt33BzU+BQIOfgGYHz8zta40n6wIlYmvBDlzYakhT/ULQ3jdjMUZRehkxFHIL0XE1LsKs381AfJnt6QWh3X4K2muDzImuWlsXFY0nVjMGHktT0XdYBUCkVf59uKrK4khp2tTmy7CcIYR7zKlTr1VHCYlC8VU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(53546011)(26005)(8936002)(2906002)(6666004)(66946007)(478600001)(186003)(85182001)(38100700002)(5660300002)(8676002)(9686003)(6486002)(956004)(66476007)(16526019)(66556008)(83380400001)(6916009)(6496006)(316002)(4326008)(54906003)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cmJMTHg3NEFDcHZvang4Zkk3MldHSTQ4c1dmZmVzc1NRRURQcWhHMGprVHBJ?=
 =?utf-8?B?OVV0UGVyaHhVS1MvSkllTHoxZ1I5SDFUTE01elpQR0FxWkxzcUIxV0l5SXBh?=
 =?utf-8?B?WHBYdEhUMGNsOXhucHFteEd2dlNXR3cyVWVvSnB2eW4zSitnYWlVQW1TUDVk?=
 =?utf-8?B?bk92b0lWT2VtRk0zczNKZjV3UkMzY1FXMVlCN3JIVVJVcW5mak4rQk45eS83?=
 =?utf-8?B?aVZJUFJsZmtLM1NOZUNua3FvUjJ3Sy9BRTVyNFhjM2ZIc3lFVjZkWGRjN3ZE?=
 =?utf-8?B?aXlZVStwTnhhSzNhUDczcWlNbmsvTlNVWDFtY2h6bERSSHd1WUFwckJIS3dx?=
 =?utf-8?B?aE5GcDdvbFNJNHN6VFRnZnNXd1N6N2xGSnlVL25LUGErMVRvQnNwMWp4dmN1?=
 =?utf-8?B?MVhTbnVVbDBqcHNHVTR5ekxuWVpQUXpWRjVqRlN1UU91SSs1dk5oN0U4Wk91?=
 =?utf-8?B?OFg2YlpWeU1mUXBwVFJPR1YvbnpXbUV6SlAybGJlY2hwU21yVDYxbURseElB?=
 =?utf-8?B?Ry8rRldUQlJMdWp1QnUwMFBHUDFUOWVLRi9aQzNnbThuV2NTc3dKdW5YbW9B?=
 =?utf-8?B?UEdTZzJZOGc4T0JlRUdJYnc3bTZXcVltY3Y5c0I4MERPYWcwZGkzTWRzSVg1?=
 =?utf-8?B?dEVPNlFYeUN6RGdxNEJXbTkvVzBxTk56UTFKeXNjNC9kWkVtaHZNZkoxUHEy?=
 =?utf-8?B?dUk2NDd6eUt3ekFGVFVZRmRXMUpQOTM1WktkTGRaUUlxRTJjZUt6ZTJzdGRs?=
 =?utf-8?B?SUZVS3Q1eTVWU0I4NTZ6ejl1OHJPWWVEczVYdDZ3Q2Fod1NlUmc0TnNrbnZj?=
 =?utf-8?B?SFRxRmM3N1VUMUdxT2Rib0hVU1Y5OTAxeng2VDJYbjFvSm1JdHI3dWZZY1lK?=
 =?utf-8?B?TEEydEd1OU9KK3QrdUlWZEZtTkR5VnRZZFovamR0RGU0TkpBTkhBSW50b3Rw?=
 =?utf-8?B?N2hvYTNoekpnZ05pK0lMQmIrZUxPaFo4QmN5RlQ5L25zN1g1VGthOTE2YTRk?=
 =?utf-8?B?RGNUV3JWczYwNVhiN3VSUlNWdmJNeUI3VytTc1RpOWU4dzhxSFhZMjVkbHlo?=
 =?utf-8?B?MTF4NE55Myt3dHduL3BCbjlKQjZyempCczNJdFNpbXdqeGFrL2JWeEVXZUJ5?=
 =?utf-8?B?Z0pCTnRjSnVhTnJJOFNrYStta3VHTTgrYlkxQVAvWWVvVEx1cFZzZnpESmU1?=
 =?utf-8?B?WU9EV1F3MlNOamxGcGM4R0w1VkM1RU9sS1Fjd0VoeDZSclh4NkVZTWdxbmhN?=
 =?utf-8?B?MXNaS1VKcTlFM0NzcFpuTEpkQ3dVZThzL1FGWW5JcGZZSG5UVS8xc2krQzNz?=
 =?utf-8?B?Tk5ldklRUDFGamM2TnJ0NHBTd0ZyQWVQbFl1L0Rja0l1SmgzSmJveTVpRldT?=
 =?utf-8?B?T3A3ZHlLaGg3SlBncnYyMzJ4NjdPaFdOTWhBZjZFNFZER1VRRVlvdkRNVXhI?=
 =?utf-8?B?QzI4Tmg5MHlpY2ErUkxmZzhVdG13ekNNanl2UTdYbHA2R2Rqbm5zZHZVOVh1?=
 =?utf-8?B?TXI3L0owUTdxdEN2bitqUFIwS3E1bmJyekU4d2cvZ2t0Rk1XUkUzU2VoaXJi?=
 =?utf-8?B?ekJjWDAxd0dZRmthdTdNK09QNmJoclhzQ1pnV1JNYW42eTFWQVM5NFVTNENH?=
 =?utf-8?B?MHRoM2k1dUg5aXRsTndVUk12MktYRGgxOHo5bHVLTUg0ckZLNGdzZUI3ejlv?=
 =?utf-8?B?QUZtZnltVnNmNzEvQWUvU2IxckplaXNTLzFrNGtjSEY2enRlQkNOQ29PbC9S?=
 =?utf-8?Q?/kuwB1CGP6nY5ZR65vSocxu5mUj1m+/773Qk6D9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5691a7b-f310-4d92-6f32-08d90eeb3e43
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 10:56:17.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78lGe3i/xhIG3j+dd47oTUHrTIZPhO+s9EIjoFV6ud8+k8kgzELyM/c1gikagWm6BBNBllTemF8Uw+bNWESOkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5338
X-OriginatorOrg: citrix.com

On Mon, May 03, 2021 at 12:41:29PM +0200, Jan Beulich wrote:
> On 30.04.2021 17:52, Roger Pau Monne wrote:
> > Introduce an interface that returns a specific MSR entry from a cpu
> > policy in xen_msr_entry_t format. Provide a helper to perform a binary
> > search against an array of MSR entries.
> > 
> > This is useful to callers can peek data from the opaque
> > xc_cpu_policy_t type.
> > 
> > No caller of the interface introduced on this patch.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Introduce a helper to perform a binary search of the MSR entries
> >    array.
> > ---
> >  tools/include/xenctrl.h         |  2 ++
> >  tools/libs/guest/xg_cpuid_x86.c | 42 +++++++++++++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index cbca7209e34..605c632cf30 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2611,6 +2611,8 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t policy,
> >  int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
> >                              uint32_t leaf, uint32_t subleaf,
> >                              xen_cpuid_leaf_t *out);
> > +int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
> > +                          uint32_t msr, xen_msr_entry_t *out);
> >  
> >  int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
> >  int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index de27826f415..9e83daca0e6 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
> >      *out = *tmp;
> >      return 0;
> >  }
> > +
> > +static int compare_entries(const void *l, const void *r)
> > +{
> > +    const xen_msr_entry_t *lhs = l;
> > +    const xen_msr_entry_t *rhs = r;
> > +
> > +    if ( lhs->idx == rhs->idx )
> > +        return 0;
> > +    return lhs->idx < rhs->idx ? -1 : 1;
> > +}
> > +
> > +static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
> > +                                   unsigned int nr_entries, unsigned int index)
> > +{
> > +    const xen_msr_entry_t key = { index };
> > +
> > +    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
> > +}
> 
> Isn't "entries" / "entry" a little too generic a name here, considering
> the CPUID equivalents use "leaves" / "leaf"? (Noticed really while looking
> at patch 7.)

Would you be fine with naming the function find_msr and leaving the
rest of the parameters names as-is?

Thanks, Roger.

