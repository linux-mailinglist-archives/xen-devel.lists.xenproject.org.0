Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DD429127
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206091.361573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw4J-0002IC-5E; Mon, 11 Oct 2021 14:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206091.361573; Mon, 11 Oct 2021 14:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw4J-0002FO-24; Mon, 11 Oct 2021 14:14:19 +0000
Received: by outflank-mailman (input) for mailman id 206091;
 Mon, 11 Oct 2021 14:14:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpBC=O7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mZw4H-0002FE-Ce
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:14:17 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1b09cbc-ec13-44f1-a06f-379951c8212b;
 Mon, 11 Oct 2021 14:14:16 +0000 (UTC)
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
X-Inumbo-ID: e1b09cbc-ec13-44f1-a06f-379951c8212b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633961656;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=p1wxXwFih3yoinGSgAomfdeN5BEfbooqJGbs01vdNCA=;
  b=gyAMq1BypzW0xJFLin5ys0zTChV6I4YMt91mRQ52N9zQeUR2Q347WU4S
   qBE/Zg1NA7ChpP4v5BRf9S0kdcd1iYeP/6ydciG1u4XFmCLactuk2h5S6
   hOY4e0GPaTO1Ihp9DW6/KkQnXJ+do9LsiA/ERk6TJFSRYFiFJURRaFrbP
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CZFDDOC9wUAecROURszuoYH7DSBd/5B599xP3OrFzWFk5sOTpKO7pqRVOEQPhOBcOgwSfMdYmG
 OYG5YM3WjNkgk8Vvo47wQKw5Op4uUKs39Pl5p6SJtZ7HDjYNxB1rqr17zLMzhFHCmlvdKRdHML
 83sao1qVSCz5XRmGlWvXed4eHdJKDDZFdX5XVKBdM1VODi+cMK1o1lrOFjwf0/MraPZdn/V8JU
 z9U/Zrz+fmDN87TPuEErVa9C0to/YFdF5+EbOws/sLvJZsFculi/BMpWHWY7HAHCCzXLpHlRUn
 CgrmC99yxbqfghFY2m0osq6n
X-SBRS: 5.1
X-MesageID: 56755400
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uT+IvawmEAurpPQd9ph6t+efwSrEfRIJ4+MujC+fZmUNrF6WrkUGy
 msbUWzTOazfamX0eYh0Od62ox4AuZbWnN81TgRprSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dg2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt91zk
 uRir53ucDhzGpTngccEfCd9VC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY254RQKuCP
 5JxhTxHYRuHUixyYkgsBZMck7e5u3n4SyJzpwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcIMNFpWo+/hymlqRy2cPThoMWjOTuuKlg0SzX9ZeL
 U08+Sc0q6U2skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ6tcoeVTEsk
 FiTkLvBGjhHoLCTD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznQ9Q5IYGvj4PMJmvU+
 huTjzERuZBUgptev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgeDs64RRGqNZhzY5
 iJcwpnBhAwbJcjVzHTlfQkbIF2+Cx9p2hXnillzA4JpyT2p/3OyFWy7yGAjfBk3WirolDmAX
 aMyhe+zzMMDVJdJRfUuC25UNyjM5fK9fTgCfqqFBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05l2HmFr9CiOZ3mHtWKYbvqXbTlE7PPV22Pi/9dFv4GAHWMrBRAF2s8W05D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEJTILcueliCjTcbaelAOMDh4U5f5mOp9E6Q4z/U9vrqZp
 RmVBx4HoGcTcFWacG1mnFg4M+ixNXu+xFpmVRER0aGAgiB5P9n0tvtDLvPav9APrYRe8BK9d
 NFcE+2oCfVTUDXXvTMbaJj2tot5cxq3wwmJOkKYjPIXJMcIq9Xh9oC2cw3x2jMJCybr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LyDfj8dVt6BLyrtIgieMW
 xqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4oz
 LtzuMMS7ADj2BMmPszf03JR/mWIaHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLE1rDfg7l8x1bZdythHHfA6uNRmJAStU0Y11QFPVmIxoLIi/JfMMe9KtjrotC5Fil67t8=
IronPort-HdrOrdr: A9a23:0ewzaanzN8hz/BwMtMx2zItjdNDpDfOiimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOoXfZAbCRXnzWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yuLhq4m2efJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdlTXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZjfh7Q+yMbzZtB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjlREOLFuKoN5nMg6xgd4AZ0AFCX15MQMC+
 91FvzR4/5QbBezc23ZhG9y29ahN05DXStuenJy/vB97gIm20yQlyAjtYoidzY7hdIAoqB/lq
 H52v8CrsAWcicUBZgNT9vpD/HHUlAk7Hr3QRSvyG/cZdQ60kT22tbKCYUOlZOXkaMzve8Pcb
 T6IR5lXD0JCg7T4fPn5uwDzvmKehTnYQjQ
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="56755400"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnMjnj9slz6rfKsWNxUUPmE/5wB6x032ohGdXxceWVYxjzyRvMsBtcmoHDcisbc6ymrDl2uBalGDzcBRd/W0WIGg3UlltoHq+VgaCZ88paKdv5EzOS4HfvPX1WORgZ7toHrVOWwMcDzoAI6YDi9lh7S6WIzsni3HZueTJyO5TZx3waGFNwV+LmtfDyQOBIwiFY+Hk/65H/uzKNMecmtRvQeUHOtaVrK2L8oNTjnWxe05Q+1+cBTudTzpat8SdETC6q+VEqQJtib8lGv0jHuNp1UeETwvCA6zflJEAXvV35Iv6vLsfbwAJgYJSoq+Af+ImxfMK2njilPEbuHJnhLubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUss51mAJhkh+vckdc2Bb1hlsinXJjqsUqnVrbtypkg=;
 b=gjMqTLUZBI0dt1rRt1CSFRIpZeL68dJr8ZI1TMJMkRT9SIN/rcF6InkGfMTwnhQNXnHn8++Qk3hkfWtMtgdzEgfmLXt4eDw3TA29Y7B2XBe9nxo1ShX+qc2HY3uVofNl+z5vSn6B8bwKyREaw828zM30yhew0thKZyt44unwcBYQTaCWBf1mTq50pzbh/MCGNMirrCDIVcZyQhbklwVTiEZvBJN4qgTrS1rSAZ4ucahI+N94Ujo7UX2+kVeM1Y1PE4qkLV3H6n7OI/3Y4idH5X4ObizYb4gpmaisAybpUL4Rg7joMZFkclcnNWGYMQTPLEyoLFuzMboEj/G5UCLxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUss51mAJhkh+vckdc2Bb1hlsinXJjqsUqnVrbtypkg=;
 b=SW7lU19jzpI39eM0XGPurfa6o6aNRy+05sBNBpGt2PjCGx3stko91HXLX7eIpEYLU/iBTvlpNoj/ChWkNR81pXkJRprxIGMgGSynFIgNe5CHX9tWnNGRmN0VP3Ham4qGUP1KUqiAPXPFYw7QKwmplKDjp643E9nQE1JNJ6x1Br4=
To: Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-6-anthony.perard@citrix.com>
 <e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com> <YTibMaayiWlJwcZ/@perard>
 <24888.41483.762554.171248@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
Message-ID: <15ee51ba-c63e-461a-b771-6893444f5a84@citrix.com>
Date: Mon, 11 Oct 2021 15:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24888.41483.762554.171248@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0331.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::31) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b76ab1-991f-4485-9448-08d98cc15856
X-MS-TrafficTypeDiagnostic: BY5PR03MB5048:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5048A05D4990068F6AB9D44EBAB59@BY5PR03MB5048.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 63lk6GWbDVCqUqY9rpVld3bz7ug4vhd1eFTmNH5IhDv9AGqu6RK134w1YybWxZTWhkAB6HFnd48YlYi8kIji6cUdKkyfjdchsY2jvg2HX2mWXU9hmw3/nHiFrzDt/vPNR1EIcE97ipVwWk04weLEI2NKYTHEKe5lJlmVCWjctGfpryz8BB3mh0pYNUJznAZBIM+OQWs5UbBvV5lphO9zqdIZQmMtO6Xe7QQrriNX7qDM2vEb83QO75khHmjZmr7i2yLgMwRSveJdI7b5vnGF6Ee+qwZUO/XPcUhDdf5Y2Hl9LbQmGH5fU8wRgIstWVKYb7NsateWerT4Hez4BWRsymlRTTivbUiVTDbHZEDW5WM2fWpRj8C3Tbv6LnQg4vO5jHOWoYlnXKlQMNEhUF0+tF4K6BsyOsYe+TuvpDEUbDZW2N0+L1YfoImTBHrBdggilfkZqjfe//hyNwPAITJdaV/l8ky6RplEfYPZsVz+qXpWIm6OTKksipnlNUpw7Srd1LVSDpJDCu8+gCpjim6kKHh3cVygJYwgBCMVwxyalC8fPIyU1ODsBj0XndEjpOi5L7M8yfpQACIWmfeBa66e6UPK09lqxeJZCDNE0WJUhaiHv/+NbFacGSbzoeUCjJ6XLwedUBhum8vExyrSIzHPkboxOtiC7O2V9gS7omt24C3bKJTYxHQC5TLX4LV975uJ4e6/DGYTV3AuEG/4sPmBCHc2WhD0NMx2mWhUSKP1vIm9L1rtTHBELj9I6I/vHtCLeNj4ExVoWf1pXFYaf3FYhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(16576012)(55236004)(86362001)(5660300002)(66556008)(66476007)(53546011)(6636002)(4326008)(110136005)(956004)(36756003)(2616005)(2906002)(8676002)(54906003)(31696002)(6486002)(83380400001)(8936002)(508600001)(316002)(66946007)(6666004)(31686004)(26005)(186003)(38100700002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1J0bTExa2Q5Q2kxcWdYQkN1aFQ4SitkMTFJYk5WOGJmeTBsTFMvaHZ0cWU0?=
 =?utf-8?B?cFB3RlhDVkhMbmF1cFFkaHl4cXlzL0JKQ1NwVXhTZmVPMnBMRkFGY21CN0Y3?=
 =?utf-8?B?RFdXdU5Db0lVZXdDVVlCRmMwRUFmbWxVT1JBZlAxZHNIWmZMcjQ5K3ZYTktU?=
 =?utf-8?B?U0hTU2xad0I5TGtaWGtwWDZObm1KWFd3c1ZFL3pXem10VFB6MnJ5a0c4dVQw?=
 =?utf-8?B?NzVXMjd0N2prY3RVWGVGUWdxcU5NSXhwLzg2ZGRzLzA2S0JQU1crMUhLZ1dX?=
 =?utf-8?B?QS9NSUpCMjI1WkFFMGpSOENrcVArR2NrY002dmY2UkxlYUFUNlJNejJrVTR6?=
 =?utf-8?B?RXpSVzIvZVlwK0ZzbEZIbktYMS9QNTMvR1VOTFh0Q2RpS3A2bXd3ZmJDeW1l?=
 =?utf-8?B?WXhvbU40Tjl0WXFUYVR6VkVSbGc3aUdsRnZwR0MxVld0ZlpjTkQwNTVFQTBQ?=
 =?utf-8?B?Z09BZEgzcndkTnpsZUprSjRwdGkvWWVtcks4VHljemFtTlMyeTlBTDgyclZP?=
 =?utf-8?B?Zm41TlBlT2dORTB6N3BkZU9YajBWSkUxaGMyUUpHVGc1T1NWTnRNTUZiYVZy?=
 =?utf-8?B?cEtVSThXd0ZGbFcrS3ZnSmJnZGtLY3d1OW1oUzFhbHozd1J5VU9MVFB2eXlL?=
 =?utf-8?B?V2Z3ZEhTWjNTQ0pQbTBocVVDMXE4YVhLWmxzcmtUcHFPK0E5S3IzVVMxS0V0?=
 =?utf-8?B?TGcrMDVDQkw2N1R4SGpkZ05vOGFrcTgwZWlhWnpmVkJGUzB2OUtrSkpkMWhG?=
 =?utf-8?B?elVxQURyMDk1MldxODNiUjR0eVcvR2NHVTY0Q0t3NkJBcUxSRklmZUZzSXZl?=
 =?utf-8?B?dzFHbkNoQXJSWHNabUNRUTBrNXhQblB2UVJiYWJxUDUreEZGZm5TMGZqK245?=
 =?utf-8?B?NC8zTWk2bVptUUZ2TmFZVGswT0ZpOXA4MjFjV3QyTWRjUkE4MG9MRkkwSXBi?=
 =?utf-8?B?VmZ6WGJVeHhiUldWYnZMb3hLUUd0S0VCd1RBN2VIU25wUnh4TlRETWw4cGRp?=
 =?utf-8?B?bWp6RnRJWlA1RVA0SUhuOVJXTUZaQTBZbFpvNVplTndzYjUwSUo5dE9RT2Nz?=
 =?utf-8?B?TXZpZkZ4elc3cU9kR1l1SE1ieE5jZjdOL0tqTUFvZHJpYlN3Zm4yR0RKNlhB?=
 =?utf-8?B?NHdaTVVBY2l3R0tCNWpsWC8xcDY5NUFSOHNKZEJhdllyOVMvOHY1NUUwUFVx?=
 =?utf-8?B?WEYxRHFvVnE2RHZZUU9SU0J1MWxacFdCcTZsZm5TQjVWMmxuYTRZeldZSlk5?=
 =?utf-8?B?TCsvdWpycnN6STBtT2xDQ2dsOEF3dE1iL0k0aml3eGpyamN1SWpFTGNRVkUw?=
 =?utf-8?B?SUJYV2p2OWp6ZlhQZ1A0bjJQbUdqdTltUmNWbWdTbmsycUhyazQzUDU3Q1RP?=
 =?utf-8?B?S0pYZ28vYXBZbFdOTzJaNU1VZHVtSHgxVU41STc1YytCREZXV3V6akJrTUt1?=
 =?utf-8?B?Wkk5OVA5eWQvdmY1dmVTRStJUGFiSWprSnVsVnB5c003cTVaVE0yUEhDYzUr?=
 =?utf-8?B?UWNVblBBMVRVNTl3VTRTRFNuRWN1dWtWalpzVXE2bU0xNit0UXl5MmQ0dnh3?=
 =?utf-8?B?QTJoaGEzcnNFMldBYlB0YkVDMlVkTk5EeGlCMDE3eGYzN1hSVXV6ejdWcngx?=
 =?utf-8?B?ZWVKVEJNVVdYRG5VMTBmdmZqa2hIV2NNVDNNTndudTFxMjZQQ09NSm4rMVNP?=
 =?utf-8?B?enFuc1YvWHo3M1VLcUJqVFoyTDZhREtIeDlQblBLVmN5OFV0dkpzOXdYYmRF?=
 =?utf-8?Q?CLFZeaT0WRfOWwWn/iajVBTLT7WwjbcrLEPSGVi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b76ab1-991f-4485-9448-08d98cc15856
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:13:49.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5i5RxnbyJqBKhoGBhlwYw6mXaP8S81iyMbIkYL/9HcJBjuM7COuiXVxmV/3Hqn2e9ze5tapznIA9vH/UNNcD+6RxYW/yFbfXoBqGnZxN+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048
X-OriginatorOrg: citrix.com

On 08/09/2021 12:44, Ian Jackson wrote:
> Anthony PERARD writes ("Re: [XEN PATCH v7 05/51] x86/mm: avoid building m=
ultiple .o from a single .c file"):
>> On Tue, Sep 07, 2021 at 08:14:14AM +0200, Jan Beulich wrote:
>>> Hmm, when replying to 00/51 I didn't recall I gave an R-b for this one
>>> already. I'd like to restrict it some: It should be taken to stand for
>>> the technical correctness of the change. Nevertheless I'm not really
>>> happy with the introduction of the various tiny source files. I've
>>> meanwhile been wondering: Can't these be generated (in the build tree,
>>> as soon as that's possible to be separate) rather than getting put in
>>> the repo?
>> Do we really need to generated those never to be change tiny source
>> file? Do we really need to make the build system a lot more complicated?
> I'm not an x86 maintainer, but my 2p anyway:
>
> I think the handful of tiny source files is probably better than some
> contraption in the build system.  Much less risk of something funny
> and confusing going on.

I agree.=C2=A0 This patch is definitely an improvement on the status quo.

> We could reduce the number of copies of the same text by making the
> copies of guest_walk*.c in hap/ be symlinks to ../guest_walk*.c.

The two guest_walk's are totally different logic.=C2=A0 Adding a symlink
would be reintroducing "something funny and confusing".

>
>> Can't we commit this patch as is? What kind of issue is there with those
>> tiny source files? Should we add a warning in those tiny source files,
>> something like "No modification of this file allowed, it's part of the
>> build system." ?
> I don't think we need any such warning.  No-one is going to take that
> tiny file and try to edit it to put functionality in it, and if they
> do it will be spotted on review.

Agreed.

FTR, this patch is Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com> and fit to be committed.


