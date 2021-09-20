Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C9411349
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 13:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190769.340557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSH4S-0006sv-3L; Mon, 20 Sep 2021 11:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190769.340557; Mon, 20 Sep 2021 11:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSH4S-0006pm-0C; Mon, 20 Sep 2021 11:02:48 +0000
Received: by outflank-mailman (input) for mailman id 190769;
 Mon, 20 Sep 2021 11:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSH4R-0006pg-09
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 11:02:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a8a7855-97f9-4cf9-9887-b976f10b5291;
 Mon, 20 Sep 2021 11:02:45 +0000 (UTC)
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
X-Inumbo-ID: 3a8a7855-97f9-4cf9-9887-b976f10b5291
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632135764;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uftEc9rMz6wnZWOUh6vz8YwXDilVvtcYd0ZzyCFcMig=;
  b=UxaQhyOWj6hOYSHe5foHkblwgDeN5/+ZsGXRsyglkXVMvrmLjeki4iQ2
   W0jBKkEN2y8DDVxafNWW58CJtz3JHeMlfJXvH659KQtyiovOyq+JA9t5o
   0dF98107fXHtVD+H/XZBhsl8B3q5JL0AvVuhpAD9sloBe7Rips+0n0HXi
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qX5kjBJrjxrLDa3GCfAWyqc6seaOQor1M+lF8PfbbOM2CNDypjRcP0UQbRCW1L9AyYptZRLked
 RubN3sr4Ijez4yRouJvq7kQyRi/oRIoQNbxnjt92j9zpqf1QxLGI8prxQx7TXdZ+wJN/FJZbaA
 DOSkUC/2prsjW5E/2PRnWXm5ezXW+gNnqmbgnwcQiAhijbzP2Xpss4huyINlLXJS5Kufyq0jfu
 4Gtq6maZmr75ivWVYHOhfLyNGy83Ln7JmrTArWiS5OyFAP2DIfag4jWuLUx5Zfwhfq/0ZFV651
 122b/RfLfH5sabAd28y1ZfkS
X-SBRS: 5.1
X-MesageID: 53523512
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ks3aeKAQl8oQWxVW/6jkw5YqxClBgxIJ4kV8jS/XYbTApD0g12EOn
 zFJX2yBMv+MM2uhettyPoji9hhX7ZXTmodqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00o7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/zAmO3MFek
 9x0rLvqWF0DPIfBks00TEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2pq3Z0XR54yY
 eIweDVjQEnnPSRNPw4PI9Umt8qzvyXwJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHN2AyxKV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRolG6c8JSL
 QoT4CVGhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xCmYNQTFAb9gnnNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLV5KyzczaQjjJ2
 hfQvXIUhZ8eh+ciyPDulbzYuA5AtqQlXyZsuF6ODjn0v1sjDGK2T9f3sgmAtJ6sOK7cFwPY7
 SZew6By+chTVcnlqcCbfAka8FhFDd6+OTvAiBZEG5A7/lxBEFbyINgNvFmSyKpvW/vomAMFg
 meI4mu9B7cJZRNGiJObhKrrUKwXIVDIT4iNaxwtRoMmjmJNmOq7EMZGPhT44owQuBJ0zfFX1
 WmzKJ7xZZrlNUiX5GXvHLpMuVPa7gs/2XnSVfjGI+ePiOHFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6elwI9A6x/sFyLigE
 7PUchYw9WcTTEbvcG2iQntidKnuTdB4q3c6NjYrJlGmxz4oZoPH0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:KLvlt651e17sb31w1QPXwXOBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhI03I6urwQpVoIEmsuaKdhLNxAV7MZniehILFFvAB0WKA+UyuJ8SdzJ8k6U
 4IScEXY7ecbSkYsS+T2njgLz9K+qjizEncv5a5854bd3AMV0gP1XYdNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dzbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu17hPi7ontRrcenau5l+7f+3+40ow/LX+0KVjbFaKv6/VfYO0aaSARgR4Z
 /xSlwbTrlOAjvqDx2ISF3WqlHdOX8VmgDf4E7djn35rcPjQjUmT8JHmIJCaxPcr1Etpddmzc
 twriqkXjVsfGD9dQnGlq71vitR5wOJSLsZ4Jwupm0aVZFbZK5arIQZ8k8QGJAcHDji4IRiFO
 V1FsnT6PtfbFvfNhnizyNS6c3pWm52EgaNQ0AEtMDQ2z9KnGphx09dwMAEhH8P+J80VpEB7e
 XZNaZjkq1IU6YtHOlALfZERdHyBn3GQBrKPm7XKVP7FLsfM3aIsJLz6KVd3pDcRHXJ9upHpH
 3laiIUiYcfQTOeNSS+5uw/zvmWehTCYd3E8LAv26RE
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53523512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2yFAtAIAhN8CjLgLgdH6Fb+6cI5Lc/XPvidAMUMwLZnfhbp15JhrH79GCmJcXlCQNHVuSLD24DscxIKUkp6wuduzqgXZQQx4ETiTrz+HGaIjui5hYpXbCF1U367LgvtqnPtenk6qkkvlcZ2kBJhMc9B2pbZWfFqhF4iDVyvHHJPP5woeFjVOegGAHKorp0cPHCbV/m7z61oOqsvpPVnCXNC0tlrOQ0OBoDAnYVkNXnoJWe0I/+cWS4TVTYMqu9eR2hhW4pIoeRVU01hHWL5fdKDhUjbgs2Zq7K3jFxl5ZwYQMUipatzRg9qLjUaGbBFCQqBGKqmuAYCfS6C35cYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0x5ChsYwve31t/TPkJ37BAV51m9YgYbZ4FHOk28I/QU=;
 b=Ig9IBDpUaGohQ+f2mUIBOS17mNMTkhEnYz5XsUYy51s/Hd8bGRaS+wN50ohrmg2r4IQAdONwmmDiocm5+9IM5kpNZll1WRtOQVvXGuRvc4yKe4pRrhvJJfOX7/eVnjEvjG5+1EM2P9AYIELdFmTz/4co5EcQCMnizEatyscQ3z/YGkDsgpNdknPcpzMbI/VxE34DXP5SHkoSpgYF4OQ+JdUHrDsh3cPsmOJY4X0KKdKjz/npcwTsY48BPgsMKl5mr7Sc6kBu+Bk4SDzp4RIORhiW7ea/4oRT1AZSqD9eIkYl3S3FpSPl089+qa/idE41xELQyakurUh6csXe434DOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0x5ChsYwve31t/TPkJ37BAV51m9YgYbZ4FHOk28I/QU=;
 b=JA6gckcHBsPsOYK9YR+BXwPma45f5g2MtL6cfhYa+e5Ko5mixZm/em9pb5fnoBV4WCh5vZ44TVsvrmaNlVfrYaS3r2uSfdgstUpiqKPil2gzasdSFlUBPJ6co33vKXiiClcqXEcdrySzAWRF+tHxuyk/8sW+mUJwtszUgj8SKuI=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210917084559.22673-1-andrew.cooper3@citrix.com>
 <20210917084559.22673-5-andrew.cooper3@citrix.com>
 <ef2df9df-df4a-8f8a-3f69-88a027ba66eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] x86/trace: Reduce stack usage from HVMTRACE_ND()
Message-ID: <e116bff4-9080-1629-221d-f2ba3255d03e@citrix.com>
Date: Mon, 20 Sep 2021 12:02:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <ef2df9df-df4a-8f8a-3f69-88a027ba66eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0199.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 730590a8-05e3-40ce-5858-08d97c2629c3
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52845B9DF7BE4D9C9C8C5D05BAA09@BY5PR03MB5284.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSU2NKuLzKq6aRFtCBq4gX8mzaB3Gr8XmILIBCKinrhyffi4QjZboAE1BTpR3w/UzL6kW1GblVAyH2fbJwSbuef3IEOTWrQUcpovuIiYWHBamYtNUcOtUYwZBvF3gMx/09jVpkyvi1CiLPNtyHgR8igczyui6awf//FzZoclY5xppBoD/KVkMxzIsff3pDUkJZEY3jfVDrwL7QerqAqiQSFIS5ZVGtVc782SwzKKep94scshEe8E0IkbZJrO4QGnOf3bTnfWIxikEppN/sRyyA8raM+URQQTY+s+jss0omLrahhW6LGMzELRFTklVQKMHhZWG33D+IlFz6Zlx8t2rVjUbol4ozAyE1di/FBHCh3JeI3Jf+v6/yTmqv1T77jWIcVq6vk06GTBOLHWUnZvD+rwqRU8/Kmpn5PoGRKuqpehkK5jRTmZ4K8bvEvHPaTJtVsd4oeXeqCKcUZ+QQcb2USntzIIt8DyJm9CLcP1cOxs1xg5XCXsGQbAzPgiL3H85n7iKeZHoellhV5xs4C9lQ+3T/FStjXeGAQ7nBaCBJW/BrAzjfhdc2NBC7j6IxnoU5EpJFXMSl7DuJF8dJTbcm8w2JyiDGT5LKkbRDGaRteGeh8l5HIobHTZHOuB2m2DKhMCk0ui0AsoZaxHlR/NlYMkTYb7e1HQlgX+QN1UiTQIRrwzGRdswo7Svznsvt48epVDw9hW+0JBqFcq60MbZSrXSZeOnrgc+ABYbNg/A/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(4326008)(55236004)(38100700002)(186003)(31686004)(5660300002)(83380400001)(54906003)(66556008)(66946007)(53546011)(6486002)(66476007)(26005)(31696002)(478600001)(6916009)(8936002)(36756003)(86362001)(16576012)(2906002)(2616005)(956004)(316002)(6666004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNIbmwwbkhpNDQzRlUvNXAvUFdvNDAvOG03cldyMXAwQnFQZzJJb0J6Z3ha?=
 =?utf-8?B?WUdXbGhoeWUreHRkeFRIRUtISVEvUml1RHByMVlHdGF2aWYvakhZcXNJZkVB?=
 =?utf-8?B?RmNiWFBsbmJHUHkyd0cyeVNKejlmczlpVHU0YjIwaDNxRytUenlGN21abUNr?=
 =?utf-8?B?czJSa2FnVG1JT010QWtiODMxNFdkUGdtdFlwVkxLS2VhUkJqQUYwRE42WTRN?=
 =?utf-8?B?d3RndFFQQzV1WDZ5ODJoaFJTOEZ6OHVIb3hqUDMwL084ZmNveWZqOXZGMXMz?=
 =?utf-8?B?OWErY0hGa3NWa01XWE9qNXdIdW04Y296V1M3TG5jYit3MDRQQ1FIdVlPaVpa?=
 =?utf-8?B?WjY1VFNQNi9GRmltOE5uOEZ6Q3JPdHcyeDZSNng4eGtQU3UwQ2J2V0VYZEpp?=
 =?utf-8?B?ek9Ga1pSOVZobGZOUU9FU1ZlcXNBaGVMcFlnT2ZNdHZ6VnlwK3VmOUVTRUQ1?=
 =?utf-8?B?NUU5SnVabk9lZ1hyNFBOYzFOQjFheHRlS0hMcFpSTHRJOUF2S1VnamRpckYz?=
 =?utf-8?B?NHdldG5YbmpPeFM5QXlkb0p6emxMUXVWL2tvVmx4TnVYaGNZb1VwakRzVnJL?=
 =?utf-8?B?VUkzODZSQXhwcFBKK3p6NGRBdUYxRmtBeHZJWW50eExta0ljei9oc3pHdCtl?=
 =?utf-8?B?dnBzVWpTVS9oQURwTVMxTkRZVU5WUTUvcU9aQUVUdWFmaUI2eG40VXBFL1ND?=
 =?utf-8?B?bmxyRGI5aWxacHVMSzJSRFlERDM4U2EybkV6Y0Qwak9KYmtpV0hNM0J5Szhm?=
 =?utf-8?B?cVp0VTAwRHRzZC9GSWFsTzJhd0RmdHdNUGNsd2ZqY00zcXFkNUF3S28zS2F5?=
 =?utf-8?B?Skl6NS9UR0VRdjZtL3hiNmY5RVZFMzIvUkhKYWxvK1RXanc2ZFBUcUFPOGlQ?=
 =?utf-8?B?cElQelBhNXVseThrMjZuelpucDRnU2hGeUhTZ3VlODU4czU0cGFRQWpodDl2?=
 =?utf-8?B?RWZyMHlWR0VhazY4YWt1RitpUExIMW9NQ0RTZkJVcmc3WHE4YjR1ZTFFcUQx?=
 =?utf-8?B?THdiNitKVVNvM0NZcGd6ZUlvbXVDbjYrY3lIU0ZNZG9nNmdJYjlFb3hQUWxU?=
 =?utf-8?B?b2FYTGw5N3BrdFd0eXJJVlQwSmxYbmkycEgwVkJBRnJxTmdzeWRqRzZibVha?=
 =?utf-8?B?Yi8zMGpMaXQ5Rjc5amEwM2pvbFQ5bC9zcXVpeGg0WXVCb0tXNm5udStwL0d2?=
 =?utf-8?B?amtoMUVLSm5FY1U4MkRnaEFTK2cwbmFNcnJPSGN6V3B2TUxPVEZ4T1ZGbW9M?=
 =?utf-8?B?ME4ySlNJRE5DU09Gc1FsUVY0ZXlpSzFtd0ZVdzhkZEdvbTFPRXVhcEc3N2FW?=
 =?utf-8?B?Sytoa1JubmNuUDVITlRvcEcxeTRidWFCaWRGRWt3dkNVZW5kOXVrUUVhOUlJ?=
 =?utf-8?B?d1NoN0hybzJQYXkvdUVVS0tVVm9YcmdDUGJWU2VYZ3RZY0V1RERrQVBIT2hY?=
 =?utf-8?B?T1hXVTZIVHg0Sm9BdlN5VVJWUmtaQUcrcVZRZjlEL0NVY29KNHdYcU1LeTNq?=
 =?utf-8?B?eUE5OTUvbHd6czdHdzlBcGp2bGRCUTdaZjFkd3k4WlM2dVRETWkzTHk1ZnR3?=
 =?utf-8?B?WkZwTS9xT2Y1V3RXYzhQdUM1ck5MMGhjTDQ3ZWNZbVVHSWdvN29hdHpTNTh3?=
 =?utf-8?B?eWV0RXFlZGhiRlJFczFwRjBhTXZabElKMEllQndBUWZ6aEZzM3N1Vy9LZERG?=
 =?utf-8?B?VkFyK2VKUnhnTVFkZDN4KzcwYnVabm00RnlkTWh4dmhrUXo1em9sZ0RhOXNw?=
 =?utf-8?Q?H/o658vEwAfUH6ryz7b9zEUI+4umFA1X+/D2Tjd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 730590a8-05e3-40ce-5858-08d97c2629c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:02:40.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaJgyNLTHVjpSmzAyy2mzmJAm9JAEvWE5q+qWcZR/JxGlz5H4LBY+DDx+pfZ1s2LMurxSMkv9uB8+pzID7EAOQIXwENbFeuhYPdrErFP7Yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-OriginatorOrg: citrix.com

On 20/09/2021 10:05, Jan Beulich wrote:
> On 17.09.2021 10:45, Andrew Cooper wrote:
>> It is pointless to write all 6 entries and only consume the useful subse=
t.
>> bloat-o-meter shows quite how obscene the overhead is in vmx_vmexit_hand=
ler(),
>> weighing in at 11% of the function arranging unread zeroes on the stack,=
 and
>> 8% for svm_vmexit_handler().
>>
>>   add/remove: 0/0 grow/shrink: 0/20 up/down: 0/-1867 (-1867)
>>   Function                                     old     new   delta
>>   hvm_msr_write_intercept                     1049    1033     -16
>>   vmx_enable_intr_window                       238     214     -24
>>   svm_enable_intr_window                       337     313     -24
>>   hvmemul_write_xcr                            115      91     -24
>>   hvmemul_write_cr                             350     326     -24
>>   hvmemul_read_xcr                             115      91     -24
>>   hvmemul_read_cr                              146     122     -24
>>   hvm_mov_to_cr                                438     414     -24
>>   hvm_mov_from_cr                              253     229     -24
>>   vmx_intr_assist                             1150    1118     -32
>>   svm_intr_assist                              459     427     -32
>>   hvm_rdtsc_intercept                          138     106     -32
>>   hvm_msr_read_intercept                       898     866     -32
>>   vmx_vmenter_helper                          1142    1094     -48
>>   vmx_inject_event                             813     765     -48
>>   svm_vmenter_helper                           238     190     -48
>>   hvm_hlt                                      197     146     -51
>>   svm_inject_event                            1678    1614     -64
>>   svm_vmexit_handler                          5880    5416    -464
>>   vmx_vmexit_handler                          7281    6473    -808
>>   Total: Before=3D3644184, After=3D3642317, chg -0.05%
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, but this is buggy.=C2=A0 There are direct callers of HVMTRACE_ND()
which need adjustments too.

There is also a further optimisation for the 0 case which drops even more.

>
>> Normally I wouldn't recommend patches like this for backport, but
>> {vmx,svm}_vmexit_handler() are fastpaths and this is a *lot* of I-cache =
lines
>> dropped...
> The change in size is indeed unexpectedly large for these two functions.
> However, what I find puzzling is that TRACEBUFFER is enabled by default
> (i.e. also in release builds) in the first place, and that it can only
> be disabled when EXPERT.

Its not surprising in the slightest.=C2=A0 TRACEBUFFER long predates Kconfi=
g.

>  More gains could be had towards dropped code if
> the option wasn't on by default in at least release builds. "Debugging
> or performance analysis" (as its help text says) after all isn't a
> primary target of release builds.

All performance analysis needs doing on release builds.=C2=A0

> IOW what I'd prefer to consider a backport candidate would be a patch
> changing the option's default. Thoughts?

I very much doubt that XenServer are the only people who use xentrace in
customer environments.

I'm -1 to changing the default in staging, and firmly against doing so
in older releases.

>> --- a/xen/include/asm-x86/hvm/trace.h
>> +++ b/xen/include/asm-x86/hvm/trace.h
>> @@ -67,38 +67,30 @@
>>  #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
>>      TRACE_6D(_e, d1, d2, d3, d4)
>> =20
>> -#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d=
6) \
>> +#define HVMTRACE_ND(evt, modifier, cycles, ...)                        =
   \
>>      do {                                                               =
   \
>>          if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )            =
   \
>>          {                                                              =
   \
>> -            struct {                                                   =
   \
>> -                u32 d[6];                                              =
   \
>> -            } _d;                                                      =
   \
>> -            _d.d[0]=3D(d1);                                            =
     \
>> -            _d.d[1]=3D(d2);                                            =
     \
>> -            _d.d[2]=3D(d3);                                            =
     \
>> -            _d.d[3]=3D(d4);                                            =
     \
>> -            _d.d[4]=3D(d5);                                            =
     \
>> -            _d.d[5]=3D(d6);                                            =
     \
>> +            uint32_t _d[] =3D { __VA_ARGS__ };                         =
     \
>>              __trace_var(TRC_HVM_ ## evt | (modifier), cycles,          =
   \
>> -                        sizeof(*_d.d) * count, &_d);                   =
   \
>> +                        sizeof(_d), _d);                               =
   \
>>          }                                                              =
   \
>>      } while(0)
>> =20
>>  #define HVMTRACE_6D(evt, d1, d2, d3, d4, d5, d6)    \
>> -    HVMTRACE_ND(evt, 0, 0, 6, d1, d2, d3, d4, d5, d6)
>> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5, d6)
>>  #define HVMTRACE_5D(evt, d1, d2, d3, d4, d5)        \
>> -    HVMTRACE_ND(evt, 0, 0, 5, d1, d2, d3, d4, d5,  0)
>> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4, d5)
>>  #define HVMTRACE_4D(evt, d1, d2, d3, d4)            \
>> -    HVMTRACE_ND(evt, 0, 0, 4, d1, d2, d3, d4,  0,  0)
>> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3, d4)
>>  #define HVMTRACE_3D(evt, d1, d2, d3)                \
>> -    HVMTRACE_ND(evt, 0, 0, 3, d1, d2, d3,  0,  0,  0)
>> +    HVMTRACE_ND(evt, 0, 0, d1, d2, d3)
>>  #define HVMTRACE_2D(evt, d1, d2)                    \
>> -    HVMTRACE_ND(evt, 0, 0, 2, d1, d2,  0,  0,  0,  0)
>> +    HVMTRACE_ND(evt, 0, 0, d1, d2)
>>  #define HVMTRACE_1D(evt, d1)                        \
>> -    HVMTRACE_ND(evt, 0, 0, 1, d1,  0,  0,  0,  0,  0)
>> +    HVMTRACE_ND(evt, 0, 0, d1)
>>  #define HVMTRACE_0D(evt)                            \
>> -    HVMTRACE_ND(evt, 0, 0, 0,  0,  0,  0,  0,  0,  0)
>> +    HVMTRACE_ND(evt, 0, 0)
> These HVMTRACE_<n>D() aren't this much of a gain anymore; perhaps down
> the road we will want to have just a single wrapper macro adding the
> modifier and cycles arguments, otherwise making use of variable
> arguments as well?

Same on the plain TRACE() side.=C2=A0 There is an awful lot of cleanup to d=
o
here.

Other findings include HVM records using the non-HVM helpers (to have
cycles included), and examples such as vpic_ack_pending_irq() which
duplicate calls vlapic_accept_pic_intr(), causing 3 trace records to be
written out.

~Andrew


