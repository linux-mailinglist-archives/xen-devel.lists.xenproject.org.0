Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D088034486D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 16:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100261.190945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM1x-0001ob-7p; Mon, 22 Mar 2021 14:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100261.190945; Mon, 22 Mar 2021 14:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM1x-0001oC-42; Mon, 22 Mar 2021 14:59:45 +0000
Received: by outflank-mailman (input) for mailman id 100261;
 Mon, 22 Mar 2021 14:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSIZ=IU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lOM1v-0001o7-9e
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:59:43 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ec84d2d-820f-486e-b16b-c79a395bb0d0;
 Mon, 22 Mar 2021 14:59:42 +0000 (UTC)
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
X-Inumbo-ID: 3ec84d2d-820f-486e-b16b-c79a395bb0d0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616425182;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k+ThIadZaVI+ovXVbO/r8tuMVO8UAQd0KHXYB3V3zVA=;
  b=Z1BwDeoMighm5D3Ssd4EqZeRM21N+T7HYOIaVtDterqzq5MRczHSTkVP
   holOR/QvSIY2Ee3h4D0tFHDtkjvncMSEC5IX8ZtJXMXwFP4551O0u8wHp
   1w4Ydue+iZQYZS976xLJAQb5+dO1Fsga9ZxCB4bSGTnLiOl27xT7N6qxD
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TQgnT4lTxJ4JfykOqvSs8zhoXi4fEaSea6zjeDfhhuItGSr1AJqn1wzc8JYVgTwEqth3yW3mco
 UcKpW7PNIc1SrdmqeIq8RhDgS00TFDBUG+dbv/UCTYkVzI49/0fO/8V4Y6wVAGlaiEDwppzchD
 /TUN9MLZt+urWgIq/68mazDwLXk2rczorrEobeWjBodXUccTM7Ze3ljZiMZ2IxxL9H0z3a/qzo
 atuCz5DRpZAPNd8ziplrYTcacoWngqlRRzYHtho3henrSmVL4HCIFUunJcTazPzHREx4F1vEsk
 /F0=
X-SBRS: 5.2
X-MesageID: 40193820
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DD9nVaGy+j2z3HKHpLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
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
X-IronPort-AV: E=Sophos;i="5.81,269,1610427600"; 
   d="scan'208";a="40193820"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keJPN0EswLSqPpG1vOsrF33b7S6ImO49DGCcWdwCIPhZQD9O6EJjkbZ+f33isRgCvjju6/SkSj9iIKE62Kd4bJWeZAalbYDd+B6eMLtk+/RocKyF5cUD4jtNUGeDAZpoVRy+Vvas1KEHFZ0u/fTKTYXWTyrRM1NhvGAgHdViHwtVH9NMQpjPPYzakkSLPkaD1wUhOw81SRWVJqU22TKpllGEAiLbhb4jNbTDIGxwrYfBK1l6HxF6RXkl54qAzNwrAmWfzq+gru53EF2vqr0nJL2JFSt+gUkELIu3jfmjEXDCgmzccVxrcA9SbLEUH5Z0TWKPiqvqvPrY2WA874eLDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+ThIadZaVI+ovXVbO/r8tuMVO8UAQd0KHXYB3V3zVA=;
 b=b2g9xmXpRnpWzExfOGu1S8D9+rSAaaurl6DenTP7dztikiMA8kOU1+Oz38hv4lORz6N/znq6hGP+35tokaz+wG/Sh1xbwOkAmhgA/2/FGAOUbJgdtWXF6pbeAbADSvpKHrl+/TDxjPP4hDJlkyi7y53uEo72btkvVJxPYmr6CMjDVVL/I5bmWML/2bC+t959kxeNB5X1BXKNxIjTEoXsG9Ra8OOvF0yF4BHafaZZhkApMPbVz3NgC56Hwm50k9tpBI+7HYsjW1zqNpYndnHEar+uKc1vcm/z1pcWPUrqY3WyOB5qKVz5q6XMxc7R3hriBXpHv2ykc3F2AHWpVFJo1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+ThIadZaVI+ovXVbO/r8tuMVO8UAQd0KHXYB3V3zVA=;
 b=ZtBHNWiwJYBml75LCeYfUbMF3AvNL7vWLgR1lh4YhlQDzIJ4kzwXfnNo4fu7P808m6BdqBOu2yp7H56uQmAXczVW4AMjIJVyOOixfh/sw+f4iR6XXkPrJECFGXOTtLHCbE600h6hQRL4e0rcDJL3UKjKDbJtaNO1tqp+nnZ6ROM=
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
Message-ID: <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
Date: Mon, 22 Mar 2021 14:59:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0143.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::22) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ece9696-d1f5-4a18-4e5a-08d8ed431437
X-MS-TrafficTypeDiagnostic: BN7PR03MB3876:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB3876064A0722BF2C58D35292BA659@BN7PR03MB3876.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQY/u8pOIKv2kB8C9MT1JTeUUHWYgiySQhhCwlC754oJBzSQM4XpBvQd90J6Oq/c2mHpinZkErNxTWd4JNk7s5v2AWrAtgVfcXQCGFNqpL4CAlG0edNoaisHhZ3R+0lpezK66j1dCAEbKTKpwIt2cIVVTqec+nBjW+lld0h4DrVDhUgX3PD6S0WeSzJ1Kw4wcqQZrmIcbBqMyaSS+v4mP2CdRQ03jWoxVut4PFYnz2xzKa4RhTf473UXfHOfYrqMyJ/zfplzEv0umDLCsiQnIUCF3Lo7ZIzpJKa80x5A88c6e5yHCHyKwoP2wu3wMAiAWSuB15J/brt1aDMsn6lX0DZkYUdF5Zo697F5Cai7G5RAT33agPPuhEES1UcF07tJXB55FBSd8cU/nY4vvKAqa3YGWJcQySORI9E8aaWY+A4bHikSJJ06yqeqn/eia1fcivatQnmBsNO/X+lIn2Y1em4v4o495u3+28dmksOt3zbqyP+QQKgVqdkcwJZo82DGqpcZv/hqF/kxATR6yLKyD/eX16tI5TU5jX/mzizMQhFpWgTQL3axWWzCaAYPk5GloHUS63k0NaF2bGi7XtcAjJrkHmQJ7kQslYZVVrUic/ZcxvDO2Apv/G7nmEPKHa+VMDDWYU4JGX7NBab5/HnjkkNFrVdPjxgM+mF6APnvUsZp+p7rnN2+8SVdKB4WzkT7xM3kNbMuNIUtCyaWPdiSLJrOYePwjVP8i5eBrNH1Ad4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(2906002)(31696002)(5660300002)(66556008)(16526019)(4326008)(53546011)(38100700001)(31686004)(478600001)(4744005)(8676002)(316002)(66946007)(66476007)(956004)(2616005)(83380400001)(8936002)(26005)(110136005)(6666004)(16576012)(86362001)(54906003)(6486002)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFRyc1ZNZUtBQXFoTUJGMGxuNHA5VG1YN2hVQXRvQll1YkdDNSthRS9Mb04z?=
 =?utf-8?B?RnNtY0swMHZZZE01SFN2T3htQXkzYlFQOUFPcDFJVmV5V09vZVh3Q0NibnQ1?=
 =?utf-8?B?L0VqNzlLYy9kTmY5ME9UaUNiSytWVitDRzBEcUpENGJOQkFVaE11M3YzMGZ0?=
 =?utf-8?B?Yjg4dFZrc2hGR2t4dFpNMCsxVVpuWFUvc3h3T2NDL0xRdE9XeVovbk1pUmta?=
 =?utf-8?B?amVnZzZvb0dZcWlsOXpIa0RQc0hsQUxTRnFHMEVlTjBSN0lRODhzRmdaaFRt?=
 =?utf-8?B?UVhhVUpvSkg1UE5jdXhUUngzQTJvRXUwZFcxbis3TGFNc0ZUUlBrdUtrSzlx?=
 =?utf-8?B?NWtMWXZvR1R4cHkrc1dyeXIxTExRTTlpNmZxYittUnRIZDJ3V2U3TG12N3cz?=
 =?utf-8?B?cmdXZUdvZUlvOEhKWVZieGhiNWlUTVBhTGVpWFVVUkFxZE9rQjVGckY4Smpl?=
 =?utf-8?B?S2l0a01LQzdGMituVEtoU1VpUHc2NFYzWjZSby85em5NU1pwRmtTWUxKUXds?=
 =?utf-8?B?YkZRcUxiaVQrclJYMXdEbFN0R3g0YzY3L25PQ2xMTWtWYzdRRE9wNHJVdWFF?=
 =?utf-8?B?SmtxdElCOTBqelZ0VUpsMnhWRSs1UktmZm5BSExCclUyMHhkY0h3OUpkQ1J5?=
 =?utf-8?B?ZFNPTWlKQkFEWFNGVlg4aUhpRHRwZCsyZW1JdnFUV1NlYnMxRlp1M01zL2ZZ?=
 =?utf-8?B?aTUrSDJMbFNoMG1JcjA1OHVNY1ZmMGViQTMydGJlMldnYnNsK1QrSDF0c2Y1?=
 =?utf-8?B?UFM3MkR4RzgxZEk3MmtVYk54M2FXa0djT0tiTWJTZ3JPNCtvRTFsSE1pM2RS?=
 =?utf-8?B?bFd0cVhHK3pGNEo2VDNrcncweS9tbDg4YkpRM21Bd2xMYXY3NEcvN2hMTERT?=
 =?utf-8?B?ajF4c2lqWjRYMHBTbWJXSCtyU05sczNmODRxQU9OZVdOV0tYOVhsZUtNMUxD?=
 =?utf-8?B?ZWh5ZE9iZzVmUlNDbG9qcHZCZE9rRXZsbTllN1FTVmZsd2hhODNKaHlvSlZp?=
 =?utf-8?B?bnU5blpjTDZObnBERWltR1p6ZGF2Z2tlVldDQjhRdzZ2RTY2SlNjTE5BZG9r?=
 =?utf-8?B?djkzY0QxT2VzY2ZXQW5aK2tqVzNEVW9qK0h3bjZBNWJDWWtkbjdhQVRPRnlZ?=
 =?utf-8?B?SlZTM25hQWUvWGlzT0FRUTFudm82K2FValZYVnhJL2V2Z3VlN0oyUThXOXUv?=
 =?utf-8?B?VFpITjB1andHRVJ0d2lkQzA5QUxoY2p4OFdLeDNhWFhJVlcyL2RMUDhqSWdt?=
 =?utf-8?B?NWR2ZWNiYWkxdmlsMDBBN3FMZFVVY0E0UmhFWk5uUXhXckJNMU1XY3k4TGtw?=
 =?utf-8?B?UTd4ajVzenFVYU5pZjduQmZLbTEwNUlyVFVQbEZNNUdTZDZzNTladGEvUk1C?=
 =?utf-8?B?VzBmalhFdUxhUWZ3YmNZbmtpRGVwaEtrbkRVQkpVU0NFTUxIckZnbUpOa1kz?=
 =?utf-8?B?Q2tXczNVMFdyRzVhWWRESFRCZUxXNGQ5b0ZDSWN1Y3NrazlrVXpLaTlyZzdm?=
 =?utf-8?B?VTRQOWg1OWROMHQrMkZuenZ0WW5INUxuYXVhMm5YbHEzTDB5Z1FCcTZ5Sm5a?=
 =?utf-8?B?cHczaERsNGlhd0JHZTRyOG01VHFCWW1yeXhXT094a0gybnZWTTVPVk5HRGhu?=
 =?utf-8?B?dFpRVjFFUXhvSGk0UkRRcDJqZ2k4RlhaUFNwSEFNbHRqL1I1UnN6ci9aVW05?=
 =?utf-8?B?T0IralM4UFhiNzB1NG5mbk0xRVpnc1BOS1RGV3FtSWtINFg0NmZDNmNXU2h4?=
 =?utf-8?Q?Zsv+02nXVTD9wsoxLgkHKAgE7m7xBKqFHhybnFf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ece9696-d1f5-4a18-4e5a-08d8ed431437
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 14:59:23.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2m4WgpMOFs/3j+yk/zrRIxJUBsCJiPduoH5xf5I1USRDU7IEAGNs8P/FmI1c7l7ERyviUv3C+Arivo05WEgLzJnCrn7IFMbBQOY+TifK71s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3876
X-OriginatorOrg: citrix.com

On 22/03/2021 14:52, Jan Beulich wrote:
> On 22.03.2021 14:33, Jason Andryuk wrote:
>> make install-xen fails when EFI_VENDOR is set (=3Dfedora) with:
>> install: cannot create regular file '/home/user/xen/dist/install/boot/ef=
i/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
>>
>> Create the EFI_VENDOR directory so xen.efi can be installed within.
>>
>> This removes the need for Fedora and Qubes xen.spec files to manually
>> create the directory in advance.
> While I'm not strictly against, I'd like to point out that it was
> deliberate to not create this directory here. I also didn't expect
> anyone's xen.spec to do so. Instead I'd expect the distro to create
> it during OS installation. If this was a bad assumption, I'd prefer
> if the commit message here could point out why such an expectation
> won't hold in general.

This reasoning is broken for anything other `make install DESTDIR=3D/` on
a live system.

It is incompatible with how RPM, deb, etc packages work.

~Andrew


