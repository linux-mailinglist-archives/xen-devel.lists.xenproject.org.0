Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5C368FC8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 11:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116034.221434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsSS-000494-2s; Fri, 23 Apr 2021 09:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116034.221434; Fri, 23 Apr 2021 09:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZsSR-00048f-Va; Fri, 23 Apr 2021 09:50:43 +0000
Received: by outflank-mailman (input) for mailman id 116034;
 Fri, 23 Apr 2021 09:50:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZsSQ-00048Y-6s
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 09:50:42 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c8734dd-a611-4d21-ac29-8ba0ebb51fae;
 Fri, 23 Apr 2021 09:50:41 +0000 (UTC)
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
X-Inumbo-ID: 5c8734dd-a611-4d21-ac29-8ba0ebb51fae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619171440;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WSOfKzd556qdr7wur8+pM0sjMW7nkeRGMn2mfniW/m8=;
  b=CRNHPiz95DydfLq4W/qmQ0F2l+IrS44QW+8PZXkQAiKArcCK9TqJR+nB
   a+QttNSxe9MtvCjrGXFM2sgSzPh6hQCeLpD1brkdBTcxBSp7tiuSRyKBa
   OL5EWUeaOB1uY1sJg6JANZqi4mgdm+xcdIxEj2SI/8Ilu/ABmMi2VJ3kI
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: N/W0jHEtZa8/fiMHQVhz+zStW45WlfDfUSNY8ZH36PZgMyJH8xG8IUfwG1lcKUloXofoJR7xWZ
 G0XvfNt2BvoqHtEaDbSoi5UWLCnzJQJ6B1uf7XS3Pb9mqhfBW4VPyvOgtsHvlVv2Tn82Iw5ETh
 E7C5fgJPus/SE90cp1D/blmWom3I91UrSayJT5G/I13l9k4FYCJftf7dffQM8y6zGAoyZEg2oY
 j8sID0fDMk3bOmlUf/cVGFLP7Npk/HKH+O22lQzh3IWm6NbRjtCguEcmzSX53dnlfKvveam+qA
 G3w=
X-SBRS: 5.2
X-MesageID: 42380354
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:adMPeq9Bm28+jZmkRGRuk+FqcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLoois2eTVJ3Lsk7C
 z5gxX0j5/Tyc2T5z398yvo75pQkMb80dcrPq2xo+UcNzmEsHfMWK1PQLuH1QpFxN2HyFFvq9
 XUpgdlAsIb0QKvQkiQgT/Anzbtyywv7XiK8y7qvVLGrdbiTDw3T+pt7LgpCifx0EYrsNFi3K
 8j5Qvw3PA7fHCw/lWJ2/HyWx5njUayq3Y5+NRj9EB3aocCdKRX6bUW4UI9KuZxIAvB9IslHO
 NyZfusncp+TFXyVQG/gkBfhPaoXng1Ay6cRFkDtsG/w1Ft7QFE5npd68oFknga8pUhD7FC+u
 TfK6xt0IpDV8kMcMtGdag8aPryLlaIbQPHMWqUL1iiPKYbO0jVo5qyxLku/umldLEB0ZNaou
 WObHpo8UoJP27+A8yH25NGtjrXRn+mYDjrwsZCo7Bkp7zVXtPQQG6+YWFrt/Hlj+QUA8XdVf
 r2EolRGeXfIWznHpsM9xHiWqNVNWIVXKQuy5YGcmPLhviOBpzht+TdfvqWDqHqCywYVmT2BW
 ZGcyP0IOlG80C3Sl71iBXcQBrWCwnC1KM1NJKf0/kYyYALOIEJmBMSk06F6saCLiAHkqFeRj
 o7HJrX1oeA4UWm92fB6GtkfjBHCFxO3bnmW3RW4SsDM0b+d6c/q8ySEFoim0evF1tadYf7AQ
 Rfr1N49eacNJqL3x0vDNqhLya8g2YMommJC7MRgLeK68ugWp5QNOdmZIVBUSHwUzBlkwdjr2
 lOLCUeQFXEKz/ogaK5yLoOBO/ecNF4qByxIdFdrE/esUn0n7BselIrGxqVFeKHiwcnQDRZwn
 dr9bUEvbaGkTGzbVckjP8AK11KYmSPCLdgBACIDb8k3IzDSUVVdyOnlDaagxY8di7P+18Jjm
 LsFyGSZMrGG0FQoHxez6bs/m5lb2n1RTMDVllK9alGUUjWsHd61uGGIpC+1GaccXMu6OAQOj
 OtW0pZHipeg/SMkDKFkjeLEnsrgqg0NuvGFbI5bvX4wXW2MrCFkqkAAt5Z9JtoL8rVr+cOSO
 6TEjXldQ/QOqcM4Ui4t3wlMC57pD0YivvuwgTi93X983glA/beSW4WDo0zEpW51SzDSPmJ2p
 ki0o5wkuu0L2nratmJjYvQdCVOLxvPoWiwC8EkwKokyp4ahf9WJd38VzCN6VRsmDMZB+3wnF
 kFQKt67KvaU7UfNPA6SmZ8xB4RiN+LLEEXqQT4De81QEE1gxbgTqe0youNjYBqP1aIqwTxM2
 SO6iFx///KWC2YyL4RYphAV1h+WQwZ6H54+vmFeJCVIAK2d/tb9F7SCA7xTJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ET1sSFgKqxDt0ahTsXaOnPBJcd4t/i7M0+LmK2k/Yqaiyr2UyKybwAgvr
 J+HHZgJvhru30Fl4040i+7V6zxrAYEqjJlkE9av2+o/JOn7mfdFVxBKivDjPxtLGFuDkQ=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42380354"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ei3y8NRjmzYarosLsavSCeQ6n+ikbfKq4WnP8avtUady15C4IOigcDQ7lrnGCjdI18sCMFme7ChpKYsp7Z9WAmefAYCLjBAB36Qq0UBt63i372vzzJgXI5aeVVx3QaXk/6TheapVazbndPwlnSD0XttiZPKVyQ23OVIwDLxyKnrW1UQgqVcckvOL2rhaOHWjwQJX9zpZ6RaJRMWKQx2b7gR8Inq6E2jh6Pvl9NJy68aMMtCkv5UAEvcl4+sz6L3qo0At9tRMJBPMbuGMwDOot1Eggo34ZTDKLiAmeVjMbIBzjpwrxmRTQ0GnEtu4ATJdIHEMrqBdpm93SrSB0UJKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOJzEjtpqvis25rro5Y2UDaMlNBuZsFuM+ITUJoKAi4=;
 b=Y9pwjyFwnOM4ZFHCMEvNDz2gXPm/aNCcievoNZnBDpyrW8FhBwc8UOPGevMasRo1rSl/LW5oXuSC/qKYKP37qcoG+1ugULCBeV5QF7DwMEan4vzv+79Gm31BKWE2jjlWFPME+yLpQ+qsbcVrxuJFNvv9m+HLFS7rj5dTYhoZCdCvmMEllllOcmnMk73hfASCqFv3amh9+a+MwJip7uUM0vLLMPqM42NAIEK49R2KsCbd6XdNhOf9x+uRB0tmLpbOyYGXKsvktUj8OnsWIjefP6j2Qb6BuztMVo1bkTTLc5O3/3Dj8MGHeXIJkmycc37mF1Rr6KgBowYlHj9q3xLdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOJzEjtpqvis25rro5Y2UDaMlNBuZsFuM+ITUJoKAi4=;
 b=jmOuGxl2hm0nWIac1NbXQcJqnXmmsLSU46t56bgKp3Zr55PVvK6Vn6U/KnxyZsTn7tcAlJ+UT+QHDFbFywgptxBC/YRoDzjrZYXN8fhLI8E36cJucVm7tSFSyD5kWKl6h18X+MD242MP38r7JZJldTBQ+5BIe3iGEHF3bf93mmo=
Date: Fri, 23 Apr 2021 11:50:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
Message-ID: <YIKYaCr13TiwxqRq@Air-de-Roger>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
 <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
 <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <caab96a2-3949-9ddb-e6ab-9a95c958e4d6@suse.com>
X-ClientProxiedBy: PR0P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f98f318c-e1e4-4402-9742-08d9063d3f86
X-MS-TrafficTypeDiagnostic: DM5PR03MB2921:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29215576EBA6E57E3D2E671C8F459@DM5PR03MB2921.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TthIhgdXJNG4klr8/xU2eWcAmEBJtuzQ6Mrqy4btY0hL5hsM5SeNaC9Qix+Xh0YCfiJzcyJQCE5guebYwV6+v8DjL6njMMksYvskNOajPmYGkX+AIbqM0F+BeLVLzIFxLwqC5ulwgA765urPSubCBDd1p+JReBGJd9cuO34wjjtWOP7i+/nqwAdwArUF80y4zk8xcjx/2+UFMtaDNsY8IrXikh6CWwWW0iuHsc2fQ4bATaw5I0I/NYfCtQ7iSw9lDMPFrlTgPVc/M0kqlXwxYzphxBwhImurW28+8ZgvcxqkVbhyK3OSXefjRR1SSKBGUK2x0Gjsw7TSTf/8r8ZUGOgPiA4XXZUGXsLlacaFwW3Gx+adXB+5ku/vAqm8m0MGso75YqXqSRZEyzKZWf8L+IMR9bVljF82KWfqkuqzAhMs1JI7gL9n6JiFf2mN4uvhyT2wHehEEYOamC4Ri7AwpBTNhuMYlGc3XomYcgQ4I2CkElVSIqZkR2qdxF3yS6ZWlbL2tCYCtLFqaAVf1QFFugDx9xblFmpeN+CdmtcdEi79NcQdnRfi08hhd5sF8/TYO+p1RZtPAjG7S+I4YXwlCmsUlesMycUs/S95jj42Se0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(396003)(39860400002)(376002)(346002)(366004)(83380400001)(85182001)(956004)(66946007)(66476007)(66556008)(26005)(186003)(16526019)(54906003)(316002)(86362001)(38100700002)(8936002)(9686003)(8676002)(6486002)(53546011)(478600001)(6496006)(5660300002)(6916009)(2906002)(4326008)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2xxQXVKQ2NGdkJrMGQzNU8ySDJDS2NGZVoyYUhPZXFlSGxuWmdqa3lMYkxl?=
 =?utf-8?B?WEt5ZnNTWGtmODVwUEtaOFVxcnZxRXdmNURnN3FrMFI0T3k2Sjk0eWIzYWlW?=
 =?utf-8?B?c3FLNUZzNUdVazN0Zk15Y24xVzBoL2Z2UWFycDNSNnhJemsyb3ZtcFJwLy9p?=
 =?utf-8?B?ejloSjlUOUUxKzUyQWpHTWllUWxRT2dIQStWZzZqR1RUWkpvNkRMOEtieDNV?=
 =?utf-8?B?S1FGNDdxeGZrU2JvenA1QTdjTFhyL0R6TEc4VitRSmVxL09PVE5SdXN0MkJM?=
 =?utf-8?B?RzVUS3hIZUM0OFFFWk5yZ2NUL2NlQkJXZjAwbXl0UUM1K3FEV2R5YnlKRlNW?=
 =?utf-8?B?NU1KQkEwaHgzeVl5TkUxcUJzaWdyV25TcjVUUFVtaU9WNVUxbVpaMEk3aUZH?=
 =?utf-8?B?ZkdlU3hYRnJCZEVGSEVhbFpQa0dEWTNKU25iV3R2c21QOFVCakRlY3JUaWNN?=
 =?utf-8?B?WTZGQXVrSGo2VXVDZ1hBKytsNm9tVUh2TGUrWW5xRldIb1RZTlBDTFpndTFW?=
 =?utf-8?B?bXAydDJmREtjZ0w0VXU3NnpuY2N2RkpJQXkvZGcxV1JmaUxzWGwvOTZaa1Jo?=
 =?utf-8?B?RWF0a2duajljR0RZVDRNVjlxREdpTmszTnF3WHVkSndWWHFJODNlL0NEK05z?=
 =?utf-8?B?Z2IzMzRsN2lXUFF4NnlONVNtaGwvM3VvdHRVTW9aZEYydjFaaGEzaVFtUDR1?=
 =?utf-8?B?MVRBRXZIYmtwdEJnMmJXai9UL0pyWkh3RVlJUEd6YWZMc2tBdjNkTVRjM21t?=
 =?utf-8?B?WnNCYkhMZ2M4NWhmNXQ1VlBsektpRWZnaGVxbkp3blBuVEhMYlVjUU9OWDAv?=
 =?utf-8?B?bWo2eDdRR3ppcG1rUWVtc3pyYVk5U0pFbDg5cWpZM2dackVVelBQVEhIWVVW?=
 =?utf-8?B?SkF3aUdPa0NQNWhrWUxycllsR1Jka2p6aUtWVXNZM3g5WWxTS05IU2E3Y2h4?=
 =?utf-8?B?RU0wdmdjR3NtZ05jZHNwZlFkQUZEcWhKVy90M2Vxc1U2MTBPQ1pDbzNybTdj?=
 =?utf-8?B?bXQ1SEQ3RjRqWFVqS1Ayc1BSdWFHYndrSnp1bUdhaEVKTHQxVzV1TlJudHZk?=
 =?utf-8?B?azJEUFZwaVBtU1BXNzR6UitsUk1oMFEvUTFyMVN4dUM4eVltYkZKZ1pwa3FZ?=
 =?utf-8?B?dlBaSGx3WitGcmFYcGo3RlBOV0dVYmsxUW5CcDFoM2tod0Rielp5YUlSYThh?=
 =?utf-8?B?M003MUFXSHRqd3llcmhrNGJDMmNpSDBhK0NxVGJUcGlsaFhpYlQ1bllOc1NI?=
 =?utf-8?B?SFRjK2FzcEtNdEE2SDJVY0ttK1JLQSsvKzFjdmRMczQxblhSSE02aVhpT092?=
 =?utf-8?B?aUhha01mN2czdFJwaVFOSHViL0ZKVk11dkFWVFBYcXFOclc1dEkyTTd4RVpN?=
 =?utf-8?B?V3BxZHRvbG5HMVhiOXdXMVAyc0RLOUlrRDc2VEYxZVRJL0RNTlRuaE1iRE5y?=
 =?utf-8?B?cHh6bFkyblNlL1ZxWDh2eDNpREprcjN3amFOTXBlakZWWVdRMUNiS2tCMGNV?=
 =?utf-8?B?dU9PcjB0OTBrNkNtdXNRaHV1dktSOUl5QWlaZHcvSS8yM1MwV1k5RmM0TWFU?=
 =?utf-8?B?TkdvUUF5MFQzSzZHV2tHMEtuZmVqOFlHODF5am5BSFBuQUQzbFFyT3FubVZC?=
 =?utf-8?B?MXNVNzNuZkZNOEhHTjZ4YzZ0d1l5OXJ6V3VuNllwNFliT2labWViMWdnaERZ?=
 =?utf-8?B?aG56RVFNSFFWYjFHYmI1V21TSC9oaisrdlVsNnd4WnhDT1lYak1lV1FGOEoz?=
 =?utf-8?Q?n1Jf93brQ88Do+ZDUlUg2bRAboTqLT83FVPD9JF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f98f318c-e1e4-4402-9742-08d9063d3f86
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:50:38.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9JSODNgqLuzn7PofbG0XBv854GjHuICL1NtiuQHL2d17W3Mt4XS2WMN50awOIwuaTF6uYAVnogKB6Lh4iu8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2921
X-OriginatorOrg: citrix.com

On Fri, Apr 16, 2021 at 04:20:59PM +0200, Jan Beulich wrote:
> On 16.04.2021 15:41, Andrew Cooper wrote:
> > On 16/04/2021 09:16, Jan Beulich wrote:
> >> clang, at the very least, doesn't like unused inline functions, unless
> >> their definitions live in a header.
> >>
> >> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I agree this will fix the build.  However, looking at the code, I'm not
> > sure the original CONFIG_COMPAT was correct.  In particular, ...
> > 
> >>
> >> --- a/xen/arch/x86/oprofile/backtrace.c
> >> +++ b/xen/arch/x86/oprofile/backtrace.c
> >> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
> >>      return head->ebp;
> >>  }
> >>  
> >> +#ifdef CONFIG_COMPAT
> >>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
> >>  {
> >>      if (is_hvm_vcpu(vcpu))
> > 
> > ... this chunk of logic demonstrates that what oprofile is doing isn't
> > related to the Xen ABI in the slightest.
> > 
> > I think OProfile is misusing the guest handle infrastructure, and
> > shouldn't be using it for this task.
> 
> I'm afraid I consider this something for another day. Both the
> original #ifdef and the one getting added here are merely
> measures to get things to build.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Without entering on the debate whether CONFIG_COMPAT is the correct
conditional to use it's not making the issue any worse, and it will
allow to unblock the build. We can discuss about the CONFIG_COMPAT
stuff later.

Thanks, Roger.

