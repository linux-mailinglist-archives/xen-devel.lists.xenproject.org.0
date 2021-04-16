Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C0362140
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 15:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111753.213731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOjY-0002Vo-VW; Fri, 16 Apr 2021 13:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111753.213731; Fri, 16 Apr 2021 13:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXOjY-0002VQ-Rq; Fri, 16 Apr 2021 13:42:08 +0000
Received: by outflank-mailman (input) for mailman id 111753;
 Fri, 16 Apr 2021 13:42:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXOjW-0002V7-WA
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 13:42:07 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc84b4b2-4df4-4903-8c0a-57855bba457e;
 Fri, 16 Apr 2021 13:42:05 +0000 (UTC)
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
X-Inumbo-ID: cc84b4b2-4df4-4903-8c0a-57855bba457e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618580525;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zf3L37ioT5E4VpIlU4TBg7q0SjAb69aYynp8jqd1Gfs=;
  b=JoUljDyweh4cmlK2oZmXHzlUeJxsQ2wylX6gdUTxYj+plktH6Pu8R2NK
   dVpbm46H/Wf2bsD8jIbLXUrw38cWyWjWcGL/daBPEkSdbfATSppnBU4tZ
   +m9zpISO9OASB1G+B8xbo++mLY+kTytff82/1+G+geHdqsR4og9ZfFo32
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ICjlh5Dc5G8OMGlVv/UVWrsj5540Z7XRm9CCPEPzmciN0uRna3YPIR67Lcj57q+2fpl0z5ibBJ
 4+R/cO7CbbJHsoy+fSgUDeUq8vmwsOEfqqbkwOxNf45TMGXANlP0tdxaN7XH6rJCf3irykME54
 JzSUZBowqfz+gf7iKaxM5eCB31/RsyMUtebdjk4bqUqn4xALypUZlwA19PYo7VUzlCJb3ZGVoD
 hWSCDXS9larIPyNcp99UnJnBFMndVBQJy/FJUAv8zSoyql2SDkwFUTnPcn/XcwkqKplpZID8mM
 Pv4=
X-SBRS: 5.2
X-MesageID: 43244135
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3ztwGKGD+Y06eapRpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYdNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtq/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvRnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFALM
 BSCqjnlZRrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="43244135"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9it81w3jqQV98uE8u/2i/WRQlI3PzCLCKy+WN3iDI4IZkkclJajW6F1I0cs3M1W67592k2tROqn7sQnN6EYjW1dfuSvCStLRgEAm3kIV4w8jhjnZ1IdXDZuzI0GT6vFs9Va0hyjcHt09yGRdl5kMnZbta0zD2id/fjdgcVMCt9V8nhWAmM//2A11ppMDfmDZyX8TGtO4f7tWSorjylb8UcjnMtMnCKmV99AVZCYv6RppnW4/JTpwSLh7ds8ANZ5jjWiygq5Z6JmnYiuLSQz1iwp0934Xa0Z7EpeXBcYsjA4YML7lwmgQTYw3+T9dtqx07KB1wJgpHePs2SrQcQEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXhPfiG0SayL8xY9zIMH8XBMLF2Wd+VFrEKVsHjucGc=;
 b=fgf3kMD7z0qebvEznVfsUoXmUzVbQQSvX9SjhJE+w0A29cdCNHLxy/0Zpdw6EEbtT4KcuMy68bz7GZkS3bM5gtYs6nSTKSzTicPdYbFVI0HcdSzj0zOxFTBByG7GjcAqk0uxpquLvWKacTMZV6ogEpZxrgaGUgda+A2j8rYA+7BxjPZdNTbxXkQSWcUl75EboJTSP1rrBSpXQ/lu0VY0Gjw/tgvPkwlmEseAnH5+01YzHEtwJECDRiaFZvO6jVKDuAgxsR3zysnlC7NdVIKUUVibYQGyf2VwAhe8qHXwaQeG++l9Q1eZB6TD1R5gFjIlkxriF5Gt+wSOOTITiK+Lxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXhPfiG0SayL8xY9zIMH8XBMLF2Wd+VFrEKVsHjucGc=;
 b=X8E0tSijYTfExMfDGn99MPjR8YrwjS3XdRYRZGEejcp817qol5rT80pzViAncPdSCDYd/vczDhDQ+F9hEqJ7uqy23pm10HWQG4vmfvYPIeZBRU7WViLJy/gKUM0pT0LNLuD7Dm7ZhGs5RGHHX4guBlRPStPXJXsBx6jUQ6RbFEM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/oprof: fix !HVM && !PV32 build
Message-ID: <eaed70b7-c387-1ae1-28bf-7d52a4b650ae@citrix.com>
Date: Fri, 16 Apr 2021 14:41:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <694c9c98-1197-3378-cc43-235e2609c1dd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a41bfe78-119e-4104-c0cf-08d900dd6ab2
X-MS-TrafficTypeDiagnostic: BY5PR03MB5220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB522070AD2E8EE82F7D46A6F7BA4C9@BY5PR03MB5220.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFoiJ59aLmEpgUmVHljZryr+8v+oKxGcSMeiMQn8jivarBBNhNK1C1VhHZ7Qi1A+nV52dl+wrI2RDT309HtnSPm31DqsUfgEP5MvLKK/VkJ/aQvmgLLkqrNCNH0S/CVYosIhUoIeqYlLKjRFQeKGjP24BsItV/fky2G9OMI38gl/UAPJI2awcp979+F0CcqzwMSZcKEAoiPHwPtpAUN4YAACfxXauBBLR6taTXMxL42KAvFbjWjcMSca0GvvrOmjic7IpmdY3il0WnyUxg+oACUSAXTbl+j5qDyOrASs74VyBV4yg+bll2tzRkdBOXcPPsFD30vMB1wI7BjbJh2xK01JtFm1hG3Gckh1eHM1oNgeGywC4WUsst+jGK53rTaandbyXE6xlzKMzXywDbPtkWorawo0Fna9yrUzxOWQGHAg+hySK7d9qOKc/gKZLSbuVFnSFfHcKqrS2dEos1xNjqrK6SxNxov1wP2gm2yVWoPPYr6tqIQzSW4ZcspZ77mmzFramHawex9n+qhioLm/NuofBLJKpBFeKPSLEE5y/BaTL2bIUHlzwZ1XjF4LNAtqAR8Y44sgcfT1/Zunly1Ob49rpi6AaucC1vluEcRLR0N6o7LVvJpC1Ibve9Ztc40EvXdI++yV2laWojhmwIB8a079XTvKUj0QIhMzi+aQyLxsX0nKhpWqCx8Np0XpsJ/r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(31686004)(2906002)(16576012)(316002)(66556008)(26005)(6666004)(38100700002)(16526019)(66946007)(8936002)(36756003)(110136005)(8676002)(53546011)(186003)(86362001)(54906003)(31696002)(107886003)(6486002)(2616005)(956004)(66476007)(5660300002)(478600001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UU9WbFJZeGN1aER3eVhwSVpFT0x0L1hPc01IditNd3o2ZHdSWGlqbkZrdXBk?=
 =?utf-8?B?akdBejhPS21yM09CSUMyWXBMTXVvMTU1cEw4Uml1Q0Q4NCsxd3piVVNuUCs4?=
 =?utf-8?B?dDZ6ZkFRWXhtbXVzc2lKVTBSTGxQZEJQTXRzcGMrR0dZRTc3aFk2SG5Ic0pw?=
 =?utf-8?B?RGgvZDY5VWNSUmpwUjdTcEVuTUFkcmlaNmpYeUk2emRjR2tSK0tBSXE1SFZT?=
 =?utf-8?B?VXN2R1hqaUdPY3VpVUd6RmR0UGdDdGptVDdYdWh5K1c3aENUcUREbHhyR2ZP?=
 =?utf-8?B?YXZMays5ck9rUU51bUFjaS9OZU1JQWZDaGJWbkl6b21nS3lCRmI3ekZhUHBm?=
 =?utf-8?B?VWgycUpIQzFoeUo2RllDQ3R2Z0dYL1paNHNERmFuSi9JdjNFL0xNTjJjZ24x?=
 =?utf-8?B?eVJ4R0ZiVVpkWnlsQllQK003UEl1cGxaeWNKYVdHanRzOWwvcWZqemxXYXpR?=
 =?utf-8?B?bFRuOUxURFcyVWYwRnZYQ1dJcDF0YWU1S3JxTXJqeWVpWFFzSGVjWGQ4TWZC?=
 =?utf-8?B?cW5VQy9mWDk0am1Fa0RpVW9mK0VIcGtId0Nld3V4NWpMMHpYdktUVTlJVXE0?=
 =?utf-8?B?L0N6WE9DNDdQNzhlQTZpNHJhK2NnM0czWk1ZeDhlbkhmY3g4UXQwakx5NXVM?=
 =?utf-8?B?aWhBRzJHeVV0d2hUWTVkWkxtd1VkVkIxaGpNQ0gwT2FGU1RxK0wxQ25IQ1V5?=
 =?utf-8?B?eStENDVIdk5xYVVPc1FFSlhPT0IxL1h3RHRXbG55d1YvR3R5eHRtU0JoNEVV?=
 =?utf-8?B?QXlLa2VFNHU4TCtWb0wwK3dTODhIRml6T25hdlJuZGg2aVQ4M0Z6QldVblFU?=
 =?utf-8?B?aTd1c2NpQklTTWJjSGVoUFhocjlyWWpKMWU3UEdmOFh3eFNVVUxURlNzQ0Mw?=
 =?utf-8?B?RXFWSlFxTHpDY3MyTnc4TGhub3ltLzlieDFsVHBiQmt4VkVQSWs0YzAzcERj?=
 =?utf-8?B?TkxJSWNQdDgyNlhNVHhaaE8wUFRtQUZGNXlSZ3ZhYkZkNmZBV3VTbW5SRWlV?=
 =?utf-8?B?UnRMVXBFSnFpaHcrR3JpMWhSVEVTNTFPUzBXS0VkK3l5SElkeTZTajFPbEkv?=
 =?utf-8?B?ZUlNbmtGWmRpQnpQeU1FYW9WUWYrcVBWTUpQNEFsQ3FuYUxqU09iVTdTNjda?=
 =?utf-8?B?OVlJSFZLQUpweHFxN3hRS2J5dVJjRE9HcHJJMEZYblZJaElqam1Od29zaXND?=
 =?utf-8?B?Yk5KQmxLaStVQ1ViKzRzL0YvQ2Y2Y01aRVhrWHJMUXExVWl2cWtSdFZjZDRM?=
 =?utf-8?B?U1pWWGFjeDI4SnE0RDROMWpMNXc0VkV6VmlSUjl0Y0EweFZ3RzFpTXN2djhq?=
 =?utf-8?B?THdMM1k2TnY5anlOb0xKbTd6M3VWZmxQbTlVUXdOZGd3U3N2UVArKzcxVEZL?=
 =?utf-8?B?YjRyU043WERpbU1Ua0ZYMndxL3Y3NWJpSmQ3Q3pZcXRmanBBS1piL0IyOVd3?=
 =?utf-8?B?VU9xektkMEVCV21lQk95eW9PNmYrdUUwSkhVNllxY0dFd21SWGdCNXNta2JX?=
 =?utf-8?B?cXVIWkpJeEI4RDJzTFVjd2FlblFiaW9WcFpGVkc5TDhGMEcydDg5UGlaSGU3?=
 =?utf-8?B?b2taMGFiVWNZS2Z2Q1l5UWMwNStpMlZCTDJlaFRyekM2NDV4VVhrWjYySVI0?=
 =?utf-8?B?elVrQ3hTKytCSXpDK2g4VGFNaHZtNUgwNGxDVVlSaG9ndm8wT28wNkZWSlU3?=
 =?utf-8?B?S3l6eCtJSVhZcm5TNld5ZGZlSzlzMHdoK3d5RnVJWjdtRG03SUx5Z2hBSTRF?=
 =?utf-8?Q?exo5x5HF1HWhzgnhQGjb7c9gQlvfx+taDT8GxBC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a41bfe78-119e-4104-c0cf-08d900dd6ab2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 13:42:02.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5X8jzkc8uwA0E4/l/ywsZ6pt6Zj/lZKLcRQY3H0FrFlMRZhn+IHlQ8jDwIz2kpIwvxLZy0dYCIgDC1AI9ynbAoEUSalNocExhNP8kHBfa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5220
X-OriginatorOrg: citrix.com

On 16/04/2021 09:16, Jan Beulich wrote:
> clang, at the very least, doesn't like unused inline functions, unless
> their definitions live in a header.
>
> Fixes: d23d792478 ("x86: avoid building COMPAT code when !HVM && !PV32")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I agree this will fix the build.=C2=A0 However, looking at the code, I'm no=
t
sure the original CONFIG_COMPAT was correct.=C2=A0 In particular, ...

>
> --- a/xen/arch/x86/oprofile/backtrace.c
> +++ b/xen/arch/x86/oprofile/backtrace.c
> @@ -43,6 +43,7 @@ dump_hypervisor_backtrace(struct vcpu *v
>      return head->ebp;
>  }
> =20
> +#ifdef CONFIG_COMPAT
>  static inline int is_32bit_vcpu(struct vcpu *vcpu)
>  {
>      if (is_hvm_vcpu(vcpu))

... this chunk of logic demonstrates that what oprofile is doing isn't
related to the Xen ABI in the slightest.

I think OProfile is misusing the guest handle infrastructure, and
shouldn't be using it for this task.

~Andrew

> @@ -50,6 +51,7 @@ static inline int is_32bit_vcpu(struct v
>      else
>          return is_pv_32bit_vcpu(vcpu);
>  }
> +#endif



