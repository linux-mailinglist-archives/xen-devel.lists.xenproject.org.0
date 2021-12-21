Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6FC47C741
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 20:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250566.431594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzkZI-0004Im-Hv; Tue, 21 Dec 2021 19:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250566.431594; Tue, 21 Dec 2021 19:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzkZI-0004Go-EQ; Tue, 21 Dec 2021 19:13:00 +0000
Received: by outflank-mailman (input) for mailman id 250566;
 Tue, 21 Dec 2021 19:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w49/=RG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mzkZH-0004Gi-2F
 for xen-devel@lists.xen.org; Tue, 21 Dec 2021 19:12:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd6d7b5-6291-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 20:12:56 +0100 (CET)
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
X-Inumbo-ID: ffd6d7b5-6291-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640113975;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J9NYbu/kHOPgj3IhyBA9pq9cWrzYyWuHrP+Oarrq1Os=;
  b=Cl0lsHSekpyv2IrmftrCXNPYYylqSkKALYTfU98Zr8TM8V2pX3V3gaYc
   CFjbGZlnslPloGPWtttB4+RmGDp8UO/QVqiBtHD6ToETx6o8CKGzN/fL3
   5eVU7BbE6gP6e2hVpjfgf3/GY/v5BBxPJeZWrj8nBaluZvt/zPLu8QZud
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /S3n8RiVb1RLYUV4Ld5A+Og+9p3VApUCnCx1lKB7ssGMHR7K3CKMfyJM8K7wcmzO5QXUNLSe0H
 QWalU54Mig6/Pwo20eAuBoTXbb3HcREoq+wAQv06XkWMtRfEBiGJZ92+8GG1vhPbXHX0HPqzky
 PKWr3XIisiGc0sYE/SrQoPoPMCfESqsxfh9SdXsFKYVB0RER9uYtJIADmVMxU6FGAVl26oYYPy
 b6odSz+IMwtzi4Ivxno5g8moDJjIjppZKRPT3XPBF5lbir7HzYTkMVIS+h26F0fIrbQGCB60IG
 DRzYnmT6s7/+hqP4+YkJtm37
X-SBRS: 5.1
X-MesageID: 60033516
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eRFOHqyU/Fd/NNYScGR6t+fkwSrEfRIJ4+MujC+fZmUNrF6WrkUDx
 jNLUWGFaPbZN2SnKN8gPti3/UJQsZGHmoJrSAQ9riAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500s6wbRg2tUAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Fty
 8tdrZmgdTkSLLbXs9YEURoJQwgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYEAhGxr25kQdRrYT
 9AHWB1WUzbmXwBeHFctVo8etqS2nFCqJlW0r3rK/PFqsgA/1jdZwLXrddbYZNGObcFUhVqD4
 HLL+SL+GB5yHNKe0zeA/26hgfXngDj2QplUD7ql7PVnjlqJyWFVDhAKPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPHcQx6msGaBriIiYMhLCMYI8QOOm/r9tlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2LDwpJDSsjPeZJgrBED3CBtZ6sy67DETG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWj1oyT+ItwKuWokTKuMDiriUWWxC
 KM0kVkOjKK/wVPwNfMnC25PI5lCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4oFapbRlUwACLaWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ijVtpZwxAWtiHvZBx+Nb3w/OrrjUYwm9SAwPDA2PEbu0H8mON794KAafpoxXL8m6O08kqIkE
 6hbI52NUqZVVzDK2zUBdp2h/oZsQwum2FCVNC2/bTlhI5M5H17V+sXpdxfE/TUVCnblrtM3p
 rCtj1uJQZcKSwl4ItzRbfajkwG4sXQHwbogVErUONhDPk7r9dEyeSD2i/Y2JeAKKAnCmWTGh
 1rHX09AqLCU8YEv8dTPiaSVlKuTErNzThhAAm3WzbeqLi2GrGCt9pBNDbSTdjfHWWKqpKj7P
 bdJz+vxOeEslUpRt9YuCK5iyK8z6oe9p7JeyQg4TnzHY07yV+FlK3iCm8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4H4l9bWKZkxeIh2QhXEPN7ByKo4kn
 b8stcN+B9ZTUfb23gJqVhxpylk=
IronPort-HdrOrdr: A9a23:SfbrX6kmIb0rnyiFsh8N7reccvrpDfLW3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRUdcLW7UpVoLkmyyXcY2+cs1NSZLWzbUQmTXeJfBOLZqlWNJ8SXzIVgPM
 xbAspD4bPLbGSTjazBkXSF+9RL+qj6zEh/792usEuETmtRGt9dBx8SMHf9LqXvLjM2fqbQEv
 Cnl6x6jgvlQ1s7ROKhCEIIWuDSzue77q4PMXY9dmcaABDlt0LR1ILH
X-IronPort-AV: E=Sophos;i="5.88,224,1635220800"; 
   d="scan'208";a="60033516"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYtNcnpWL3GGTnmsKfMBzLA0U5TUfrCYsr7Cs9ct/8UeXKNM351eZy/hD8IDuv1lddOP2yJ8/83glr/HL342WyBU9FfTeTUfqxn7t22GLqmgIRYB4ifBq5Rh9xUSNnQe1BiloDEYd7gby7yU0I/cwEotPcgicDdEzprwdrlpdrg9yoZu/i8SKggd13nQGQZUhDefcwi5ncPv52o+mdgYqHf0xF4rtHY3Fq15aPvyQXCVBW4Xoe+D0rJpUX0URq86DkxbIj10I95lvUv0/Pexh/u4OUzDkaxlPlGcVy618RxuO52aF7NFt1sKjeCghTdkimL6M2pCZXhLQNhTX8zu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWdKMvlEoWxZybBEeTsgWO7k5zIOnb5fTz8ugdNq/Nc=;
 b=hJMQuQUMkHwi1lmy6IIyclH8A/vzO+eKQv9XqaBrxZqEPtqspjn00aComSIWYT3c80LdwiJpDkpsGweSJ0dMBUItW0NDTc1uVyEMbSHBr0DAwweWzOrrXyq1EPSxXdojvJGrC+4u/KCn3StKkSZv9TgjLkJLG6ZZLe3pYKu5ztwxWTcdKoahrTx6Yp+ezAFqSLiNmg46Jy1h97ppqAaOZHSgNKaz8A89gXH4VlELu5UQNB8yQ842CiUg6VfrXmYP0A3+/OFHpr6aYxzepwDbB31n3ZVPwFc1ZPS7AaFvXv2L4xsUJ8lms21lvVMmWy/2OnEhVJEF0Dy/KAw2WhpLew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWdKMvlEoWxZybBEeTsgWO7k5zIOnb5fTz8ugdNq/Nc=;
 b=el+LSdbw6e9npgbxFKGq3V1R0fIZoqXc+Yj6hMtVumCZ+Pi0NCmjyg7Z2baSj3/McYqZOrFxdHa1yclN8qXXI1vLy7SgDywHsXE6UFvfPRA8AkR8f0QRMcs9pG3PKe8TAwdkYGhULvTIS2M6Q6kVoYa3+E5bFGYBs+7eJNkA8UM=
Date: Tue, 21 Dec 2021 20:12:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: xen-devel <xen-devel@lists.xen.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YcInKtCNgA9v0k+c@Air-de-Roger>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger>
 <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0018.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d3a32cf-edc5-4dc8-8764-08d9c4b5e0a6
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2554F421A5720AE4AB8434318F7C9@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlLw9NgZfj1FqQiv+vrFtmj0rUXCYgbMsD8ccWpYlXvrZYuHZGoADGCxRUcbkjfxkBFys9Tt/9PFSKRlVGyxbhMdI4+HRAqv02MqgbauceyhPHihnGSxwhhWUk8gWDz+fJLyeKVTYU/A19pC7N15By3+qusafvINRz04MB4r2IaQbLVEnRJczDwDL8pMQY/upaObDx1tQxoLO1uK6ol3vHHu5H6tPpZ51BbHlpkVby6iG5z2vS0couVq5XXKEzxWG+IoehlpmwuYee/0BED5DgYuhdQg+nru6/st3Vc6o7APdEDMs41E2gt1z2fBjJd59CozrgMnOraQwGnvkMJoGp+L9B1feAFcl75uDkFzPd3rEdo627ZIPibSLnJxjzdS2f37PrcwBeMGDPyExWgpZ1tzdDJhB7K1tWWPNyEZkGAQim+aX1IYibM3qZLc2GdiCLlOr/Bv/cNtRsE+GUMbP3dx8/0FdHZh752SkQNFCB/VBMWuIW5vcUB0VXfRA/4PVa5f3g6HqGhYRn9aR564PY7E2s7MyDtnzW/hKtbahTn9/cBsfn6pOlh9BqMxjGXFt/Ajqpl598zA30ry5pzQvoU2mcocg89pevzSk680TMDTlFT/93kBHy3oOkVrQ0RUM0Y3GLmRDiX8MRmT5i0Bpb4/ljQIEGYCCM5pP5XTOiHjvIiUGxrcg59gC8SEL4AsT+GsH4YrLCFA0DLUZcREJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(66946007)(66476007)(5660300002)(6666004)(6512007)(9686003)(66556008)(4326008)(508600001)(6486002)(86362001)(26005)(316002)(38100700002)(82960400001)(33716001)(6506007)(85182001)(186003)(8676002)(2906002)(83380400001)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhKMEI1UWQ0UUdIS0lzNXlBRnVXSUE2R1dnWVVaMXNlQkxiQjRlOFYyMDJI?=
 =?utf-8?B?eXdNS0ExdlhqbDczV1RORHYrdmVKTStkdjZKT29ZU2xVdkdENStOMERHY3dC?=
 =?utf-8?B?VnN5M2tNOXorRWVudGwwcEF0YzQwZmp4LzVta3pUblpmcngxQTFRQTVIRVF1?=
 =?utf-8?B?NnNCc1BFSmJBR0g0Mk5YaXRFUkNzVFpJbWszVVlja0szci9wZlBuN1ZBbHc0?=
 =?utf-8?B?aURzU0RUU3hHOEVOclVBK2JLTmNIeDlIOVEyaGp2bnZWMytvWHN0QkpQcnRa?=
 =?utf-8?B?Tmw2L29RTGVteVRueVRNQVNtN0dRSUhKMlhScW9UVnZaTERTbU1UQWViQ2F6?=
 =?utf-8?B?VWpmbVRrZzRZdGNPeDhuSEg4Um1LR1hUQ1lxaVlSa080YlUvRWt1cExva3dW?=
 =?utf-8?B?eWJaQ1N1OEkvYzl0SnR3eTJ2SUdqSXo3STlCek01SzFUMVJ5NGl2NE00eGRN?=
 =?utf-8?B?NndFb3hjRXR2THJ3QlNreDNjQmZwZUszTGRnNjBraFR6dWN6djU3aWdlbmlX?=
 =?utf-8?B?eWRYa3J3VjRqMjhFazRpdm5YcU1weU9UMkdQRUVkVnd4bG1hL3J2SFdZLzRn?=
 =?utf-8?B?OEdUNmxsem5vQVpUR0lxckhoaVNheEdwZU5nZE9Xbm1leFdRSGpwNlRjaFRk?=
 =?utf-8?B?amF3eEFCTno0Vks0VUl6SUhrc2xWZDdwV3hFczdFTHlzQjBiOG9BYTM1RFJl?=
 =?utf-8?B?cnNiZVlhTWtDQXg0L0ordEZHT0ZycU1oWEhqL05aSWZpRUpPT1JvU3NrVjRJ?=
 =?utf-8?B?eldkbjRkTDE0QXh1RVF2Vkt1N2VtdlNqU3MrMVJabVJUQUVmem42b0FnRkUy?=
 =?utf-8?B?eXQ4ZGY2ZDMrREVXeEM5Rks2ZURQUS9XVDc4NjAzakwyZ2hqQ1F5dlBSM3pq?=
 =?utf-8?B?MFdZZnJxbjVSZ3NxVllvUmJCNkt3VUordXhKSExha29NNndYZ01LcnB4ODlI?=
 =?utf-8?B?WTBvak5xVUV6MVphUUhFZ2MzYmUrMTltR3UrMEpmVHRrM0NTTm9JWVlFRmFn?=
 =?utf-8?B?RTFyeEdxSjJ2aWl3TVZFS3FMejNEQUx3MlBSa1U3SDRDZ2RYNE12UXp0blhs?=
 =?utf-8?B?UE5rWnZxak5nUGxBdzdnVDY2RXVueG94ankxSTJINCtYLy9aZWF3TVFqRitZ?=
 =?utf-8?B?dlpxYWUrUzAyb2h0NngwQnNqZGU1ZDduSDZRUURPOTFneFJXamRpeGROUEk2?=
 =?utf-8?B?YWxrMFp5Y0VVdnJRNThWbW1zWXhFSmQvMWRjSVI0Y0N4VGpJZnBWNGdweW9x?=
 =?utf-8?B?TlpOTW5wTmdxZHRFamhnVlJZS3FvRk1wanEwZHpCcGVKS3FkM0g0UlpONGx0?=
 =?utf-8?B?enpYaXVvTHFWWVlSZnZuMVg5WWtoRHpsbmlNcHNZOTdBZm9JSHJ1cm9CUGZ5?=
 =?utf-8?B?NmxPcUV6VVdHbkdETDVQZ3lDMTdXRHhQVHEweldrTU95TUhLelJ2UXdldjB2?=
 =?utf-8?B?aGpHNmFzTXhtRDN6SzY4S0Uxcm1vQlFJYjRLSUlJUzRQTllOUUZXaVExYkVk?=
 =?utf-8?B?OWNqREpwUGozM09ZRm8vdExzUnRuVEwwaVlNNnRFRXVZWlJITWorZ0dmNUph?=
 =?utf-8?B?UkRKTnh6VTZncDNlUlljcEtvV3o5d0hLdGtDNklHUjZFZmplMi9sQlNFaXVK?=
 =?utf-8?B?Zml6QXNsay9BbmFsTGxBQmtyb2xRRENsbVY0TUl0TjFPS1VDS25UMTNrQ3VP?=
 =?utf-8?B?eWRnNS9KUjJkWFRRSU1nMWlQVDVBSVFLZ0FhKzBWcVJTZ0hWMTN2azNkQjd2?=
 =?utf-8?B?cm83RXF0YW1yL2lsbjV6SEswb1dyS0YxUnlmRnM3SVpvRU0xaUxGWloxWjBx?=
 =?utf-8?B?Smd0MUptUEE0VTNaLzBUdXNtTGtLaDMzZVg2V0NSTlp6bTU1LzdZczdRQ1ky?=
 =?utf-8?B?SXpWVllLSHNBZ21yVmhsQVl5ZUtnbjVSWGF5YS95WlJUb2ZKaHJpRzkzNlV0?=
 =?utf-8?B?K05SUDdCUTVLMnBBNFUxdU4zZXlsWDhZTm5ITmdOeUlZRklJYWh6d0lDQ3lj?=
 =?utf-8?B?T09WZEZSM2tYbEpzTU1pRVV4dUdTQUQyM1QxcE5EaFFRbmE1cSs1YkhGR0hC?=
 =?utf-8?B?VFZmbkoxZGx6SVUzQkZoeTBwNFJRb0VVVHRybGx5ZFA1elJxOEJqem1Nendr?=
 =?utf-8?B?eW5yd0NYdUtOUkxJOXEycUJMTnkwaXE1RXBxUHkyLytGTkJPSHkwdXcvaUxM?=
 =?utf-8?Q?ck9JhSrHCCShko3LGzkqmiw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3a32cf-edc5-4dc8-8764-08d9c4b5e0a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:12:48.9113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfXLypK7LsuchQhwIdxiZohmL8mZkYuNoDhefbqAe0/GATdVc191p/b2HDkwgdhhQ511wuKsfxVe7v3EXWMyiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Wed, Dec 22, 2021 at 02:19:03AM +0800, G.R. wrote:
> > > I omitted all operational details with the assumption that you are familiar
> > > with TrueNAS and iSCSI setup.
> >
> > Not really. Ideally I would like a way to reproduce that can be done
> > using iperf, nc or similar simple command line tool, without requiring
> > to setup iSCSI.
> I think it would be tricky then. The problem hide itself well enough
> that I wasn't
> aware soon after upgrading since everything else works flawlessly --
> nfs, ssh, web etc.
> 
> > Can you also paste the output of `ifconfig xn0`?
> Here it is:
> xn0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> metric 0 mtu 1500
>     options=503<RXCSUM,TXCSUM,TSO4,LRO>
>     ether 00:18:3c:51:6e:4c
>     inet 192.168.1.9 netmask 0xffffff00 broadcast 192.168.1.255
>     media: Ethernet manual
>     status: active
>     nd6 options=1<PERFORMNUD>
> 
> >
> > If I provided a patch for the FreeBSD kernel, would you be able to
> > apply and test it?
> Probably. I did this before when your XEN support for freeBSD was not
> available out-of-box.
> Just need to recreate all the required environments to apply the patch.

Could you build a debug kernel with the following patch applied and
give me the trace when it explodes?

Thanks, Roger.
---
diff --git a/sys/dev/xen/netfront/netfront.c b/sys/dev/xen/netfront/netfront.c
index fd2d97a7c70c..87bc3ecfc4dd 100644
--- a/sys/dev/xen/netfront/netfront.c
+++ b/sys/dev/xen/netfront/netfront.c
@@ -1519,8 +1519,12 @@ xn_count_frags(struct mbuf *m)
 {
 	int nfrags;
 
-	for (nfrags = 0; m != NULL; m = m->m_next)
+	for (nfrags = 0; m != NULL; m = m->m_next) {
+		KASSERT(
+		   (mtod(m, vm_offset_t) & PAGE_MASK) + m->m_len <= PAGE_SIZE,
+		    ("mbuf fragment crosses a page boundary"));
 		nfrags++;
+	}
 
 	return (nfrags);
 }


