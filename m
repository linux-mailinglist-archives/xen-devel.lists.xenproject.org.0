Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085B352012
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 21:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104715.200592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS3EU-0002ZI-J8; Thu, 01 Apr 2021 19:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104715.200592; Thu, 01 Apr 2021 19:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS3EU-0002Yv-Fc; Thu, 01 Apr 2021 19:43:58 +0000
Received: by outflank-mailman (input) for mailman id 104715;
 Thu, 01 Apr 2021 19:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS3ET-0002Yq-AC
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 19:43:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38150d97-88d7-4de6-9fe3-6380c3cdb12d;
 Thu, 01 Apr 2021 19:43:55 +0000 (UTC)
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
X-Inumbo-ID: 38150d97-88d7-4de6-9fe3-6380c3cdb12d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617306235;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5WTsbL6fVOVHN7q/idb6GJ+u9Mko5Q++oDqeEXsO4sI=;
  b=Dhbo/n0jHDzvsfEIJDSjNBAZU2AoO/cd3XVxZl8kIaoD0v7SG7hWW30y
   m/E7wj3VzjAgguBhamAAxOyyLVXrhUpfS8fDTzAq6aGiF3ycut8pW6Gn9
   2PtbpwuX+bG7H0E+h8UL3STw4u5EY8I+sysuZDiYJkkO1JlMrGPY+GNFK
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fVaHt3/uAjG1dlHl5keeAZrfvAdrskLPEnNBoLTHy4C6VGPtRsEiav9rv3Tzdimu1ypjb9GuSX
 SLvKP6EIrG5kFEvrpb1UY/ueWXnLklDHzD+1J2MmdAgx+ZcZwOL9Pmffsu+zVyRZuGam2KpzM+
 XM1IYsqmT/TQWpQEVmjTvgvJK22PF2HRnLx4KMOZv/FiV0moJOTc7FK/hSjMSQGPWBBSCKVzcP
 l8WnQCx6uSmrhDFlVquqp0pzDO41uzehPsH9wUDl4Wq5gYVVajEzGsVDd1KaiGKOtGwe7ZqsHy
 x4E=
X-SBRS: 5.2
X-MesageID: 40740297
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:uvAQM66ScUeRPzZZ0wPXwWeEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbjqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAoqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+ELzGz2BACXzRThYoz6G
 StqX2E2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW07RoymyYoAJYczlgBkUp6WV5E8ugJ
 3wpX4bTrlOwlfwWk3wnhf3wQnn118Vmg3f4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGf9tR/w6NTSWxZhmlDcmwtErccpg2FCSoxbUbdNrOUkjTBoOa0dFyH34p1PKp
 gWMOjg4p9tADanRkzCsnIq6NKhWWlbJGb9fmEy/uaR0zRQgUljyVoZyME1jh47heIAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QSyvCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zO4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc4/mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEoucwwH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeO00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4WhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3crlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dqexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7Abq0i0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcH7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfOKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYBVcmT0Bq7fFyRfl5G+30DoDGvLUOk1hXKxeDNeG7WToLsz4mK
 lRvJYQh6+XPWrwYNLdlv2SQD5HNx/JoWm5C8svsotZuKoutL11W7nXOAG4ok1v7VEbFoPTkk
 hbfYFQpJbmEaVrd9YJey1Y8kEy/e7/ZncDg0jTOKsGYVopj3XnJNuH7LrDlKo3DiS61XzNEG
 ja1xcYwuzMUCSC34MLEq4cIWxZb04n9XRpldnyPrH4OUGPd+tZ+kC9PWL4WLhBSLKdEbF4lG
 c33/i428uWfTH/wgbeoH9SJb9P6X+uRYeXDBiXEeBFt/y8NlLkuNrk3OeDyBP2QyC8cUIWmM
 lsclERdN1Kjn0at7IMuxLCAZDfkwYCiFtR4TZui17r1MyH2Q7gbDB7GDycpI5XUzlVOmWPlu
 Lf/4GjpS/A3AQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40740297"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTqaZzQIS1lpKDX5TZpGN0IWAQMz3UJ2jBtzEeaV/3p2RtqKvlV8+I4Vh5UbqtCO3HjrnSnqByfKfVHvDCqKd4rXYZqN6sGHA8ZF4nQgzxa8cBSGCh6Z346PipLI9sJ1AObkYcmJkJxOWZynELlFig3KUFDkJRb01l4v/LRPiBBzpb+Ky9kD69EKEYsfhhkvUUSxXUOjZpPiE9gNpgZDetKfZ1VpmzKPfSm7Fd2priKOg+2kH5h8tr/2ZOHSwcfRqcSGGdff73d72gtqA3oUHityhGxNMpzWfo4IE8/8hOu6Y2dsBayWo3tIxwCJ96YXkSRfLw0u27QzMNOGhT9DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WTsbL6fVOVHN7q/idb6GJ+u9Mko5Q++oDqeEXsO4sI=;
 b=i1qgxVGETMoIe3s4cRcEODpvbOwDSnzVbfeJ+GqKwAG6FBfk9RKuiJIa6m8YmeOjO400kbxQFi/MgHk+flGvPFmFanTxBouCvdDrERSnHuTMiYh83X/UfaJZ47tMB8aWOQNC2Bs/KY0qegHLYICn1BMqGK4i+vD1T3BdUBNPA32q/aA3Mj7XHKA3WN2LqN/bREF56+P97rBAqQkqEpGWoPEEM/XtQpU3ctRaoHI6NOSch66UypAkSLmVZl8k61IpD5FwJMKrZijPpvjxn+lR0u7IV9faScPIHjlrddEj/1R1ljri0vIMUpICOFKigcM2L1qDSs1/vCOeK2I+BCrt9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WTsbL6fVOVHN7q/idb6GJ+u9Mko5Q++oDqeEXsO4sI=;
 b=GLy0jvrT6w6bERK4CWuolM8dSdtHDt7EnUvVW2I7ul8HmIicYd2KPf1hUiISMIpNadhPDGVotjIgxMOoaGKluwsntaXU+/BqJvqzYf1yeJUoI1S26LwNa+jgHb7VK1nSPlWd4DXg/HHnIuEanScyTyFQsfIOvDaZeHIUlBLxlF8=
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Roman Shaposhnik <roman@zededa.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, <grub-devel@gnu.org>
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
 <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
 <b5ed3a53-5152-aba1-820d-ccab72a82c61@suse.com>
 <YGWH89ubVe104Tnl@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
Message-ID: <a8c7fb60-7a95-1a99-4005-b04bcac4c2be@citrix.com>
Date: Thu, 1 Apr 2021 20:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YGWH89ubVe104Tnl@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f42fc8-3f6b-49c8-ee31-08d8f5467a9b
X-MS-TrafficTypeDiagnostic: BN8PR03MB5122:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB51220438841EA6EE588C4B60BA7B9@BN8PR03MB5122.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPaCSVpcFVU3JQI+36AwWs0qG6d98Yiq6YWsuECcGUg0WqIAv4aai1Eudkbv8i0ET33Hudq58itTfO4BF/VJg5i5+Nvrw5naVvIPiSDYqvxKMCAkyAXCdOzfrfTZfseCQFA7zqVM8VUn4UVaqTU6ret+BVqc6ts+QT3cGfa3dE3HQig7uYMowUi7tAu2sBEJsEROG0m5ZLktz6wlqeNVJVfwZWXP9BDprCz1o8TukzUFgDZZxON/cJBpOYX08xD5zmO8AtMELbtJKCmSz5fL4nJr6k/cO68FbrdeSAbAp+85ATueFBXcr9IaN4HS2zYKddiacU34uvM6OIXF9Cpc/uklcPS4zFVQtj5JKMvzF+X6U/Sxk7gCfNAPld+RTa3ET8rlknUMk4zCqnVJElS3//xJ+qTVpY3wQVgGp/zfHhI6j5R18bJIVhk3itUqtouz6MkcFAgK+mpzrK7muzKse2v7PnwBXbagdzxA6uRAgxIgWJPZW11WrpKrDsglnGe3bYjQ7EmEGUVl3nv97dCIzXdG9zKFWs4SbIBFWGOqUroeicZXzsvLxquyaUBxQs08v6YWX8WhuwNILz+pZe5l6DmDHFcBuYoLUir1ogc/ZbVWVbUUvfPmNpCxUVpCayL+jtBA2pCJXx1c9opGDctO0QqnNORzpsR1l2knPw0bd9boYF9z5zEQG2fTapZy78Yg2ugmYMBsJGHFMy254UL2UI0aWy8WRwSH8RM4YQGKGxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(54906003)(6666004)(26005)(31686004)(110136005)(53546011)(6486002)(16526019)(316002)(31696002)(8676002)(86362001)(186003)(4326008)(956004)(2616005)(66946007)(66476007)(5660300002)(66556008)(38100700001)(2906002)(16576012)(8936002)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVJ6OXM5MjBGejJvSDZmUW54Nm1LZE1vc3VkNWNuSk03dXJ4Z1hJN0xBNGNp?=
 =?utf-8?B?dFFYMlJnaUtmYXFuM2k2STVYSU55RFZqdXdYRnRpZWNtdjlmbFEwbkxIekJ6?=
 =?utf-8?B?ZHNWMjdveEZJMnp1eHR3ZFQ0SFNkZmhRdHlQWmNLWlhmQ1gvTEpNNXllelln?=
 =?utf-8?B?YnFSem1NUHdwTUV5dzhTaGFBaFI3VEp6TEg5U0tIRDJUeXdRbjlEWVpFb1BR?=
 =?utf-8?B?Rnl5NHN6WXk1UzYvNkdHckxpZUNRM0pEcEhkdWY2REZQalc4NzdobVJSOWN5?=
 =?utf-8?B?NVdjdUpqclc0TVJWcmpsQVNSdkRyYzdYdHZqVStsYXJwcXo4T0dPUDd0K2Fx?=
 =?utf-8?B?QjdiZW5RQjUrdm4vNkxRU2FkQmYyYTRIcTNEa0FweXRPM09JalVvZXA3cFFY?=
 =?utf-8?B?TGt6QlUyU2Z0RzJTOFRUVG9zOVFkT1NRcUxIK3BJdjJIdFMvbnJrMlJNRks3?=
 =?utf-8?B?K3RDYWVwZ05xZDZMVkxveW9sVUh4dllqTkNkb3lCRFZOQ1p4OE5Cb3NjdmRh?=
 =?utf-8?B?MXFzc242VDJnMHl6bDRuQldsT1B6VjBlQXUvVXlCTzNlekw5MjVXVHg4c04x?=
 =?utf-8?B?VUZCMDFDVDdHZkttSHl5RlFFTTdxSEU1TDNkY2hKV2ZBbXlSczVnU21idUdn?=
 =?utf-8?B?TUZTcUxpODRpMzd1K1FQUXpVRTgwZlBhZ3dTemMyeE9YMG1XalREYjF4YWdF?=
 =?utf-8?B?dkhkSDNhQWpiemROSVY2THNMVTlZUXhGZ0I4UzU4QkI1emJZMzdRUlpnNEts?=
 =?utf-8?B?amF3WmJ3ZlJHQ2JOWFJRTVVGYlprK1ZHNlp2ek1LYVo1Z21ySkx1NlVWcmlB?=
 =?utf-8?B?UGV6OUdnTFdFWHdFLzduMmVZelQrMHBCY2xNeFBTZTBUdWFoYlE5SWhHc3R1?=
 =?utf-8?B?enZremNGZ2pOR3U1aE1jRnNRR0JWL2pHMnc2Tm8xQ0JmZU9vRkFsYUxsM0dl?=
 =?utf-8?B?SUxRVEhyN0loOVBFNUJpdSs4WVRDRk82a1FnMHJLRVZOM0NrZGNISUdKQWV5?=
 =?utf-8?B?bDEwRVcxcjJNaEdid2E2YUN0cEtNTmZJRW12SXBKb0NzY1JGcFV3NmUwa0Ir?=
 =?utf-8?B?SGhSMEltUThPY1VqTDJxanR6ZzMxSEl4UTRvWjhlWktYSStwTkhHY1lFWFpT?=
 =?utf-8?B?Nnc2dVNrbWY5elRwYmFNZm5QMzhiV29CaWdzSENSMEVFM0xxbzZNVFhXZ0Z5?=
 =?utf-8?B?MERqUDN1S3NPcFlGZGhxUWV2dDloWlBTV29LUTZYbCtBYXhBaU1jVjFuMVpY?=
 =?utf-8?B?SytMSzBOQXMyOVlIYytZL1MraU9SY3pYanpFQmcxK0p3WDVqTTU0QmxsMElM?=
 =?utf-8?B?bE5WU2VsZ2tGN1lGeXcxVEhacUlMY2ZSbFR4Z2FyZlBnMTlNZ1ptVWphclNi?=
 =?utf-8?B?U1ZOS0NkK0NXYnErcjViNEg2Z0tvTHZ0K3J6cE9sNTFBTlpEazFlaDB5emNR?=
 =?utf-8?B?ZlJzL24wNmpUczVIL3BiUjg0cHQ3UkNpZEdOVDVUUm5NcGIxRTNuTlI4MExC?=
 =?utf-8?B?S3FMVlZzakVoZEVjczBxQUlUWHBWR2FoOEpjOEZYZUZzWmNKalRZaEdLVmRo?=
 =?utf-8?B?Yk54WDNnZnROaEh5dE9xV3VhSUxGdDNERHhBeW82VXFJdTVrT0tKZWtjVThu?=
 =?utf-8?B?Vm93OFc0MnJPckt3dG9SYUFBOUoyK3FEajlsczZydmlvUjVsWXZMNVRDU1dj?=
 =?utf-8?B?NUlXd1RmeDNSRlB1WUZKOUtSNE1IM0VOOXJCRDdyWk1sTkI5ME1xTllUQWVt?=
 =?utf-8?Q?xAHatfmPpP1wsUCnR49ksFZsNFSqYerLUlk2j1f?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f42fc8-3f6b-49c8-ee31-08d8f5467a9b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 19:43:52.9468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUsx0PUKubj8xWxev1iZX6eth3cgYbdNJY9UYbSqGte7wlWoAaVfrMkJUNH+39veDF0eGl7rnuFBgFHLrkIaGjhc0++sTlz1GDC5YIKWR88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5122
X-OriginatorOrg: citrix.com

On 01/04/2021 09:44, Roger Pau Monn=C3=A9 wrote:
> On Thu, Apr 01, 2021 at 09:31:07AM +0200, Jan Beulich wrote:
>> On 01.04.2021 03:06, Roman Shaposhnik wrote:
>>> And the obvious next question: is my EVE usecase esoteric enough that
>>> I should just go ahead and do a custom GRUB patch or is there a more
>>> general interest in this?
>> Not sure if it ought to be a grub patch - the issue could as well
>> be dealt with in Xen, by concatenating modules to form a monolithic
>> initrd.
> I would rather have it done in the loader than Xen, mostly because
> it's a Linux boot specific format, and hence I don't think Xen should
> have any knowledge about it.
>
> If it turns out to be impossible to implement on the loader side we
> should consider doing it in Xen, but that's not my first option.

Concatenating random things which may or may not be initrds is
absolutely not something Xen should do.=C2=A0 We don't have enough context =
to
do it safely/sensibly.

Honestly, I like the idea of supporting something like this generally in
grub.=C2=A0 Linux already commonly has initrd preparation prepending an
uncompressed microcode CPIO archive, and I can see a usability advantage
from maintaining the initrd fragments separately.

Looking at the grub manual, this behaviour of the `initrd` command isn't
even documented.=C2=A0 Perhaps that should be fixed first, and then maybe
`module2_multi` added too?

~Andrew


