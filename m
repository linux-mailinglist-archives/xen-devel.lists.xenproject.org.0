Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF234111F0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 11:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190460.340290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFfL-0000RE-RV; Mon, 20 Sep 2021 09:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190460.340290; Mon, 20 Sep 2021 09:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSFfL-0000O9-O3; Mon, 20 Sep 2021 09:32:47 +0000
Received: by outflank-mailman (input) for mailman id 190460;
 Mon, 20 Sep 2021 09:32:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSFfK-0000O3-6z
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 09:32:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5b010a0-19f5-11ec-b867-12813bfff9fa;
 Mon, 20 Sep 2021 09:32:45 +0000 (UTC)
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
X-Inumbo-ID: b5b010a0-19f5-11ec-b867-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632130365;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v4YEtbFzgT3qP8LwEqrQaBDA+cTqaF3A5gedDkVpVRI=;
  b=Q+ohbT93ELD9OCVI3j3UXGQ3RneWo/+xkb+2pZ5R/1j2RXs8mNzfC6IP
   ML0/VVEDGhb3qY5PPgHHQkscZEe/wFKZggEfH5jAfcLf+T+T8hU6hLj5/
   6YkaYBI1BqicSwJO/hCSh/hyijLpNT6fCT06XUeLNqdK99CoOJf9RAAMa
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Fjy7jjLh3jV4I7sGs7Hhz76U7R+P4pq3GobmjGUGQ5KgUIOcwjqBUaxvI7eKkrbfVOpHbkWG63
 XQTGTj/DL9Gmf9rn9mHp1ad8SxRpspMyqh0V5nW1xT/DtthE5CY2x4r4dK3SocU+nWwjJYwLaI
 BK83Jk2MCSpJXOeJZkVbcsHSIHOiu6bbnhQgUGd9ezv6nO4JpIsWj6AdDIJ+f5Q/OWj/4GZ7w7
 DYRq+duuo/AF9Y6BmxvvaQBVoEZMRnFAqhF1qihc3XJ3aZj2ic/WU45zMuhdS57KusPvRNzJOR
 pvn+r+L6WyeNFMzbkLMiAMn3
X-SBRS: 5.1
X-MesageID: 54894368
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:92j7XqnN9l3/x0hd/uSg+Dfo5gwqIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUWqOOfncYjTyeN4iPYiz9koO7JaByoc3QFFl/yxnRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFqupHvRB5wArbvh8EaVh9DSC45PIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKqON
 pZCN2oHgBLoMyxuCgcYKaoCgL2Lq37AcgEFqm+ouv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QV5SgGvaU07FasTNT2Q1u/unHslhwBX9tdFcUq5QfLzbDbiy6VD3YJZiRMY9snsIkxXzNC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnyz
 CqNtzMWnKgIgIgA0KDTwLzcq2vy/N6TFFdzv1iJGDL+hu9kWGK7T4iP5lWE4O8ZEJ26UXyGu
 X4fwMfZ7clbWPlhixexrPUx8KCBvqjeaW2H0A83RfHN5Bz2pCXyJtk4DCVWYR4za5daI2eBj
 Fr75FsJjKK/KkdGekOej2iZMM0s0aGoPtDsTPm8gjFmM8UpKVPvEM2DYyetM4HRfKoEyvpX1
 XSzK5/E4ZMm5UNPlmHeegvl+eV3rh3SPEuKLXwB8/hC7VZ5TCXPIYrpzXPUNrxphE96iFyNr
 r6zyPdmOz0ACbajM0E7AKY4LEwQLGhTOHwFg5UMLYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq71vf9DKMNoLed4nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSSkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:x4MkiKnm7XGQCgDmFgZSe+IZeyvpDfO7imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPtICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IOb+EYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtJdBkVCe2Km+yVNNXh77PECZf
 yhD6R81lidkDgsH7+G7i5vZZm8mzSHruOrXTc2QzocrCWehzKh77D3VzCewxclSjtKhZMv63
 LMnQDV7riq96jT8G6T60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKfQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8AAk3DsJQ7LgpOSfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0iWBKq59Rs1VvFa8lLJNBp40W+01YVL0aGjjh1YwhGO
 5ySOnB+fdtd0+AZXyxhBgu/DWVZAV3Iv66eDlHhiTMuAIm20yRjnFohfD3p01wtq7UEPJ/lq
 L52qcBrsAHciZZV9MlOA+tKfHHfVAleii8RV56F26XXZ3vC0i92aIf349FkN1CWKZ4hqfay6
 6xHW+xiwYJCjTT4Iu1rcV2ziw=
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="54894368"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Was3vY7KLasnAynXbzxpffCvstLd+voixBI2/55FZONnGQ5SQq0GOKWShoA2rjwvmJSZSdoMQn3xtEatHHU5uhiysJZvKGhrZeWLQdFreEky3W/Rs3ndi4YHL4xw/3UuK8mXFu1iIKzUdLWQHv3/HGHLaSdMp3UQMvX2p20GbbY2lZzgxq2vZmqbik3pkUs/OEE7+UBdc80iexpp921lXwAMFYzNhfYhToSOX7xMYhf7hzJARGQ4UrQZh+7yIvRofCnutj6H0hexXTo+GENZ5S0O1qoAUGlu9Lm8izgANfqsJO7umH+i4/EHYX7Jq35ZKZYXSk2Tcc5v0KmbyWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nHjxeA3dzMdrSXROFM0Iq38LOnMVMcK3+TJ654bNhG0=;
 b=A/fq6vpPyJC/i8cBDpJRvtdtQvT1fitHyI9uWj47OJ6zuWXHcDXxRPDOzGvgPmSrR41JfEKd6A/WvsiVsL9lr2umlnGQ0Oxj/S4mxKawnwd+IDmRP0Vse3QPgEOfudmH8nYGUAIJZ3WgCjrC2oD96K8uJmeq8orOcWaU5pd1aAFu0Yl0mAAgHmp+7WSMhPNvcjMtP/7+m1tfHIimlCB2QUtxkC1CLWAOkoNqxFRUshN7kNTtg4k6kPdnyFHUVVueUKqes1gVnM5tN2iX5tIncB4Rlddq0AIggkmGa86ho7eVPUcjC/WFiGkZrKq551aMZG63eb9QhB7Cf+HyAzqmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHjxeA3dzMdrSXROFM0Iq38LOnMVMcK3+TJ654bNhG0=;
 b=BpbKF3SdqmWdR7PapGP1nCUOCY0LMifVm77J35Sv0PhsncU0kcXuK3D6fMU7fD5jPrBoz18Y4deaYfS8hHvFF9rC9frhCNsSy5xjoYYFpQqAJeNA7Q2tfddSfUFvnjjcaW2DnehEr/GBRh9mUR3DLM6Ro7g41sUQWAlLLXmkzl4=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] gnttab: allow per-domain control over transitive
 grants
Message-ID: <60295250-d6b2-1a0e-be30-d83b4f3c76bc@citrix.com>
Date: Mon, 20 Sep 2021 10:32:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917154625.89315-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0042.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::30)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de0eb42-7488-49aa-dc61-08d97c199280
X-MS-TrafficTypeDiagnostic: BYAPR03MB3797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB379763A585513D6861C24D2DBAA09@BYAPR03MB3797.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgCWk85TnL8hZfVIHvbrTA00tLXZjmhu/NNBbTYMTA7fYOlZWiVEQuHc0Hzv//jcvR4tj18Nz9WcyIg+ldwvPgtbugsRr85KzFq/QiL4zgF9QfsdcGgayFQdjgnttnLBRHcdWxBTLHDNjyG8hnLfo7OMhjhMt+8m+pydOnsiB61H1OkrSeKysHSGvwLUa19zsyWxMzdr7C2+yTTnEfWBumCLEBcuZRNrilWgl7m/DEsv7VfVM86UMScH39/RKUKxmWJJV8XqkBHedmg7wS4H98hlIst+z0yUytZfvUF9IVDWWSZ3n6ACDFdSeKMEg6PoIqPltVSTBK9U5agpILl74Jtbn0s65SyFDbCQ8hxyp6huom8tDZtsO34iSn4nBlkq0OHDiN3+kh8WnYUuvomyb60fd2WeI7eRBd7gmtyx9RSefqt8a9JAkfP/mXo/fmE3xnIKUAv1ptdEOYgFHPNUb7ax8VTWZq6rcuAFeQXeXIcL1mYOOSlj+pn+QPQJ34/KPt4JXGxbt7GZxCzjjeq1/mnnS5RNXp2Ekecbn+OkQezVQI3VGXIklA8hBlrN9T/aw7u70ALZTpt1SXe7v3NTvk5+a6RXnREgV05VBDtJs43ejtw6hc41j0BmCLvAjmWqrylkoKD23r4zgQgdAuzUnrjqBZl8XkkdfWL41mVeis6AmUeITm3Qf52oHHmRqAlidndeOLI4DFzOsh4l0cBAvc6GEyqYJpfzKWpDyrsXyVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(2906002)(54906003)(5660300002)(83380400001)(38100700002)(53546011)(31696002)(31686004)(86362001)(316002)(16576012)(8676002)(8936002)(55236004)(36756003)(478600001)(66946007)(26005)(6666004)(66476007)(4326008)(2616005)(66556008)(186003)(956004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZKdVc3VzkyQ0pCRzBGM3FlandRR2N4QlpXYVhFeGJ0T2Q4UTYrT1dWVFNq?=
 =?utf-8?B?cHptcENLWXlZc1NqTHJrUXpwY1NjSnY2d0hXK0F1MWVUL1hUN2kydG9LZGg2?=
 =?utf-8?B?Wm5oZDk4ZkdjcDg3WnE2RVp6NEliK1J0eTlad3pWWWlHZVRNNmFuQ01yWGR1?=
 =?utf-8?B?cTNrT09uZ0t2bEJFTkk2eEJ2T0tBMnVLM0dGUTI4UzdPZHZqZkUxOERneDFw?=
 =?utf-8?B?NEp2TWdWS0ZrYzdYaldON3h0QldzSzhFVEViTVNhLzBCR0k3OFNnTVV3amQ0?=
 =?utf-8?B?ckJyRHJtZUxjT29ZOWNyZS9pRGR3enlZbU1hb0RyYThlcDhPbWFCZFd6NzFw?=
 =?utf-8?B?R29ZeGZsbGRpVW56Y0c2dDh3bDNsczRGOUM2WlZ2TzZTZmhDUVJ5dWl6bE9L?=
 =?utf-8?B?U2cvdWcyUUw5NmU3UFFaMnFBbGtLUDNkOTdvRWJQaXRpRnVGam5ZWUkwNGVr?=
 =?utf-8?B?TmdQQ2lPcVF4anhGNlY5UWZsc2pLZ0c2R29sanFlVGpXU3dwTmV0R1RLRFZV?=
 =?utf-8?B?WWJlK0tjUzc2d3dFZ0pFai9pSTVBQnh3eHZiM1BwcjdQbmw3cWRaaW5kaERz?=
 =?utf-8?B?SzBCU3RHZmMrd0ttR2hDZ05BKzNSUHVUT0M4cHBLWUlleW16Zy95ZEgrZjVv?=
 =?utf-8?B?VHFuaEtmWi9wODREdTFCaXhsQ2ZvUlR6dStEVlphcHlrclU0L1hwbk0yZVV5?=
 =?utf-8?B?QStRendKMlNoMmtRWDh4S1JmdURudGxuUnRRUFhGbEx1V3UxMU5qMmRDYTJ1?=
 =?utf-8?B?cHNBQ05sUWhiZEdNYXM3UUVOekFhektsWDZrVXAwdUxuaXBBRHUyVUdDeFN4?=
 =?utf-8?B?ZThqUDVEcnJUak0ya1hXWjVCSGhGWXRPOHB5aUVYZXd3cC9DVkhzZHprN29S?=
 =?utf-8?B?UzNzTnUyTURoRjdNREpZMThEa2l0WXpCTEZxWEVyYlZieVFkak1PZUI1d0JO?=
 =?utf-8?B?NC9nZHdmVUphU3VkMGkvbDIrMnhkSHA2TnZGN0ZjMEJSLzFJNkxaSnJGUGFV?=
 =?utf-8?B?djhIWnJNY2RVdjZpelZVQ2t3ZVVPTGhGbDVTL3hudXd5V0MrS08zV09iK0Ns?=
 =?utf-8?B?QjRpRTlyMzFsc3ZaTERZejBYdVFseXpUWGg5eW1lQ0tBQWttVWZtNjR6NC9K?=
 =?utf-8?B?cWZjV0FJd2JsTXlPcEdmV1IwYVJiU2hDVmNKMG54MTdPeE14eG12QUZNOG1J?=
 =?utf-8?B?TXVOYUZnQVgwU0s0R01tQWpObkJlbkd3S25FREpLakpjMXFxMjNQcGRBdU1n?=
 =?utf-8?B?aG0xZzJzcVJDWWdpaU9kN25vdngyTEZ0QXdJbWxGL3NqV3lJN3YweHdhLy9S?=
 =?utf-8?B?VEYzMWZTdUN0emJ5MHNVZlY5K2RraER0VXViOGI2MU1PbzZEU25lUUpyT0FO?=
 =?utf-8?B?bXRYZE9KRzIxbVJDbXdsckVqYkFlYlRpeDlHUmxTWC9BT1Z3SE5RSFBSTFdN?=
 =?utf-8?B?cFZYK0hKc3VMZitKcExXdzNORUhSQStaQjVRTTF2MVp6R3JVQkQ4Mzg3WVZZ?=
 =?utf-8?B?aEZPcEgxODM5LzNTRnNxT1dwZUdBVUJpTUNTdHkzanRHY3ZFNkFlK2hSdUFv?=
 =?utf-8?B?L1BxallENFhHc1NpWWFyQmd1dmVTQzNEeTRJNmRVUUxDRHZVY0J0SkI3SVBP?=
 =?utf-8?B?M3Z6U2hXcGdXUnNUY3dOYmNueXg1VDEyejVpYXJyM2dUR3FmRUhMWnpueGo5?=
 =?utf-8?B?OUNtUE0yYnFEWGcvN016QzFscEZ4eEpmbGVmbjNCWG5tQnI2dmUxdGQ1SHNL?=
 =?utf-8?Q?aINaKnJKZqQTHTnmrY2gcRvHYLQf361wXEh0iAi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de0eb42-7488-49aa-dc61-08d97c199280
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 09:32:32.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHNReRaLwYuBOOwH1Iqzlp9RV+0U8/afqHoCRD+yjOufB36vTH8sq4CeVDNGtLEAJTgxB2R/SfxtH5i+/Sh6TCzZl720ITeJprco+AERWNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3797
X-OriginatorOrg: citrix.com

On 17/09/2021 16:46, Roger Pau Monne wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 7f8456c50e..fe2201fca1 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -96,6 +96,14 @@ struct xen_domctl_createdomain {
>      int32_t max_maptrack_frames;
>      int32_t max_grant_version;
> =20
> +/* Allow transitive grants. */
> +#define _XEN_DOMCTL_GRANT_transitive  0
> +#define XEN_DOMCTL_GRANT_transitive   (1U << _XEN_DOMCTL_GRANT_transitiv=
e)

There's no need for bit position variables.

> +
> +#define XEN_DOMCTL_GRANT_MAX XEN_DOMCTL_GRANT_transitive
> +
> +    uint32_t grant_opts;

So far, we've got 3 bits of information, v1, v2 and transitive, and
we're tight on space in the structure with loads more to fit in.

I was thinking grant_flags or equiv to contain these 3 settings, and any
further which might appear.


One thing which is missing however is the enumeration of which settings
are available, and rejection of bad settings.=C2=A0 If v2 is disabled
globally, trying to create a VM with v2 needs to fail.

~Andrew


