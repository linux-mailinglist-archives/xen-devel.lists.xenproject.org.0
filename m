Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C14DDC36
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 15:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292001.495951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVDxU-0001Ue-Qq; Fri, 18 Mar 2022 14:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292001.495951; Fri, 18 Mar 2022 14:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVDxU-0001Sy-Nc; Fri, 18 Mar 2022 14:52:04 +0000
Received: by outflank-mailman (input) for mailman id 292001;
 Fri, 18 Mar 2022 14:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6Ef=T5=citrix.com=prvs=0698cd8b8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nVDxT-0001Ss-C2
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 14:52:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f695fd32-a6ca-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 15:52:01 +0100 (CET)
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
X-Inumbo-ID: f695fd32-a6ca-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647615120;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mIjmQgwIX1rtxD4Wey/AD0tUq87oAGlPYqX+MP6HkDI=;
  b=ECQ3Z1JkHBVTDl7kIFsPEFe7++zJ3jpw3WWjTwMbkN+0aSvDnJmjfbgH
   fzHFuP90e7mpzFpBauEQ2Qr02G9SZjeIRxXTpRnu78uSv3uwIYebS86GL
   b2kq/rARmvqRwfpRAJI0cI1YcbXTORMeWMSwqct1BF9X28qFXCcdLKJph
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67010558
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FkaQBaqeRCJJBh2+hB/Jbmn+AZFeBmI1ZRIvgKrLsJaIsI4StFCzt
 garIBnSb6zZZDbwftsnbYyx/BwCvMPWndY3QVFqqC02RCoW8JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 IOq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBOIPeorReViZjLRokGJxlxI6ZJFi0rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxM0yZO0ASaj/7Drpvsv26jWHkXAd6l1OHhbFvz3GU/BZuhe2F3N39JYXRGJQ9clyjj
 mDM8nn9AxoaHMeC0jfD+XWp7sfQmQvrVYRUE6e3ntZoj0eU3Xc7EwANWB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeQxI47
 A/KmuzSOwc1lYy2dUPD85efsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczV/MBuaL9UdF1M2xpjGGeE6bKIN8N9nwlBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpP93sVZ1zlvC9TY2NuhXogjxmOMQZmOivpnwGWKJt9zq1zBhEfV8XZ
 P93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzhwVaWOnet/J+SIXc19z4/1w
 510YWcBoHLXjnzbMwSaLHdlbbLkR5FkqnwneycrOD6VN7ILOu5DMI93m0MLQIQa
IronPort-HdrOrdr: A9a23:I+LySq/BBXzdyVOXJmNuk+F4db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYW4qKQ0dcdDpAtjlfZtFnaQFr7X5To3SIzUO31HYbb2KjLGSjAEIfheeygcz79
 YZT0ETMqyTMbE+t7eG3ODaKadh/DDkytHSuQ629R4EJmsGC9AC0+46MHfgLqQffngdOXNTLu
 v62iMznUvYRZ1hVLXcOpBqZZmnm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4k/Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXIISaCUmRMXee
 v30lAd1vdImjXsl6aO0ELQMjzboXITArnZuAelaDXY0JfErXkBerR8bMpiA2rkAgwbzYxBOe
 twrhGkX9A8N2KxoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIeLH4sJlOz1GkcKp
 gkMCgc3ocgTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNwd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDmRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dg/22J6IJzIEUaICbRBFrEmpe4fdIi89vdvHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,192,1643691600"; 
   d="scan'208";a="67010558"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCeEAFDyhc4DHxs3/b/u/AHVJdt82pdaLQCysef4IulmNy0pNFRwEvbP4FyjWdvnhznaNgwpCpcwVRe/tmsN6G0xiKGLMkU90+pkw4e2qfl2vXZ9ruHZ4DfQrUlPz3DH/bAN5jvvih0Vxc2QpJ3TaaZ1r6zZVodViGYtJepVM/RVFFyopo3Fg27hMv+Tueha6XkJwe7DfFGjIlTh1uo2e6efkvpk/C+dmxMubNc+ZlvLIeMpQn5rQ6krL/HLRGVGNlsqqt1TBUi0KGyEoqbviAooniilUggOGlL3V5Q7yDK98M4shgTBuwrM7L/1tXAxTye+ITXjeStDGXy1QFA0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIjmQgwIX1rtxD4Wey/AD0tUq87oAGlPYqX+MP6HkDI=;
 b=R3ktmgwyumPeAr7P5i/lECaps/JWc5W1gwBqIZbioNgZUGmNDGWadqTHUh9vMme90FHHn3NtSA4tbEpnjugoJ+GrDIwLxBDtWfjbN2pg9J2klqLjjjZhtZ6DbUYBnQV6nSifvQMxotQE6CRtG5SfqVxLPuMn9uktXaAoJgmexXkP3GHEi6LUdmK6iHwNQwwuKogX1aTVwso2HdwP9hYNOBcip74+m3c9aDhZG3T8fxiY58pcm+yvp/2dKUCflHlZ2ziCjaIlbYgsLJvLP2NippmuHsc2EpDkEXMW8shXGJ2Z1e6xznc2k4zCaGnhFoS+4oYCWueekTjlghtbGUVLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIjmQgwIX1rtxD4Wey/AD0tUq87oAGlPYqX+MP6HkDI=;
 b=DhPPygCAIwBJYYgypKsP7fxhCvgdk9xQUE0S+jW258EfQ5QbpaXODk9g54Rg9mAauxhmRW1FpqoF8RGEIOL5Wf/XJVP8R3VUXWNGlbwhcKKqbAFyR6ccs8tn2UVp4sl0IPJr4F0abZ0tcn3oq0YiFP6SOo79iCFMt5rUqRkYvpg=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: drop dependency of XEN_SHSTK on EXPERT
Thread-Topic: [PATCH] xen/x86: drop dependency of XEN_SHSTK on EXPERT
Thread-Index: AQHYM6mz9BpISaLxN0e/wtmKcLCulazFSBQA
Date: Fri, 18 Mar 2022 14:51:52 +0000
Message-ID: <072dce39-4cfc-64c0-a96e-4725728c0f05@citrix.com>
References: <20220309113441.22746-1-jgross@suse.com>
In-Reply-To: <20220309113441.22746-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63bfabcf-a77b-4af4-f099-08da08eed6d2
x-ms-traffictypediagnostic: CY4PR03MB3349:EE_
x-microsoft-antispam-prvs: <CY4PR03MB334996037BE16F76D8122B49BA139@CY4PR03MB3349.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r20BQ8DQSqUiFBkcm5/nHFLK1BfXRXXI9PlSP86i1hdjTwjjzkaAjXvrJuCNFaw88OlWu1oo/MzdWFTGy5f8BNotlukvqE4QU3dkPy8+Fd3wRypCGaKnA6JexzbdAffQdmjCa6UfBT3DOjtqkAitNb3K3jSWIBx3S7/E9BEbFBDRYwDDD6xombPRmkRfVLge68Dsx/BhCoO0RJeWHGyR13hU50e1BAsXzVP4kvnOtOYz9jqMOLXMP2bPvttLi6sRdZAiuXnrtMmNe5/YjzxvdWRUALMIlYRh89LX+gIDZO4jL1yQVjJxE2Nvr7Mn2SuXeimuq+gy3H1GF8utU8PVUSbis0XZi0Ubsf1F0PUPATyJ0oeRW1aalSWzbtNj5O3E7VpfhuRGG8qqx3W52mKlHvOS5byIDp6LkJcv7+0Fwg8VcdUwhPoTAnr+EhaMNNuDSoo7coUxJmGxrV7OQjdGyLTQP8HILzGxCqPUo5nCzfIum6sBVoSsaYKwMl2nsBggN1esOWiRH8aG8SpOrG5BqweA99zH2AoAN+5G2xJcTbbxA852C+juFTNTnL9dKoP/fwWSABJp1JmeGlX2RVYRAmlHz4t63a1CPl2bV/cQ+I9YLucm42+NQKqiCI+DCGRxoCVe38Ss4+Wp36xxCje4P6peZMCwg+EagRe4GqSuTkF/76UDhMT5vEwdi3GnmEvTq7blFFN7qawQZsCSvaclXJGzDHRHgesKP3+ylzLdR4gNonJ5AwRgMSltyBq/tguXc3XGR0d/4B6LO3OVVUO2Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(186003)(6486002)(26005)(91956017)(64756008)(66476007)(8676002)(66946007)(4326008)(66446008)(66556008)(76116006)(38070700005)(6506007)(53546011)(5660300002)(2906002)(71200400001)(31696002)(6512007)(38100700002)(316002)(2616005)(122000001)(8936002)(83380400001)(82960400001)(86362001)(31686004)(36756003)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ltN2tjWkhrcjVGWDVMN0h2Znl3Y2dIeVhzb3RabDhjYnU1T01aMSt3Um1Z?=
 =?utf-8?B?STlFVmhPWGlicnYzN3pOQUFrNzRCZnFBeXZVelM3Y0F6Z2tDWDNFN0pZaDRP?=
 =?utf-8?B?MHJYY0QyWDkzWk1xbTMvZ2ozYTBhdWE4TEhSV3ZRWmlWZkNnbkNVWGlnOXc4?=
 =?utf-8?B?RlhCRTBlYi9ESVNpOCtRRkRZalZnZEhaOTl1ZFJFWU8zL21TU1JGcThFVmRv?=
 =?utf-8?B?T3NSSjNlVEMyV2prRWVCWFl2Mk5zYjlZY2E2YXRGZWo5cDVWRjFKb015WUtN?=
 =?utf-8?B?STAyMkhTd2wvYmh4T0psWWNGY05HbHVMaEZVY2VPN3EzQjhCdC9rQ0lzaHBL?=
 =?utf-8?B?Smx5VTJ0NXJtSXI2MThXSUJjYmFUZzltekp5RW43V1YrY2h1L0k5U1pYa0VU?=
 =?utf-8?B?N05LQTA3eXVKVVgxUTY0c2VoWkJDQmF3bnFyaVFJR2Yxbk9mczJManRsVTU0?=
 =?utf-8?B?YWhFM0lDR2Q4TDNzRHJxczdKRWRVbFNISjJRN1h2cG5IS2xSeklRWUhYQzMw?=
 =?utf-8?B?TnZydFlyYWJtbWQ2WTNKcE9BSHNiT2RtditraU9ISmlDTW9wSnFVaUxUQ0I1?=
 =?utf-8?B?N1dtWUJDWDN4OUU5YzVYWDNFdEkybEZnSnIzcjlSVHREVWdhQnl3S3huNlBj?=
 =?utf-8?B?alhZUU15SWwrZmdrU3UrUUxIRDZzM3c5RG9PU2FJSmxiK2RSaFptNWZONWlZ?=
 =?utf-8?B?WlN3UWhKOEo3TFdVTVdqUjk5QmRaZkU4R0xKays5VDFrZEhDTXhoWG9GYkhV?=
 =?utf-8?B?QktVL3pjRzQvZDZsa0l4ZVVkekp1cENZRzJpQ3pqNUs1aEVXdkVvN0ZBNldh?=
 =?utf-8?B?WGlqUHlhTXNPTjBGTnpOMkltcC9oM3MxL21Iakx0VTkwUmNKZGZsd2MwamNh?=
 =?utf-8?B?TWdJZDFpN3ZoU3pEN25KVlpUUlcvV1RKdGQrVGYveHIvdlhTanNBRk1KNDNz?=
 =?utf-8?B?RHc2V25OYktpZ2hQNm1aM25BNy84d0cwNFJxT1kwZjBpVTQ2TysrRTNVNlIw?=
 =?utf-8?B?NjdMSnBiOEVJMWFiWGNtL0daUlA4KzJIZnNJOEJ4dXdLaUlhVU8vWEszb1Ix?=
 =?utf-8?B?OFdGeDFFbGVRV2FWSWZ6L2ZmODQ0aXNXenZsL1lGUktQTkxqcXFzK1N5ZFE3?=
 =?utf-8?B?TGRCK1hlTWRKZGxKcU5aditYYkprRzQ2T2tqazFKVXFmK3EyR0UwY0FzbVEy?=
 =?utf-8?B?c1kyVnlNVXJMNVBIN29NQzBuS0UrTXdCODFseE01SEpWZENLVXY5OU12b3Rq?=
 =?utf-8?B?TmRSckIrS3B6ZStiMHZUZ0hMZ3dCaUp6TWg3Q3hqTWZMT1VVMUdTT05sYjJs?=
 =?utf-8?B?USs5WW80VTdLckNzenE2RVVkQ1YvanZkTVgxRW9pQThRRlh2S09OVVJSS0hs?=
 =?utf-8?B?MHIzVXRSZUhuTzBQSk9WVGlQaEFLSHFmZVkwMFcwMVlDUGlXM2Z5Z0l0SVBJ?=
 =?utf-8?B?RGI4QlBSUXRBZWVWQXN5SU9NWi9TVWNpdThLYnhPWUs4UTE5clhiUEUwS0ls?=
 =?utf-8?B?czkvWS9rbW53UWxsSGhwVi9GTW1nZlE3aUphTFltbkF0bmpvOW1Id3czS2wy?=
 =?utf-8?B?LzlmaUUwTjNQODZjOWl4WEQ4L1BsOUZ3cmVHZ1NuTXNPUlA5Wi95dERiZzFM?=
 =?utf-8?B?OW94UHFvUzNpWTVwWFdic2RBZGYxUUFHaHNOOVZJT3N0Z1ZOR2MrQUVpVVl1?=
 =?utf-8?B?K1h2YTczMlhwa3RoU0JWWFJ0VUNHejFUelY5M0trTldyNThNTU9WWkd5RW03?=
 =?utf-8?B?SFNiN1BpZHkzYTFSUHp6engvbWxGeUIzNXlJVXlldkVxakU4R2xKR3FZZHNP?=
 =?utf-8?B?cWg3UWVPcHRUYldEZ01BZlNDZnVXK2hXb1J0MlVJR2pFSWdkcTY5SHhUa0Zo?=
 =?utf-8?B?K2x2MS92T2tTamNTZUp0OWowZUlndWx6WGhpenptYnNURzVaUVAyUU9SZ24x?=
 =?utf-8?B?ZVg3eGJvclg1Rzd1OEpWbTRlMjJkTG5JaDJoWGFYbTdtZlpTOERmUkIzRDlo?=
 =?utf-8?B?QjNmNGFTdll3YnVTcmY3ZE9iVk0yMkNmMXNoNzRPRXJoN0pPcVBPWENWT0d0?=
 =?utf-8?B?RzdFKzlXaFQ2RklGaTZkamVsZ1o0aFRRSklDY2xqdFl5VER0bUxJQmRYdWJj?=
 =?utf-8?B?ek5BYlFBNm5kNWQyamxEQVJId0g3ZzBBd1ZXQ1ZETTgvUm5QMkVYZ2gydzVt?=
 =?utf-8?B?NnBUNERiTkxObUZXbk0zdk1SM002WHlocGRIZGJ1bk9kaVBYQ2lqOEtidnBj?=
 =?utf-8?B?bFhCY0VBbU9IZWtzS3pSZjkxZVpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90CAAABB222E2D4CAF69C9B3901E1F48@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bfabcf-a77b-4af4-f099-08da08eed6d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 14:51:52.4952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmgUbUeq/eu00nEI0IQQd4+6fJsuPbLqydDBN7eQe0EzUN9KbiDDFFbBs9NpAaAOpJ5UMt6kLZ0f+e24Zh9H8+OO2N4sJsqUKlLfwPd+To0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3349
X-OriginatorOrg: citrix.com

T24gMDkvMDMvMjAyMiAxMTozNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gWEVOX1NIU1RLIHNo
b3VsZCBiZSBvbiBwZXIgZGVmYXVsdCBub3cgdGhhdCBpdCBpcyBzdXBwb3J0ZWQgb2ZmaWNpYWxs
eS4NCj4gT25seSBsZXQgdGhlIHByb21wdCBkZXBlbmQgb24gRVhQRVJULg0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IC0tLQ0KPiAgeGVuL2Fy
Y2gveDg2L0tjb25maWcgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvS2NvbmZp
ZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+IGluZGV4IDgzZDBmMzE3ZWMuLmMxNjZkYjM0OTkg
MTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnDQo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9LY29uZmlnDQo+IEBAIC0xMTcsOCArMTE3LDggQEAgY29uZmlnIEhWTQ0KPiAgCSAgSWYgdW5z
dXJlLCBzYXkgWS4NCj4gIA0KPiAgY29uZmlnIFhFTl9TSFNUSw0KPiAtCWJvb2wgIlN1cGVydmlz
b3IgU2hhZG93IFN0YWNrcyAoRVhQRVJUKSINCj4gLQlkZXBlbmRzIG9uIEhBU19BU19DRVRfU1Mg
JiYgRVhQRVJUDQo+ICsJYm9vbCAiU3VwZXJ2aXNvciBTaGFkb3cgU3RhY2tzIiBpZiBFWFBFUlQN
Cg0KSXQgaGFzIHByZXZpb3VzbHkgYmVlbiBzdGF0ZWQgdGhhdCBhbnl0aGluZyBoaWRkZW4gYmVo
aW5kIGV4cGVydCBpcyBub3QNCnN1cHBvcnRlZC7CoCBzaHN0ayBpcyBzdXJlIGFzIGhlbGwgc3Vw
cG9ydGVkIHdoZW4gY29tcGlsZWQgb2ZmLCBiZWNhdXNlDQp0aGF0J3MgYmVlbiB0aGUgc3RhdHVz
IHF1byBzbyBmYXIuDQoNCkl0J3MgYWxzbyB3cm9uZyBmb3Igc2hzdGsgdG8gYmUgaGFuZGxlZCBk
aWZmZXJlbnRseSB0byBJQlQuDQoNCk1vc3QgaW1wb3J0YW50bHkgaG93ZXZlciwgaXQgaXMgc2lt
cGx5IG9ic3RydWN0aXZlIHRvIGhhdmUgb3B0aW9ucyBsaWtlDQp0aGlzIGhpZGRlbiBiZWNhdXNl
IHRoZSB1c2VyIGNhbiBmb3JjZSB0aGVtIG9mZiBieSB1c2luZyBhbiBvbGRlciBjb21waWxlci4N
Cg0KfkFuZHJldw0K

