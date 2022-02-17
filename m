Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0794BA580
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 17:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274904.470535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjPH-00031A-Ed; Thu, 17 Feb 2022 16:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274904.470535; Thu, 17 Feb 2022 16:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKjPH-0002zL-A8; Thu, 17 Feb 2022 16:13:23 +0000
Received: by outflank-mailman (input) for mailman id 274904;
 Thu, 17 Feb 2022 16:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMIn=TA=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nKjPF-0002zF-OD
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 16:13:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 850e8340-900c-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 17:13:20 +0100 (CET)
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
X-Inumbo-ID: 850e8340-900c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645114400;
  h=from:to:subject:date:message-id:mime-version;
  bh=Snox3KHOAxYs+2nsfXzxSnwUUSU1D6GH+5UAxqr1Qh8=;
  b=eG+eKrePomtHLlyh7B/ftPStI9kfAMpK2EkMOVGF8pcMYyg/5fg8MBgT
   LIRezUCWYKZdGp3cLXpJ550+IsTgX/PXoamg8NvqQmRhYoYM01GRJNh3N
   QhaZqAO7FqkmQzZBdlrtDvJJ+ybDr0mxua5ZS38xgdySYPX5EDexccqNJ
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1eecYmoZOwHqQiutsPckH9pl3UMb8ebbR1ROhbahcdwDd8sQJTWIXQ4r1yEgPvVHvNWLcPX/+V
 Hm7Rgf7QzPozZXTQLInw+uIFJJD5ESh0WRMCfHnLYqBZ4/Em8UvuprCV/6kV/Bv0/cdOvd4525
 TrOyvm+zf6crW+mNMwsHf+uU+ulRLyWJo1m6jbSaFO0+uOeq5GGglQniTuGu9Yr2XJzdysCw2Y
 +1msmJJdXr3TX1pFYIB853fNATielWDmxPZBdEgs77+CjEX+J/MaUhwv85/TzjWqjqS0jHZ7Q5
 u+IQ46Yf1e2zJZ9/odI7Me4W
X-SBRS: 5.1
X-MesageID: 63887733
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yPwsE6/hclrO313YhYkADrUDK3mTJUtcMsCJ2f8bNWPdYAuX7wSz/
 BJcAD7Ya7vPIDfrKpolWDmFhU5QvpHXzt4wTARlrnwwFXgR+caeWtjGIh76Y3vDJ5XIExo/5
 pwXNoSfcphsRy6GrRuja7G7/XRy3vDST+OmBbKs1kydPeNBYH5JZUVLx75p6mIRveWEPu+th
 T/Ti8CCZgL4izJ+Oz8dsvPeox1l4qn/52lE4QAyOPpAtw+ExiUZVJ4RG/q8fiDyKmV28k9WZ
 AphIJWRpD6xE8IFU4v9+lrDn8ljrof6ZWBisFIPM0SZqkUE9nxaPpoTbqJGMx8N0mrRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxNwpvRjKbUzJ1Ogk1U5dkne7zjFPbSmgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wEe
 xxLpXF1xUQ03GmCceHGcUGRnHergjkFSd9dNNQ5sw7Yn8I45C7GXzNZH1atcucOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgddE1FDuYO65thu0FSfFb6PDZJZkPWrKTHa5
 Wu6gxI+2ZdIiJQK3v6x13T+1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlQenxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCf7BUOUS9joYyjP8UQGPY66PhwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoG7pFiuB1mn1lmj67qXXHI/KPi+X2iJm9E+ptDbdzRrphsPPsTPv9q
 L6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LOtf1s/lBJsBmJtHKNoVLlJZJc
 hXMQO3datxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHmQlI/foIVni8jcgFC2yuZdsq
 rGszFqDE5ECWx5jHIDdb/f2lwG9un0UmeRTWUrUI4YMJBWwodYycyGh3OUqJ8wsKAnYwmfI3
 QihHhpF9/LGpJU48YeViPnc/ZupCeZ3AmFTA3LfseStLSDf82f6md1AXe+EcCrzTmTx/Kn+N
 +xZw+ulaK8MnUpQspo6GLFulPps69zqrr5c7wJlAHSUMAj7VuI+eiGLhJAduLdMy7lVvRqNd
 niOotQKa6+UPM7FEUIKIFZ3ZOq0yvxJyCLZ6u44IRum6XYvrqaHS0hbIzKFlDdZcOluKIogz
 Oos5JwW5gi4hkZ4O9qKlHkJpWGFL3hGWKQ7rJAKRoTsj1NzmF1FZJXdDA7w4Y2ONIoQYhV7f
 GfMifqQnalYy2rDb2E3RCrE0udqjJgTvAxHkQ0ZLFOTl9uZ3vI60XW9K9jsoti5Gvmf799OB
 w==
IronPort-HdrOrdr: A9a23:YzQcnK0o+D6iIwrPur956AqjBTRyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ4uxoS5PwO080lKQFrLX5WI3CYOCIghrQEGgP1/qB/9SCIVyzygc+79
 YZT0EWMrSZZjIW7beY3ODRKadn/DDtytHNuQ6q9QYKcegcUdAG0+4WMHf/LmRGAC19QbYpHp
 uV4cRK4xC6f24MU8i9Dn4ZG8DeutzijvvdEFE7Li9izDPLoSKj6bb8HRTd9AwZSSlzzbAr9n
 WAuxDl55+kr+qwxnbnpiHuBtVt6ZrcI+l4dY+xY/suW3fRY8GTFcFcsoi5zXAISSeUmRIXeZ
 f30lAd1o9Img7slymO0GfQMk/boW8TAjbZuCGlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixtJq5YOpplWD2zHkbWAdqqOPmwtqrQfTtQ0sbaIOLLtK6YAP9kJcF5kNWCr89YA8Ce
 FrSMXR/uxff1+WZ23Q+jAH+q3nYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdq5oiLZNRMkLar8VPpZLfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypK444em7EaZ4u6faWK
 6xJG+wmVRCC34GOPf+qaGjqCq9MVlVdQ6duf1j2w==
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="asc'?scan'208";a="63887733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaOQY972eF6ZEkU1+EN7cUgYt/L/rjckkCPNhoGNPXu58wWkxcpdvsmKgopXhnpJJeSlA7P1lJjfcKgEWhI37nB2fNzDvHsv8AM11WjBO6hAtVWuV34qSM0oX5NAFwLk4H7YCJJyJj/5GoJLUijDX1qM8O9V82i+Grx/juoLjs+bnhXV/vJTGK+4/qNYOblcpH+LA5/NDC2QKMEyheLTDbScAG29YeTs36q78XqtQtlfKFtnSluz2VzEM3b4M4Lh8hu23XdNBZ80ybFxuPBtvxTy/DDhmzvfRV+A6ao4d2TJuDl7AP7K38CGsyUKWzkflDtzdFEA/nx/E4KSmwSTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFj8PAEnr5oa5TJh4u0Bq4rso0mAnYCj0+TXV80DcyM=;
 b=U8HPHTxIVLrS6c0HRQpOU7RBMjVJMrYegYYXCxvLHIw6RjZ2nUYQtUvbDUUQrQAaYuHkUIQPtgxR6Y6JNJX6IjGncYQo254zzvqRTRX+yH8NbssKeSHQerq5LbdlYc+JkluZG7xOErvAXx0xSSz+LtHgBKS/yFDitHAcu56Or4C+hT13U/n1aCYHmyEpfyly4M9idP9TjS1J2c873IJqyJIvCRWntqXMjplSqoEB6Jf02gOF5zmLy/yp/L44QDZiC7IPvKOszI2EZc4NSy/W/vj3CyeeYpB3ZNvvFFu26VUcnXQ/mkoztjEXLFMPKq+0ubgISc0gxCB76EHjlM+s1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFj8PAEnr5oa5TJh4u0Bq4rso0mAnYCj0+TXV80DcyM=;
 b=Ks6IQdphcBAhnsEPM5pz8MY2J0+iOIygzQ7xsZiMg9Di9+/9mF8ATKmMwBZ14OXxuBDSxrvAojzLbaMuu02yIMm3qx0qMBcCndJwkNjzvX79djHFAclzkzHYvoRiEy0MS8ToD6ReO78FH/32ny01w206wbmdhSGRylsIddQdo6g=
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Potential dates for XenSummit
Thread-Topic: Potential dates for XenSummit
Thread-Index: AQHYJBlEabRNM87QJEepavafzujS4A==
Date: Thu, 17 Feb 2022 16:13:14 +0000
Message-ID: <30359D98-22A7-4161-90DB-476587FA2C7D@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 838c38cf-298f-476d-7ad2-08d9f23066fa
x-ms-traffictypediagnostic: SN4PR03MB6717:EE_
x-microsoft-antispam-prvs: <SN4PR03MB67175CC78236C611BEA2B47899369@SN4PR03MB6717.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5JpgWpn8OVMzAOZf9INPXO15/TAQVbyjWGRvB6uGqNGIDTfEWliIGNgvmmAGX2MYGxJZJLM2UKA9kTYEqvFnn4VZyM267t14c0wsL8rUPlotJKyvjVdu5p70MXaEH1JmEAPbeuNv39Ph9RX+bzVwUz/2YUr9WLrl6AI6QDnq3Gh75vx5H6IV5aGHjXULq70+RfhUK18GZylaBH6Xj0MsM+4EGxXcBOb9fvTKT0GQH2oL/QiWC9F1wYlRJT4MgEs1b+k1md03936DPIfitoQN/APIyAL+ZI+Rc+8lsx9hnvne9qKtLYXPQsJy5KNgpkC+axqfmn3vY3KPDDYtySh/n9uU+4AzViIV/y3PIqZnLJp1v0k+nVBhl97f3bYhKfER1xrjn7JcLjUvu/yH4KlAA8UMXW4CRFWZP+8GojfsbNLubRYzL8CG5zcnt9R4Cf8PQ918IgPdqMq6rPH01JwQiWzrQmQPzEMSchXeAkr3+OigybGfPMxwBy6B7kAZb7bK2xDBvW29OP1aG8drh7rf/WSyoFUTD62IJJkCPp60+Fcw9h4g3iEHeXa3ftH/6YcZrFeFW4Oo2y8/PY8tJ57hJ6ZLZRPBUz5UsD0mbInWNptfI//L7wpGYG4R5D3sdrQNufXwvKSARJpRR8LcU1utZriQJXUCrFWoJR9wm6e7+5KwDaKpGkFo9jX+rOBWleoF2WWJHRPPZaWExOcf+ChEz7VnYhpjkSqFCb4KYSP+v5Joa1itv4clof3MfW1EyGKN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(8676002)(186003)(6506007)(64756008)(66446008)(66476007)(91956017)(2906002)(66556008)(508600001)(316002)(33656002)(76116006)(6486002)(86362001)(66946007)(2616005)(26005)(5660300002)(6512007)(38070700005)(122000001)(36756003)(38100700002)(71200400001)(3480700007)(8936002)(4744005)(82960400001)(99936003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1R4dFl5R0I1MTU1NjhPb0o4R1JMQTV5Q2ZrS213NElVaENSbDRNSFU0OHh1?=
 =?utf-8?B?M0Q1UnVjd2hBMHd6bWs2WmRGV0xHNUVabEQ2MzVmcElrV1hBRDd4Nms4VFNM?=
 =?utf-8?B?VDBWU296dUJjYmpGaUtCc0w5YzhCaUhQZ292WnZrMjY4VFkrTktlMXRSRkFL?=
 =?utf-8?B?NndjcEcxWXJPc3EwNGFJa3NETm8wWEZWNnQxTUZMb3U4WG4vNVhOeEVreTk3?=
 =?utf-8?B?MjBQSGdvb1FrRjBWR1JOTGRHMGw1NER4ZGlJM0pkZ2wxUGo0MXlFRDNweWVP?=
 =?utf-8?B?bmU0TXBTN3NOdEtJTEptRE54QzdYSXpsVEdmalg4dU0wVGpLaE9sSEpwUEFU?=
 =?utf-8?B?M055blNPU3VHbkF1cWRvVXVSNFkycWs0eEcvaG1JRjlaMnM4bnhCZnJ2Y08x?=
 =?utf-8?B?MGRiZnNMSnY1RWVsK2JXNm1IT05peXNKUWtIaEdSeUh4bUJpQmw0bDhwQnE5?=
 =?utf-8?B?ZGxqbmc5ZXZCaTZDd01QSG91VUZ0eHp4dmdSU0VIaHBuVmRZM2lZb0RoZHoy?=
 =?utf-8?B?MzJOU0VDT2NZeXBxUGJMNW9ZU212ejI0SlZCeDZYYkNPeXlFR2o1Umd4dit1?=
 =?utf-8?B?cWVLS3JxQWVDOFB2dkt4TVZWb0RKT000TFJvUTBQSHNaRUZRZW05cTBHb1NN?=
 =?utf-8?B?YW0vTWZNVHdwcFg4a3MwVHh0NjVRYXczU2twZFZuWWhHZ1BYc2NvdXFObFVJ?=
 =?utf-8?B?NnMzb3BLcHREWmMzYXBXcTd1MzNCb3BNK09UUFJlbEY3N002YlVVeTNsQVhr?=
 =?utf-8?B?THhhbVhWYytnc0NrSmoydEc2R2FkYTRFQmVVYWRhLzNlOFhYQVN0L21VUFo3?=
 =?utf-8?B?UTFWZ0I0czdGMHBlN1F2dFU2M09tdHlvNVlhcmw1aXRFTGtvL3VLTGU4cHN3?=
 =?utf-8?B?NDVXd1NsZ2RKWTNoeEJZaTRMRTV4eHBGdlVkMERMV1NMcUJkY3M2eWQ3Zi9t?=
 =?utf-8?B?Q1JyUFdVcmJPbGhoQkk2YnFybnFOMHRlK2dLeWIvRzRuTHJteHU3MUFqMVV1?=
 =?utf-8?B?K1BGNU02d3EraDY0MktPUmNTZ0s0MmFBcVdsNDgrZWZET1FpUkkrWXI0Q1l0?=
 =?utf-8?B?VTlhMURDbUl2cWlSRFg4ZCtVNTlVcm5idjZUeUs4MDlwWURMQUt1bXl4Yko1?=
 =?utf-8?B?RWhkZkttSmVGQTRhYVgwM0lrOFpRODZJTlZTNm9oLzVVeksyaS9qRVp4Umkr?=
 =?utf-8?B?VkVFd3RhbjVLUVpobGlOUW1CVkZMcTU2RXpvbWJPRllvNWwxVzl1em9zTnhh?=
 =?utf-8?B?U21hc1RDODRNdHFZMkROZCtuZzN0ZjcxUGE3SVBrS1VFQ2tGNUhncFhpUXky?=
 =?utf-8?B?L2JPVmRpNUVxSDFhR2Y5LzNSQ0pjZTVyUDRxVHpEdjIzbTBVQUNlb2g3OUZE?=
 =?utf-8?B?dGh4bDhLdDJLcGdkS1BCQjh2Ly85aHJuczVqcFNneDRvak5iY0VxTEpreGpQ?=
 =?utf-8?B?eXp5Nk03VHpHZFhmRjlqR0hrcUtpdXo1MUlnb0YvTXp0SWM2NEY3RGs5SHR4?=
 =?utf-8?B?Ym1KbTVQTWFqMkxRWDRUcXc3Ym1NK1owS01tdEFkNUdKblUxbW0xazFBWFY4?=
 =?utf-8?B?WXE5c2dna042SHZveC9GOEpvOW1RbFRVMXQ2Tll1MWxFNnB3NDA2NmFYK3ZY?=
 =?utf-8?B?WWt6aitaL2NqUDg1RWZSZW1iSWw2U29RVjV1OUp4ZFNTcTg3NmM1YVlDNmpG?=
 =?utf-8?B?TmR0Y2x1SkZPelFWdFFFbmNDRjR1VDhodGRvOUlBYlY0aTNRS3ZXUHlOWGlF?=
 =?utf-8?B?QkxJbXBkOWtWNFpwdFlCUy9Ld09LSHNRdEhiNzk5RzdNWUdqa3o3eXBKYlJD?=
 =?utf-8?B?S3ZpQStkNDdzSWhFUVQwWEdxdjRNc25pWWJoa21QNUVBNjZtK3dMWkFvRlhp?=
 =?utf-8?B?UHd1RjVleEhFQ0YySzFSd0N6dG8ycENUZmVpeWpGcy9PeW5VdEFjRXFROVNQ?=
 =?utf-8?B?TGZKMy9QUThrWkplMXBTYThaL21BSkRDU0oxUVBmaFVmUzZiTDVucDVlY0RP?=
 =?utf-8?B?eUJMdlp4ZFhod05hYk5TeSthczRGU3hBbjMrZnZSaVFxM2V1cnFINld2VzVD?=
 =?utf-8?B?YjdTRzkxdjJTOHFKM0pjWHEybzVmWGp4UHRXZSt0UE1wVWdHQU0vWWEzVkRi?=
 =?utf-8?B?Um9mMCs4RjIrMXNoaUwzczZERHZZNE5JZVlSSFUwNHdSNEZ1R1I5RHAvVjFp?=
 =?utf-8?B?SERjUmFUQzcvODJtYVRJN1hURnVwOWlPWFdpUERYRm80TzM4THFkMld0Y0dZ?=
 =?utf-8?Q?y+cfvp73gSP9tn4FtfYUZCgIU/XZpEHlEiN0YU2kRU=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D685ED24-8CF1-44BB-A596-89AE94202066";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838c38cf-298f-476d-7ad2-08d9f23066fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 16:13:14.8742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3WVptDfRilFdIZsP+2hq9jpq7yTUShn+h7+x8MAlmTxa8sNAvHfLAogg9ayMjEpf7GLOkXEomjo0JzW9iOjtT7MBHEy7I4LIs0/MX7Ebm9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6717
X-OriginatorOrg: citrix.com

--Apple-Mail=_D685ED24-8CF1-44BB-A596-89AE94202066
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I=E2=80=99m looking for input for dates of the XenSummit.  At the =
moment, we=E2=80=99re looking at three options:

1. The week of 25 July.  This conflicts with SCALE.

2. The week of 1 August.  There are a handful of minor public holidays; =
but worse this is in August, when much of Europe is on holiday.

3. The week of 7 August.  One minor public holiday, but still in August.

My sense is that August holidays is going to be a bigger conflict than =
SCALE, so I=E2=80=99m tempted to go for the week of 25 July.  If you =
want to give input, please let me know by Friday 19 Feb.

 -George

--Apple-Mail=_D685ED24-8CF1-44BB-A596-89AE94202066
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIOdBoACgkQshXHp8eE
G+3YrAf/eiVawyadnzkJ0oYkt60xLx45YIfSI7yz0i+u6HJ98TWvzJdsv+GbH52e
CI6fFiHs9TiVnlAvcg+aUO6jBZHcWU8y42MLKx5PISyRTbKQkdH9pRdOMBIuuxjZ
HhZU26C2TtuOTqkO9oAtpk7342TkaaIFKLANyfa9TsCLrEV0Xf9SyMWtcSshm/+I
KV4KIDDvSw9tRa9zfnz1esbWoEuiJplE0queyDCTUSqhLmIpZCJQT2C2R0YFh/ED
vD53bhFio/d4yeDSBgkfh3nyvV1IX27RD/4qrYWvbYqdy1Lj9o5CYUHzWRWs5zPQ
nQ0IXXpdiMlYBRBXw+/Y10IyFlry/Q==
=RuT6
-----END PGP SIGNATURE-----

--Apple-Mail=_D685ED24-8CF1-44BB-A596-89AE94202066--

