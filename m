Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2D853A59C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 15:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340463.565504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNzw-0000N8-JE; Wed, 01 Jun 2022 13:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340463.565504; Wed, 01 Jun 2022 13:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwNzw-0000Jo-FO; Wed, 01 Jun 2022 13:02:52 +0000
Received: by outflank-mailman (input) for mailman id 340463;
 Wed, 01 Jun 2022 13:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwNzv-0000Je-6M
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 13:02:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 228fdff3-e1ab-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 15:02:49 +0200 (CEST)
Received: from mail-bn1nam07lp2048.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 09:02:46 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4710.namprd03.prod.outlook.com (2603:10b6:a03:131::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 13:02:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 13:02:43 +0000
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
X-Inumbo-ID: 228fdff3-e1ab-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654088569;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=SMC7FlQ0dsjTBr0jTARmB8P71IWlVXA/M5O2memPra8=;
  b=TArEGm6KKe3s24xxFjF5oX3Tjv7ICissTre+2Da1Kf41hyeRP8S5A91+
   QaUbIZw01xM4G620D8JxRvdUpFC+uWNhYAOm79DjufONyFeed5OYzVd+E
   HUDaNjriirFNZcE7bVwyG7pqCWSlnZifIdJ8Cmt8SHvNGs1i3oeQeEg+g
   0=;
X-IronPort-RemoteIP: 104.47.51.48
X-IronPort-MID: 72618464
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BQo2iq8j6XFGhwzkNebGDrUD+3+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 mAaDGuAaK7eZzfzLY0nO4vg8RkFvsDcnN8yTgE4qX08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34DgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncOCGFgvDLPGocscdCd5DTlwbZxo1LCSdBBTseTLp6HHW13F5q00SWsQZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvyMuY8wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWMB+A7L+cLb5UDDkCxS9bPIO+COJOyxfeJlxlfF/
 0zvqjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsH0QhmQsHOC+BkGVLJ4DOkS+AyLjK3O7G6k6nMsSzdAbJksspYwTDlyi
 VuRxYu1VXporaGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9UDSW517YRY36piG
IronPort-HdrOrdr: A9a23:mq9nlq8DKzJeqXyWbfJuk+FYdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcKO7SdK9qBLnhNVICOwqUYtKMzOW3FdAQLsC0WKm+UyYJ8SczJ8W6U
 4DSdkYNDSYNzET4qjHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCajqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L9lqq
 iJn/5qBbUI15qYRBDJnfKq4Xis7N9m0Q6c9beV7EGT3fDRVXY0DdFMipledQac4008vMtk2K
 YOxG6BsYFLZCmw6hgVyuK4Iy2CrHDE1kbKUNRj/EB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11MfiOCETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTdspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCek1JVsJ6e
 b8uX9jxB8PkhjVeLOzNbVwg2DwfFk=
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="scan'208";a="72618464"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2jttJpNEtTuD/yR4ibi6hzOon+xeuO4oUEuPXuOPgQGXp5lITOHVZiO/cNW6tmbxR6JonFLFu1n6MjFRbKRASqGc7XMZW53ZbQjQY9qqjM1GnkOFUvZpfR904dJX45fr7Z+VbVg4WkbkB610ftmJZ6rXL0s4XHwbtQ9zcXign0+JrC7K7hdoEFirZj1LezASCr16EJFtSqrdB0UHJZDuO6sFc9zdwhXlPD+LElHGO/uWQCoXU0RJ2CxOchaxVCHxbQSyiZPJJe58H0CL0XWxJ6uOgYRRKUfhMH3o0RAwQZUh+xK+m0CY70axBnWp4rR7N0EMXr4XnYc6eor8xmL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUetxWrunKeTwfxVuBeKpvGHvNTNA+PJwtPDEIt35Yc=;
 b=W7JBTASspDzDUYD3HSLH8YlEYtn/Y45TM+stqivgKzcpn4r2qJTLC5KVNZJYxlccTolETLwR+VmIN9uRLpOp1KWCRxcCjgJCja6HLkgG5MIWnnF+aEyNGXJgpCfT1LcOxyfY3kn172oA694E/hhy3SDUczbvMeZiEQcBVtkvpFvPlv1Ods2SVm4i+V09NqMiSh7O/XI2cL5qOk6xijCKKhZypJ0AoW5SXzhSsAKYzY29Ow5T2eKiOKUWS3oET07JA+HSVJTGY/9uASHr0tPD/SZn6M/WMqz0syYEp7llKY0zyonrQeaYVY7htyTJmKk0HO7UWTSYSNgBczGgfJGjsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUetxWrunKeTwfxVuBeKpvGHvNTNA+PJwtPDEIt35Yc=;
 b=Hhu/NKhhM9Q5vYkwsquihmJJiizTQ0KUCvCcjaPowBeAhRMiKWY1FCsOhMQDmme3emzJ+RKsoIZseBxqAN0OXwP7fXj2XUMQSbhAEW9N9b6DSAHAsas60LGO/OHQnJClZQf8tyn0sJOv7HeNLs+wYy77aER1rNR+l0CLF58uhWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 15:02:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 07/15] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <Ypdjb++na2OGLr7u@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1fec512a-8c7b-69b5-40bf-88b42e9ecb7d@suse.com>
 <YpdNg5fgAncfSeTK@Air-de-Roger>
 <803e1e01-5a8e-36fa-1fe1-35bcf147c8e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <803e1e01-5a8e-36fa-1fe1-35bcf147c8e6@suse.com>
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e33ceb-659b-4cee-0fcb-08da43cf0432
X-MS-TrafficTypeDiagnostic: BYAPR03MB4710:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB47105A0890DFD82C85281D698FDF9@BYAPR03MB4710.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vt2AWAVVZohDKt1yJ2ngl3TFnH6V+rDXo7ImLyRSVYbL/xGl2Zpex4bKHqTP6CLogutQaLdmUUEz+88Rs7SNf+Ow9bgBCozG5753GbUDnOagKDbYmT41Ao6yxsw6nLaA9+NWS+2DmEZTF7rmIE7KYFqTE+YBxL2CAKgTrs7uIwPhkjUx118wQbeqZvrniYmWcNiRFo4kdM5FdD+zyoD6EoT/cULRmhyLEkTEn/ZJytDkOIFANkhckWtKpCT0n75aoYx842ejEQCj+uxARc0gTVN4bOvYTM2ysJEsVpiwuINa/O5O7BF7ue5pQUuSnVrjPGmk9BVMDw0n7Doszvs4qu7onEPtYfwooQnRvbj95muKtmxK/49SYGVSYk2jRL1owIjCUGkSSwSmh6KtIzSjdvwMm4+JuKETyRWzn8zrNmdKrgKy1iK0qA4c5BoHR5v5luYBYwCM6k+48JxXm4FFc6jedE2iDoXObMlicY4ePzsF6plKlrOeVPL9g4F1CoyHpcOj69zpdc2le/sJ34p99bgVp7FSi65AjTx81Uj+IIAfr/EuKZbyy93ZpUGtRJJhFD8ePqMe7kuC88eA0fmGpVfvzn2+OmSzINfhEAFfkkmaoTMN6BmieTYO+MhtlJvZFuQKN3tzAKeGHvEh9B/Zzg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(508600001)(86362001)(5660300002)(8936002)(8676002)(4326008)(66946007)(316002)(6916009)(85182001)(54906003)(66476007)(66556008)(6486002)(26005)(82960400001)(6512007)(9686003)(6666004)(6506007)(2906002)(53546011)(38100700002)(186003)(33716001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXFtL2lpUy9UVW0vVHJuVjFtWFlxSXplaUVsUDBsR0E3eDdVaXBURHllUFRo?=
 =?utf-8?B?dHQwaUdmT245UFhnaTFyM3VWY1JvbkU0K3lCcFBGVUxoa1FuajMzWUxLU0FJ?=
 =?utf-8?B?blRNaTg1aHpkZHFVSTdNRVA4amJ3NkxDSmNsK3FhZ0RpcHJTU2hkbVZhaERn?=
 =?utf-8?B?VDJDL0dsT25icEQzdE1OQncwRlN2NS9TUytyMnkvM25GYXYrN2lVSnA3TVBk?=
 =?utf-8?B?RldNZGZFdEJLQnZCdWZSNXJhVjY1TWxjRGhwVWx1UWp1U2xaWldWb3R4Q1Fi?=
 =?utf-8?B?bHM1RjRBUDkzbG9GMGRNVno5MUJHQ1JjYVFMeER2UG1EMTFvSExTYTJpQWpq?=
 =?utf-8?B?Z0hvUnprSTF6SzF0UDMrT0JVa0VTbUNlWGFZL0lkV2xKYVlRZFVPb0NnZHBT?=
 =?utf-8?B?bk8yWXljUVFnQVlSRnJ5RGRwRy81N0tLVE1NWnI4aEI2NmtXR1NRSUZLeTdT?=
 =?utf-8?B?WTBhWnVRZUsxOUJuMDlFbWJhNXhkNkVDZE5sVzJyeGkvRktYV0Jwa0JzdGVC?=
 =?utf-8?B?UFJHeE5EZFlWSDlCaXpEZGFPOU83QkRlS0FFQTVZQ3RUNmJHV21JUlZ3TUxw?=
 =?utf-8?B?d3QxUXQvZUFBNXpoWVNXQ0R4cTN6cGlYLzNFTm1UbHBsdWZ0UFR6SnpNdHFw?=
 =?utf-8?B?QlJzTjBZS3A2WGRqQ2I1dnN3dkt4djcrRjYwN0tzZWxwMWhWQmRBK2RwZkly?=
 =?utf-8?B?d09tMVhMdThkb1Zoa0tZM2dvRGliNkFiQnRSUWEyZHluV045ays2UDc5ajBu?=
 =?utf-8?B?NDJtM1JJTk9UWUVjT3llcmJNYXhMQSs2UzREb0x4dVUybXovQzJxdDlRM3No?=
 =?utf-8?B?QTZqL3lnZzdKcFVCcE56djVUczU2c1E4dE9ZYnVqZ3NmMUxlc3djcHYrRjRt?=
 =?utf-8?B?aVRSdDl6b1BJM1JSckdvY0dtRzNKZ0N6K2JVdDE1Znh6dGI0N0YzUEhYRTJa?=
 =?utf-8?B?YnB3emtTZ2szNlRyM2xLMzgzL1NtK2lJY29ENG01bENyaE9TZ0R2SUcwSENl?=
 =?utf-8?B?eSsxTnRxSkhEVWQwbWczOVU0dDBsQnJYSVBEQmlvVUo3VmFvbUgxV0JRMExE?=
 =?utf-8?B?YlRMR2dEYnlwNzUwaEhXODVPRVA5Q013c0xsdzMxWmkwSHRQL3A2dDVPZ3lv?=
 =?utf-8?B?VjRNQ1Y4eVBTam5XNzBraTdKaFJXMDJublhXSWJNSzNpTHJ4ZDBXY0UxS29j?=
 =?utf-8?B?c0xpMFgxK1daTmJpejNGb3pVVlZXSVdQTzNvUHVUOEpkQUt4OG5EY2ZIM213?=
 =?utf-8?B?aVMyQTRaaTVUN254dWg3ME1kNjlQVGNUei9EYWZheEFVbStLaU1nVkJQWUl5?=
 =?utf-8?B?ZkducFhRdHo3cVo4N1p1WUpWVVUyVUIxZkVSK1Q0b2RnK1I4RGdERnVMZDRY?=
 =?utf-8?B?SWh1Q2N5eldmODcrcFZIZGZMaDNEV0dKempabHg4ODR3SFlIaTdLK3p6UC9E?=
 =?utf-8?B?cTNwenUwTitTZGRxbE1vZDJKWXF2am5IeVkvbnhNQ281WmhaaTlsZXhhdVFK?=
 =?utf-8?B?ampubDNaWk1MT1pWV2F6RGFVSEsxU21rc0l4dkFTUmYzMWFKbXNvZThGRUtM?=
 =?utf-8?B?SFhTZk5ERnAwbW9ScmpiNUQ4TERpYXJXVkZXb1NQdXBDanFhbWFNRWExZDRT?=
 =?utf-8?B?UE1NS2g4Slk2SDUxbUR3a3VGV0NCYnhWbTRVdE9ocjcrdFAvWVplMFY2SHd3?=
 =?utf-8?B?b0MyeWxIbFFWU2IxQlpocGhWbit6OEZPc1NBV0o1azVvQ2l0SCtHekh6T2VO?=
 =?utf-8?B?YTVzVGNyVkNPMXIyNkNyYnB0RG5TZFFJNnFNaVRkV0xzUUlGem1nVThPaEhW?=
 =?utf-8?B?My9zTDVVVXBNQTJFU3plK3JGOStvaWVGTVVxSVFsczJVZE5WVTNPMUFPVENw?=
 =?utf-8?B?a0dJSEhOYVhDMTVYa25BMWNyVFhxanFySWdGbkxHTWxvU3pVM2hPYzM4UUJO?=
 =?utf-8?B?WDUvV3NJSmtSSXdmQzJ2ZDRYV09qME1JcGRVNlFwbWt1bm4rUTRBalVhbXBL?=
 =?utf-8?B?d1g1ZU9ZVW81U2U2Q2poRGdoQVRxTEdUdDUvckFSY241dHJuV0huZ2NyenNO?=
 =?utf-8?B?RGlVTnlFQ3lycitJSVhBYTZOdm1HMmlwV0FkbU1nTS9TNWxkNlBZNkNSMVBX?=
 =?utf-8?B?OTh6cE05TjByVHRQVVhNWEN4RzlBT0RCWTQyU0l2dXlFN25Ub0N0Q0xlY3h5?=
 =?utf-8?B?eHRLNnFDZERJdk9TNWlOQU12U3k0bFZlS1d6OVc0V1N3ZGlvV3pqbmFUemsr?=
 =?utf-8?B?eW5CWGdBUlhEd3lJL1hSMFhrcDB0aWdHbXBIUE55LzVOSGJXS0dQSTJTeXpx?=
 =?utf-8?B?d2NnelQrZmtUMlovR1F3TmovV0NYaFZiR0JaMmtSTlQvWmZRQUxoOUZEZFlV?=
 =?utf-8?Q?ERpOmpR2YhhXALZk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e33ceb-659b-4cee-0fcb-08da43cf0432
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 13:02:43.5745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcET4ZrCDB94lhHNMP2gyDPzRM9vpOZPnUCgPdPld45ZBMq/yUd7rTsvuaR7/2R9Nyev+S7s/3JorjM9334kgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4710

On Wed, Jun 01, 2022 at 02:11:53PM +0200, Jan Beulich wrote:
> On 01.06.2022 13:29, Roger Pau Monné wrote:
> > On Fri, May 27, 2022 at 01:17:08PM +0200, Jan Beulich wrote:
> >> --- /dev/null
> >> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> >> @@ -0,0 +1,110 @@
> >> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
> >> +#define __ASM_X86_PT_CONTIG_MARKERS_H
> >> +
> >> +/*
> >> + * Short of having function templates in C, the function defined below is
> >> + * intended to be used by multiple parties interested in recording the
> >> + * degree of contiguity in mappings by a single page table.
> >> + *
> >> + * Scheme: Every entry records the order of contiguous successive entries,
> >> + * up to the maximum order covered by that entry (which is the number of
> >> + * clear low bits in its index, with entry 0 being the exception using
> >> + * the base-2 logarithm of the number of entries in a single page table).
> >> + * While a few entries need touching upon update, knowing whether the
> >> + * table is fully contiguous (and can hence be replaced by a higher level
> >> + * leaf entry) is then possible by simply looking at entry 0's marker.
> >> + *
> >> + * Prereqs:
> >> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> >> + *   contiguous bits (ignored by hardware), before including this file (or
> >> + *   else only CONTIG_LEVEL_SHIFT and CONTIG_NR will become available),
> >> + * - page tables to be passed to the helper need to be initialized with
> >> + *   correct markers,
> >> + * - not-present entries need to be entirely clear except for the marker.
> >> + */
> >> +
> >> +/* This is the same for all anticipated users, so doesn't need passing in. */
> >> +#define CONTIG_LEVEL_SHIFT 9
> >> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
> >> +
> >> +#ifdef CONTIG_MASK
> >> +
> >> +#include <xen/bitops.h>
> >> +#include <xen/lib.h>
> >> +#include <xen/page-size.h>
> >> +
> >> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
> >> +#define SET_MARKER(e, m) \
> >> +    ((void)((e) = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
> >> +
> >> +#define IS_CONTIG(kind, pt, i, idx, shift, b) \
> >> +    ((kind) == PTE_kind_leaf \
> >> +     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) == (1ULL << ((b) + (shift))) \
> >> +     : !((pt)[i] & ~CONTIG_MASK))
> >> +
> >> +enum PTE_kind {
> >> +    PTE_kind_null,
> >> +    PTE_kind_leaf,
> >> +    PTE_kind_table,
> >> +};
> >> +
> >> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
> >> +                                     unsigned int level, enum PTE_kind kind)
> >> +{
> >> +    unsigned int b, i = idx;
> >> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> >> +
> >> +    ASSERT(idx < CONTIG_NR);
> >> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> >> +
> >> +    /* Step 1: Reduce markers in lower numbered entries. */
> >> +    while ( i )
> >> +    {
> >> +        b = find_first_set_bit(i);
> >> +        i &= ~(1U << b);
> >> +        if ( GET_MARKER(pt[i]) <= b )
> >> +            break;
> >> +        SET_MARKER(pt[i], b);
> >> +    }
> >> +
> >> +    /* An intermediate table is never contiguous with anything. */
> >> +    if ( kind == PTE_kind_table )
> >> +        return false;
> >> +
> >> +    /*
> >> +     * Present entries need in-sync index and address to be a candidate
> >> +     * for being contiguous: What we're after is whether ultimately the
> >> +     * intermediate table can be replaced by a superpage.
> >> +     */
> >> +    if ( kind != PTE_kind_null &&
> >> +         idx != ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
> >> +        return false;
> >> +
> >> +    /* Step 2: Check higher numbered entries for contiguity. */
> >> +    for ( b = 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
> >> +    {
> >> +        i = idx | (1U << b);
> >> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
> >> +            break;
> >> +    }
> >> +
> >> +    /* Step 3: Update markers in this and lower numbered entries. */
> >> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
> >> +    {
> >> +        i = idx ^ (1U << b);
> >> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
> >> +            break;
> >> +        idx &= ~(1U << b);
> >> +    }
> >> +
> >> +    return b == CONTIG_LEVEL_SHIFT;
> >> +}
> >> +
> >> +#undef IS_CONTIG
> >> +#undef SET_MARKER
> >> +#undef GET_MARKER
> >> +#undef CONTIG_MASK
> > 
> > Is it fine to undef CONTIG_MASK here, when it was defined outside of
> > this file?  It does seem weird to me.
> 
> I consider it not just fine, but desirable. Use sites of this header #define
> this just for the purpose of this header. And I want to leave name space as
> uncluttered as possible. Should there really arise a need to keep this, we
> can always consider removing the #undef (just like I did for
> CONTIG_LEVEL_SHIFT and CONTIG_NR because of feedback of yours on another
> patch).

OK, I find it kind of unexpected to undef in a file where it's not
defined, but I think that's fine.

Thanks, Roger.

