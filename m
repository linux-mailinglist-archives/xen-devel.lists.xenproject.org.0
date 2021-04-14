Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180735F1DE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110487.210908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdKv-0004WI-Jl; Wed, 14 Apr 2021 11:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110487.210908; Wed, 14 Apr 2021 11:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdKv-0004Vl-GX; Wed, 14 Apr 2021 11:05:33 +0000
Received: by outflank-mailman (input) for mailman id 110487;
 Wed, 14 Apr 2021 11:05:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5rk=JL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWdKt-0004VO-T5
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:05:31 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af2d35c6-e725-47db-8ce4-1c7cd1d3f697;
 Wed, 14 Apr 2021 11:05:29 +0000 (UTC)
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
X-Inumbo-ID: af2d35c6-e725-47db-8ce4-1c7cd1d3f697
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618398329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=VZIYLeSV0aN4XSzvaC8ife+MYqs04guLDyVOrAMIvpY=;
  b=h8Pp8zsk1LJ2IuuvDPYLpJriFZhyCY9f/Yx1vTihKQTmCp+Q2k+QHCHi
   tNlJq2CkYj5y8a7Xf7YWICZBTqEu44tzhzJgvUIQD4LlhoDlMTOodVorx
   uYLp5UrZqPDEQpC3W+JZ6vQ5Du6gToIIAyqQurjpjR90j0o2Mmyraq2BF
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zXKDX9ILNqWN/JyKuPLjvVqX7ZHcK7zH4hbSHXa8Bdt5Icw9ZTnqX+aIN7Kqd1HxQHHXJXwxDm
 ucOEsxPiK1U43HcHamlgoLbsIDfEgWLvQSIDd3lZuXeLta3OrBTM6ESlazM8RkF9lQVZNUrCpT
 uio/f6hUIihM/Oe1dHvuiRMbYenTJA2zEZvg6tnu0tinlRsy1HaKo5SJYJUMyDrdK2dwKP50E1
 Jhx04128J427iOnEOywI5x9WqrbVvXytStoueZ1M5q4kymSOR7/CB2WTZxZeMZU6qF65r+kW0U
 CTk=
X-SBRS: 5.2
X-MesageID: 41559652
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0XFYFqCdMQN2w8XlHegptMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmNEIyycFVB7QxQDOIEwE4
 CS6tECiz2rf3kWacrTPAh4Y8HoodrXmJX6JSMXHhJP0njysRqEyp7fVyKZ0BAXTi9Vzd4Zn1
 TtvgTl6syYwpeG4zDG0Wu71eU1pPLAzZ95CNWImowpLFzX+32VTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qV5yDa3Dwj62DvxDaj6BOJy6yJJ0NJN+N7iY1UaRff4UY71esMqp
 5j5G6Fq4FRSSrJgSWV3am4azhRikG2rXA++NRj6EB3bI12Us41kaUvuGlREJsGARvg7pEmHO
 REHKjnlYhrWGLfQHbDsmZ1xtuwGlw1AxedW0AH/veYyj5MgRlCvgcl7f1auk1F2IM2SpFC6e
 iBGqN0lItWRstTSa5mHu8OTea+F2Sle2OCDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJxrwcJCgLTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSWopj9Crr5wkc4zmcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQlc08X36Iv8LXOqznvuHWa5/oVfjQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oWkGXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 93ILbtlLKHtXC7lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR00GaYIAR8C+fbCh
 RWqVgy2a/fFe3f+QkST/acdk6KhXoao3yHC70GnLeY2MvjcpQkSrA8WKJwEg3PPwdvmRljrV
 pCbANsfD6dKhrezYGeyLAEDuDWcNdxxC2xJ9RPlH7ZvUKA4f00SmAjRD6oW86PiQMITz5Z72
 cBtJM3sf6lo3KCOGE/iOM3PBlpZH6MCLxLNgiDeb5Zg6vmYg12UGeMiwGLkh1bQBuYy2wiwk
 jaaQGEc/DCBVRQ/kpV1avn63tYXGSQdUAYUAEwjaRNUUD9/lpj2+6CYaS+l1aLYlwZ2+cHLX
 Xuej0JOD5jwNixyT+YkDuPDm8d250rJ+DRZY5TNY376zeIEsmlhKsGF/hb8NJZL9joqPYMSv
 /aVAmPLj/0YtlZrTC9lzIAAm1Tp3Ylm/+zh0Ggw2i8wXIlAf3dZH5hXKoWJtmA727iA9aEua
 8J+e4djK+VCCHWbNXD9IT8KxhkATnXqXStT+4ppYtP1JhC/IdbLt3+a3/wyHpD3B8CN8/6m0
 MVfbRj7Nn6S/pSVv1XXxgcw0Egm9uOJnY6qwDaAucxelc2kn/QVun5lIbgmP4KCk2FqBCYAy
 jmzwRtu9PEVTCEz7gUFuYZJnlXclE17B1Zjam/XryVLAWhbOdY+lWmdle7bb9GUaCAXZEdtA
 xz7d3Nv+iZcUPDqU3tlAo+BqJF6GC8R8yuRCqKBO5T6tS/fW22vZHC2r/7sB7HDR2ha0oZgo
 VZdUsfKuR74wNS87Ef42yVUaz4okUsjl1Exypo/2Sdg7Sb3A==
X-IronPort-AV: E=Sophos;i="5.82,221,1613451600"; 
   d="scan'208";a="41559652"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByKilPfKc1aWHxulc+pIAFbdkIBkPhYGSmwkvedYmi7wMEWnQGI/6IYmndjTBq4yQeQIprEIELqugvDk3j+LilNDeF10fqyVR0IvITypo+yjH1NtF+2RZ1PclU9SiqnjtYnmrPYb5pxu/7qZbMSGRfAPdBR+OVF2cRYMdkDGSu5u3mTkOeamAUq5mtIaqqTti1ckllpTwM+h73bRaI/JXEwkLKfktkEwspydj5OvsxV9YwNWgAKI4JPhMcf2Uw4oKOUGC50hGv0CmDAJ9GPB+PsDJw/fjUAp6X78Mh+Yax9Li3+yhs/P1wZN93Qrh27sPnJZsRVVczguel6NFlel5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHgQn41rDI5whB93Ym85E1U2wOPzHicCd0BkH1NVL9I=;
 b=RmmaUeI90iX9HQYUvchCry531vN+ktCo1wQ3aY30gH0TqNGDhVassjtQnJ44Hz5KYTcvFYTc41wUmfrfWlwkkzYUvdup/KDYf1zlkKXhrI7leFtiyBxfKPtJX94yZLBJhKGfa7TE8+AvkDpmS300RT8wf3Q9f049RNnQyg+gT+qi1KRPKQ79LY6ihw//L5c/PakTE2n3JCn9psUQoZ/oVkm3VIN7M/dPK4lMlDJVbuWQT1VejANil1j4FK1Xo8JW+tR4cDFGyQPMjs1vjXpmwwR4qoUs4tObYnQ20OXzvPC894EVMHe8+zgqHsIsdbh2p3biXrxo/52LaIvrOblyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHgQn41rDI5whB93Ym85E1U2wOPzHicCd0BkH1NVL9I=;
 b=JDzbVUR2rvwzEYUZa+hctOeueYYRGNRSxYkik88rNu0kurwJs/NIFGgKtjQO3qSe+py9PPmojFkBlhNzZ24GfLqmltErU8IgYSi8cqy0IKt1SuGOoNmDIiz3J2YTb1bCY3aAHp9qt7uFthSPS9Tt6V+TVfGYTQfcnvizrnRwwNk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/amd: split LFENCE dispatch serializing setup logic into helper
Date: Wed, 14 Apr 2021 13:04:32 +0200
Message-ID: <20210414110433.83084-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210414110433.83084-1-roger.pau@citrix.com>
References: <20210414110433.83084-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5da8a8f-be1b-4a87-cb75-08d8ff35353a
X-MS-TrafficTypeDiagnostic: DM5PR03MB2842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB284265E4B68824A37E6875468F4E9@DM5PR03MB2842.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZcQEnS6t140d6uTg1uSOtlk9ixypH6Gd+o79IvnYOya5s3bggRi6WUqf01nYX0rAPiWo4RduyRUR4pcrFoJGEns5qzlI/Uqa3e/pzEsLcWOJKgiyd0kjDV2kzd1VaLj768MONMNIC1swUyXmslVJDZHZtGViUCEy6Sdu961Kq6KTxZtiFzP5W5Eu+xz/nirPQyW5YRIHSuVn0OJbpQM8pMV6J3/9LwzC7MQ1fUFAqQlspPhZbj35nsXH9ScEWXDGnJPedXEyeRvyODX34mdAKCHMYceYH19m0DaQzSUU2Rhk/ShUwDx3nc2mTVkBdDsbTGaNm6qhOICQNzKYyZYLPOwu6e14ufoIanbbVaXpbrKncrGqLBuqDQb5lJa1/3ADGhKpIg7QZI8/ezWP/BNZVHBAiO/CuIAmVBrzUDu6clWhf4r/T+vaCms7kXdD/eDJLE0TS8MB/TjQJgPqUg6XgO9NXp6W2RNjNBK8Gxsoc5U3vivGmJjZxzzfQZ8DlMfwc93KmN4boHdISuZQ/mG1IzpfTycCRKtlBj1rB0tSKw+ocmXOHzIipToajfFSTAuMDXjZjJdbpfNI1p82KEOZHrYfx15EObPbIsIy7yzfoRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(83380400001)(2616005)(6916009)(316002)(6486002)(54906003)(8936002)(4326008)(38100700002)(8676002)(478600001)(6496006)(186003)(6666004)(16526019)(26005)(36756003)(5660300002)(1076003)(2906002)(66946007)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THpRRTludWN5STZKM3dxRStGMTAyQnFkT1ZucExQTTVhRTJTZDdNWWo0Nkpn?=
 =?utf-8?B?Ty8yVnRxcEdTd0FPSldBS0hTT09UNnpLUG5IYTlHcG0wSFZtQTlzcGEwN3lD?=
 =?utf-8?B?ZU14V1dQRUFZMHM5VDZiUFU3cEhqbXZQWER5Zi9vak1XdXBJZ3dudldCQlY2?=
 =?utf-8?B?RVBRdTJ6ejArVkFQeVdoL09yVklVM3NHMFNOUEhRRVZlbTZZWEtLSXY5bkd4?=
 =?utf-8?B?SDN1K3JzYUtDbzZVaXV1Qm5tbHp3bEI1OVlqYnQzT3l2VDA5R1JhR1ZrN1JT?=
 =?utf-8?B?a0V0ZTBPMVlTVHJEME9CL3FoaGhrMVJxbFlQWnZWSnpEYXMyd3dEa3VOSWFj?=
 =?utf-8?B?bDhyd09aNGNMNjFaWFFjQU1PZFdvVWwwN2ZnWElHcXAyaFBvS3RGR2Z0ZTZo?=
 =?utf-8?B?SWZWcEFrZTd0a0J5NGRPNm1TWnEzM2dVaVVmQklWN2s4Z1RManljTllwbXJV?=
 =?utf-8?B?OTZ6VU0xcm1RWHhrTjRIMUFTbXZvdkcxUTJ4dHpZNWhjYXgvbWs1UDRYK3Fu?=
 =?utf-8?B?RllRRmNER1dsV2liYnhtZ3hQditrbjJyc2s1OWVpdE5EMjdoQjRLRFN3b1V1?=
 =?utf-8?B?R1FQQ3RXcG03Y3N3S0Vsc2NCRzdTenVNNXhYaGJuZkdHNEhiTnV6QXRmSjhJ?=
 =?utf-8?B?V1lYc2V6d3pTZTBTTmdiWSs2bWdOY016bEtCRjFUVXJHaFRlNDFJL0RDSlJN?=
 =?utf-8?B?MWZ2SWYxazh6RkRwOWxVRy9IcXJWamh1dFFQWXlsTW1RaDlpSlBwa0lLZ3VV?=
 =?utf-8?B?RHFwUE5nU3h6THNkbUErYUpValRQd3Z6YXNHdXRSYnMrdDRaZEEvQ1pIcVlU?=
 =?utf-8?B?N1dlR2lBWHEydTBGL3drelpNNWVwWnlZTVlwTTRKRHZGZHBWK3oyMXJ6VmxD?=
 =?utf-8?B?RndDeEIzWURZS1VRWERqT2hxRmFDWG1Da0pxTDYzUXdGS2ltZkJMeUxYUkp5?=
 =?utf-8?B?eWE0Rk9xRnB1K1JuemhwMzFiak15V3JWNlA5T1BnYlh4eHZaZDlhQUc3cFBS?=
 =?utf-8?B?NHl3STBXOFVDbTd3dXhYVEh6VkJjMWhRd3poTGs5VjhmV245NXJSYU1PSmE3?=
 =?utf-8?B?V1Ixc0lhVzk5U0U2VTVhb014TXNmQlh5aG13V2dDMUtmY3VpWis2N3daUURr?=
 =?utf-8?B?RHZFYWJJeThaa1loaFVXWFdiUlFrekphNVBiOE80RTVzaE5kN0FheUY4RXcw?=
 =?utf-8?B?Ni91SUlFMnNQWGZxcWRUUnZpdmZpZnlMWmZabE55NFJHSFNxZTdKZHBJbXQx?=
 =?utf-8?B?dGlGdE1jWG9oY0JaSzRncyt6TTRlMm9jY1h5RXdxMk9KMXFtU2wwdklyRUFs?=
 =?utf-8?B?V0c4WVZLdVJXL1VhUXliUmw5V0tSNDBURmdnVmJOZWliY05hQ3N5eFExZjlL?=
 =?utf-8?B?MkNoWlZTSFF3UVpYdWZOWFgzYjFoNzQrbXZnVVY4RnBQeVdTN0I0RVNrR3JW?=
 =?utf-8?B?azQ5ZzRuVDFrVzk2emRxbFJGeDE4bU1xYUhlNURwWFNhOXphN1poRVJWT1NG?=
 =?utf-8?B?UmZndVJ1ZHVUb0ZMQ2ZXeXZzajJ6b0liaTF4VmRhbTREL3VLSHRRV0Z1bDdk?=
 =?utf-8?B?bzY4VTdsOHJBS2pLclRtYXFXeHB1aHpXb3dTdnN0MFQwY2FtTzFKdzBwSWxU?=
 =?utf-8?B?a2V2MC8rN1doeWlnU0FzMC91QUZIQ0hSNUE5S09wV09QOFFMQ2w1N1lzU1Nq?=
 =?utf-8?B?QS9qbVpPTmQvY0lkdGxpT2NPNWduVHI3YUZCUHp5TmV4UGRqY00rMytUWDFy?=
 =?utf-8?B?YkVoeCtISzRCNFB2QzhoWVlNeGdoTkR2NWdUUGJST1ZxS1NtQzVQSFJrY0sz?=
 =?utf-8?B?ckpVaFhxYWMzYzBuWER5Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5da8a8f-be1b-4a87-cb75-08d8ff35353a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 11:05:26.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WcTvLjFzEQ8cug6eimh+rdhNLAbqHHvTwziYPHXFS7kgRyzfYI96BgZznG0EJ4tpWpLnPCykWfasBidO6Z+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2842
X-OriginatorOrg: citrix.com

Split the logic to attempt to setup the LFENCE to be dispatch
serializing on AMD into a helper, so it can be shared with Hygon.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c   | 62 ++++++++++++++++++++++------------------
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c | 27 +----------------
 3 files changed, 36 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 8bc51bec10d..9c8dcd91eef 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -642,6 +642,38 @@ void early_init_amd(struct cpuinfo_x86 *c)
 	ctxt_switch_levelling(NULL);
 }
 
+void amd_init_lfence(struct cpuinfo_x86 *c)
+{
+	uint64_t value;
+
+	/*
+	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
+	 * certainly isn't virtualised (and Xen at least will leak the real
+	 * value in but silently discard writes), as well as being per-core
+	 * rather than per-thread, so do a full safe read/write/readback cycle
+	 * in the worst case.
+	 */
+	if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
+		/* Unable to read.  Assume the safer default. */
+		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
+			    c->x86_capability);
+	else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
+		/* Already dispatch serialising. */
+		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
+			  c->x86_capability);
+	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
+			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
+		 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
+		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
+		/* Attempt to set failed.  Assume the safer default. */
+		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
+			    c->x86_capability);
+	else
+		/* Successfully enabled! */
+		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
+			  c->x86_capability);
+}
+
 static void init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -686,37 +718,11 @@ static void init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
 		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
 
-	/*
-	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
-	 * certainly isn't virtualised (and Xen at least will leak the real
-	 * value in but silently discard writes), as well as being per-core
-	 * rather than per-thread, so do a full safe read/write/readback cycle
-	 * in the worst case.
-	 */
 	if (c->x86 == 0x0f || c->x86 == 0x11)
 		/* Always dispatch serialising on this hardare. */
 		__set_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability);
-	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */ {
-		if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
-			/* Unable to read.  Assume the safer default. */
-			__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-				    c->x86_capability);
-		else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
-			/* Already dispatch serialising. */
-			__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-				  c->x86_capability);
-		else if (wrmsr_safe(MSR_AMD64_DE_CFG,
-				    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-			 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
-			 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
-			/* Attempt to set failed.  Assume the safer default. */
-			__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-				    c->x86_capability);
-		else
-			/* Successfully enabled! */
-			__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-				  c->x86_capability);
-	}
+	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
+		amd_init_lfence(c);
 
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 1992596d1b2..1ac3b2867a0 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -20,3 +20,4 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
+void amd_init_lfence(struct cpuinfo_x86 *c);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 46293f1f367..2272e1113f1 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -32,32 +32,7 @@ static void init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
-	/*
-	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
-	 * certainly isn't virtualised (and Xen at least will leak the real
-	 * value in but silently discard writes), as well as being per-core
-	 * rather than per-thread, so do a full safe read/write/readback cycle
-	 * in the worst case.
-	 */
-	if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
-		/* Unable to read.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
-		/* Already dispatch serialising. */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
-	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
-			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-		 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
-		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
-		/* Attempt to set failed.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else
-		/* Successfully enabled! */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
+	amd_init_lfence(c);
 
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
-- 
2.30.1


