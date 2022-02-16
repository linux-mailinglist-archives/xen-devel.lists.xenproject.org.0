Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0504B861D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 11:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273973.469292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHny-0002c9-QZ; Wed, 16 Feb 2022 10:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273973.469292; Wed, 16 Feb 2022 10:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKHny-0002ZT-Mq; Wed, 16 Feb 2022 10:45:02 +0000
Received: by outflank-mailman (input) for mailman id 273973;
 Wed, 16 Feb 2022 10:45:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6VyC=S7=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nKHnx-0002Y4-4P
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 10:45:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7becb065-8f15-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 11:44:59 +0100 (CET)
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
X-Inumbo-ID: 7becb065-8f15-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645008299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9aRORfQFiFGzJowWamjkxN0EDjr88tMV2BKQBi2Mc10=;
  b=NGzfgNRgca/02hX6clCYucLv2GJsBNUUwfXwNTfEIEX29qF3zV5ROztV
   DuNf7onl/K7mo/kfLRckEZHHE0XeRUj1wHirtjwDNNAXZa/WN1bJbdmFK
   X3MOQJMu+pFCIgfIMDaYQNMss6kM6XN07rAYNU+Lt6vWhnk+aPTMgeoDy
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dm3BNYNSPPgnuzAommj4ftxFfzftszDOl9cour0P5EDrefAlZ1KBI9G+JZ2qmdOj/zCYHG7ITv
 8ZLqKs2A8xhCw+SVAR++ELLojwpV3bdLsE/senH81hg+N4eqSzMsFb/YStmWZGIkinUOeFMO2F
 UZK58RGPrOKh2oqESKCirJ1iUVN5HS0/k8htoiAkKiFd/bSN8w+Zb7SW/GJixgo+dnEvy9/wvm
 Xo+2n+DQkVlpkL9cVqUOZ20zceZxfnnmJjIO5HWVp7W3CaEOtSQZ/+PZEzYY8icViWSqLoGvIl
 VpGt5On4CL3DJVrhDQY2L1IY
X-SBRS: 5.1
X-MesageID: 64328256
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JzL2JqqNybtmKE0Vh/QmKBAtT4peBmKhYhIvgKrLsJaIsI4StFCzt
 garIBmOPqmLMWTyftogO97gpkkFuJTQn9I2HQBqqCg3H3gS95uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaOAZD04MInSodwQbCN/GT1MYv0XxaCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZZCM2o1MUqojxtnE3MRM7QFs9eRvVb+YRR1pH2NpZYs2j2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkkM9iYxSuA42ibrObFliPmW6ofDLS9sPVthTW7zGEJFAcfU1f9pPCjk1O/QPpWM
 UlS8S0rxYAQ3kG2Stj2XzWjvWWJ+BUbXrJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceRyEu1
 1KPt8PkA3poqrL9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uTwmDquSOigobwdgMK3CLdQlD6vlJEe9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKgggBd2B2zMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bCNSPME+ZUYQLUBgzc0E9iiF+Im
 zq4H5HUoyizrcWkOnWHmWLtBQxiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6NVK5/bU6sVE2mvFvZ0RcCVkbGOvS+D3GqmFyGkfCI+b9hnQQnI8cXjZQzh6G8FCS/fiCf0i
 +fIOtrzTcVRSgJ8ItzRbf7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYlqmuMPAOkFtQnZB7FrJnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOzQas3/EVMXKA40Vci51KkZymvI8PA4AETm/ysrrrCJZlpfYkuXgytHIborbI58m
 bU9uNQb4hCUgwYxNorUlThd8mmBIyBSU6gjsZ1GUobnhhBylwNHaJ3YTCT3/IuOe5NHNUxze
 m2Yg6/LhrJ9wEveciVsSSiRjLQF3Zle6gpXyFIiJkiSnouXj/A66xRd7DArQ1kH1R5Aye9yZ
 jBmOkAdyX9iJNu0aByvh1yRJjw=
IronPort-HdrOrdr: A9a23:sO7N2ai/WVdvy7TAy+vqzymjhHBQX3x13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICRF4B8biYOCUghrWEGgE1/qj/9SAIVyxygc578
 ZdmsdFeaXN5DRB/KTHCUyDYqsdKbq8geOVbIXlvgxQpGhRAskKhWoYe2Wm+w9NNXN77PICZc
 ehD6F81l2dkAEsH72G7w4+Lo7+TrPw5ffbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T8c2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfrWrC0e
 O85yvIDf4DrU85TVvF+CcFHDOQiArG3kWSjmNwR0GT+vARCghKUfapzrgpDCcxo3BQze2Ulp
 g7g15x/qAnfi8p1k7Glqj1fgAvmUyurXU4l+kPy3RZTIsFcbdU6ZcS5UVPDf47bW/HAa0cYa
 JT5fvnlbxrmJKhHgfkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 v5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdcPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekwhlQ9fsujDcSuciFaryKQmYRoPiSAYY
 fABHt/OY6WEVfT
X-IronPort-AV: E=Sophos;i="5.88,373,1635220800"; 
   d="scan'208";a="64328256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGLMsWMhMcwJ/aAScULkQ8DUwFUHWbr2QbW4xwuodf8TRmflFo5syF+ol/wTeMAxPLwadqZWLAV2q08AQ3psDrXJY7n2onb+Mw5xSngdOR/iaJ5T6NGylcAjfuAC+CGjlda0tyeg4H5HuHXeJvWVq3uo0UtRTEUHvL+OruKv4iYq14wdTI6kTsaEYqOpe/OSaH9sS0dkBi1M3+yNHOPAd9Qd7hM7DcP8xQ1tuGNonbgg85ay7LV6De6bTr7BYXbDu59Dasbpn2JYp19R77W/qQG9YaqKgBEaFBAhi6otKZMogENi+FCoyafc52oiD54e7cuxlgYeeyCVvusb1xN7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aRORfQFiFGzJowWamjkxN0EDjr88tMV2BKQBi2Mc10=;
 b=nBtIF566W/1LvBN7igCeZds1yIonouGG/1Rrp4FYIqpWiOXy/icTWmQnCgW+4Ow653FS7VCgLYaqLgA+2lZquMi3wZ7bTifoW03KJuefWKiBcPWofl9R4rMuL3TvFetTrcoPdnk9vHsKOjjW5eHCP84qVdWrJ9prPPSybeQMqjPMk8E+JSh9PH5PyN5EBCgqywBEo2BzD8bZ1igq1Lr7yzEF4iKXKlEyU4qg2Wd8e5NTYYDiHBwptW5qm/Eic3lwZvYk+JmUkowMxmdEU69g4wOBBE+usB/ahlt1Uc/rXa9QYWQuK3nuImzWF8Cf4qmajCwU+yBa/g64bNVNh6gwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aRORfQFiFGzJowWamjkxN0EDjr88tMV2BKQBi2Mc10=;
 b=vWAwb9P+W2MuKG7FHCuDEGZCIk2n5hAVcU/q5JUa3vfv2YcMTwMUvFSgw8DjPz4bcGqswZbEYjgbrodH7X664OcH559OGJ4YIjrHCs5FUl8hRqly6euqizhzdFr8oDp0F8YWF0ADFzS7Sjakhwc4LvTcNNZvRTHHEqbx+OFW/1U=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Topic: [PATCH v2 02/70] xen/sort: Switch to an extern inline
 implementation
Thread-Index: AQHYIaGjy/wpq8SdQkKdLl3UHHKbD6yTBxwAgAKFHgCAAHT3AA==
Date: Wed, 16 Feb 2022 10:44:52 +0000
Message-ID: <faa6c523-6e88-8987-c0c9-3652c002fda3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-3-andrew.cooper3@citrix.com>
 <70824a0c-cc48-b064-695c-35c2d06c0ad1@xen.org>
 <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2202151800230.43738@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18bae67d-0140-4071-7b27-08d9f1395d26
x-ms-traffictypediagnostic: DM4PR03MB6094:EE_
x-microsoft-antispam-prvs: <DM4PR03MB6094205E1A0D6084E0084599BA359@DM4PR03MB6094.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZQ5k1vi7H9wa5RRmgWrooHvXiwNLnGV6tR1aRY0IxMd0SW/UspbzqJPrv3Hz6pulNEPPwD9ue+aW3lmRZR2mi7elbF+7YrjYL+/5MxWJkf7WSaY0DQbZpYxt9OEphmjEDmGYLBfzkAWNKwd9W+Ct/75WgKJkiF+vlqspWSjJEcKWuqlv+M6YyVjCmnjUPJagJ2uXqDx+gOz3bc4ESPWh5C791BBBKzpKzOixLXswYFoIxIxvMQKJeM5D5+X7pZiJrksJF/gbQcmYXF4u3/4HnWjdoK/rhlffRzCo2kv3XkzkedYjCESGrVCzMa+6ZhuLQHkdy7yYAQv7yN5T+YilYEcN6o4Pyk0RTRF5/6exDdztb4z5JddvLmqNc98FYrjCuDv//vpReYGg/CiGytU8o4xliEn4OXts8CDU2K2ibdz2kaJ9a5av3Jus1EKT7IGdT/DvvXnp3FyaNhC4piTExt9Q/KZlhiY/38mLPy1zj8X/V5OUPqNnQAQjuUQZA06lJ/0kUtOKrqtorks2LaaPVOzpGwWLevXMQw0rvbUQcJbqbTgdH+ECHDBobUtk3+/Keup1r0tx879XtT4EF7C3HG/9xPfYA0kObPP1MCCUZCQIyWVV9aNys4DqVfaY9lnRw+wVNgYUXsibfie9LF/co4CMd76G0JNMGeqNC+raPDFkmZ37dJgT2zQ1EpqLemk3RGP+QhxKsI0fB/v/wNzYC0KxpOKVKjiiEGMFgUDBV5k+LBHSeJVyZv3Gd7Cv3G5HbFqNRL7VVCeqcvRXvI3gA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(8676002)(2616005)(4326008)(66946007)(64756008)(91956017)(66446008)(76116006)(6512007)(66556008)(66476007)(53546011)(54906003)(110136005)(6486002)(508600001)(71200400001)(86362001)(31696002)(316002)(82960400001)(122000001)(83380400001)(38070700005)(26005)(186003)(38100700002)(8936002)(36756003)(2906002)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE42aThYdnpvc2ZsWlVXVUcxdE5aTHhJR3phazhIUDkrS1o1aEhiMVZ0bEls?=
 =?utf-8?B?VDU3c3ZQb256Q1JLUnJxZUgxVnZZQ3lxckJDdHZqN2FlSVZjNDlLazNBZXI1?=
 =?utf-8?B?TVJOK2lKZGVCdXg0eHl1djRycEx0Sk4wdGZ1Y2IyNTNyVWdJaXI3cnBkWW5D?=
 =?utf-8?B?WjNUQi9XQVZkTGFmTklSMnR1K1d6WjNVaVZhdFBKZnN1L1hqVFFHa1lRcnRL?=
 =?utf-8?B?Nk00VGZtekp0bkFNYzVTL3UzV2FrN1hwTUhPdVdEWUQzdVFyYnJjVEJxb1Rs?=
 =?utf-8?B?dWVCTkZRR2ZHaUlDMWM3S3ZiMkFRVUQ1VXNSN1VkSUNmd0d1NTE1cUkvbXVI?=
 =?utf-8?B?L1BtdmdGa0pQeS9jdmVEclUvSDVVUFd1Z3E3UzgwbHdURjFrRWFZUnJNVmZs?=
 =?utf-8?B?KzFHUHk0b2VBaU90a0FoeUxuUDIwRmQ5d2s2ZmJEUkZvdTVzSnRuUEJuTW5q?=
 =?utf-8?B?N01TQUhPc1M3dkpIN1Nkb1dINnk2UlhDOVZsczdyWmUyb1hMTnVFZ3llMzhW?=
 =?utf-8?B?RHQ3TDV2RXg1RGZlYUpUWDRqckg0Y1NKZmwyTU5XWDNIb0IvbnlqRWgreGQ3?=
 =?utf-8?B?S05SVEs4SUVHcDVYZ0pubzlXbkU1MFpoRDVtV2xSOW1OZlZBdnNoVWx4UExO?=
 =?utf-8?B?MnJiMEVSTXJ5aWY3cVl6UDlKUVBxd1IyN1Z5NE5oWVRobXVyM01pbTIxcG8x?=
 =?utf-8?B?MmxmTGswbDZPUUFHNHpWNGQ2TGFmb0N6OEdYRmtjV3dPVk9IMjB5d2toVC9p?=
 =?utf-8?B?dVBjellNejhCUjcwN2dicWN4VURTVWI2N292TnpkVExCQnc0Ukl2VzZPUFFK?=
 =?utf-8?B?QU9ac0hOeFk0QU5jZWdqSTRITUxsb29XZlpnQ0p2S1NEdWdGL2x0SC9VNCtE?=
 =?utf-8?B?WSthVUlNYkcwOFlVdjY5cFhibzlMOHdYR0ozT09mRlNnb09vaWlGU243UFpm?=
 =?utf-8?B?ejdzU0pSOENWd3AzRVRpaDQyaStNbWhPdFJ3K3hmV21kV041V1FZOFFFd1Bo?=
 =?utf-8?B?RjVlRVhaa3lYNTdiOERSd25pdU54MjBZVXU2TDk2WlAzY2lsMlU1UEhpTEQ2?=
 =?utf-8?B?SExPbkFpK1BwMEIrc2gxYUw2UFFzUUpKd0RoN0M0dXE5TExKUVd6cE4zMHJi?=
 =?utf-8?B?cGtIemlmV0QvV0ZNSWtib3FEOGtVTm13WXZmcVVxR0FZNkVsczY5NFJ1YmlD?=
 =?utf-8?B?TE94bzdiWTlDcGlHamdjV0d4a0dpb1FOazZJVm5ueks3RDVmQUttVFVTTzht?=
 =?utf-8?B?OFloTHdZTkF3N3ZySVI1UGcwMWJjbGpDTXd1VVNtL3FlWE5IaE9GQitoR3lj?=
 =?utf-8?B?a2FQSktRVVlzNGVKNCtxZ3NHaWQyRmNnZWNabmIwY2UreGNyNHZ3aHV0SFdn?=
 =?utf-8?B?dGZFcEp3YUFRQlhiYTI0NmhlWlFGbmpFb3E0NzgyM0pxWVJKUmtZanl0MWVF?=
 =?utf-8?B?MitsVUd1R2RkVlZ3d3lYUjBQcERUMDFMM0I1Q2VUVnhTYXIzVFdjcFF0eEtC?=
 =?utf-8?B?bnozdUlCc2xBcFBTbFRFdTN5S3ZGWmdrY3ZSay9HNE8yYW5ybnQyb1BuT2xT?=
 =?utf-8?B?UEFnanQ2dElCRUJUdXE1Q09KRmNRK0lBUFVIb2tkdTNiWlZiYTlZeitJU1RR?=
 =?utf-8?B?cENmVWkvTXpONGhIeGs3YkZEeW1ETytKdm9qTW13M1VpMi94MFF0ejZUTlV0?=
 =?utf-8?B?RUg3a0U3VWUrSUNRZFozWHdvNFRTR3Z5YTEvUm04N21Fb0hoUHFnN0JIcFNw?=
 =?utf-8?B?aFlxUEVkRlVIek1sWXBzV1d0S2I3VHoySW95SGc1bmZWNk5NRTcrMUNTejV3?=
 =?utf-8?B?NFE2bDl5ZlI5WnFqSzNZYjE4MGw4VnRWb1JyT2FaYVl5aGQ5Yi9xZ21yZzJQ?=
 =?utf-8?B?T1R6RWU5emVEQ3Zzdy9CWlpzdzVleTNSOEQxdC95bVNMcnA5MjBNQ0w4LzUr?=
 =?utf-8?B?M2tqUHV0dlNSNDlTaEs0aktudUl3K1FYQTVOZ0dHT3lLOFFKdEk3aFRCMVZE?=
 =?utf-8?B?RCsyaG5tQ0FGSVcwemJkdVN0NHRZMEZXRWhhVlVJbUtKY3RMRGVlcVJGa0tC?=
 =?utf-8?B?ZkV4dXZaR29DQWZkVmpVQ1hzT2t3Mmp4c3JRTXBrWlF5UE5LaVo4Y1FQaUd1?=
 =?utf-8?B?K2RaU1UxeTV5dE9pUVU2ZmFUelpxQkdvRXYyK3Z0akxFNWs1Q05JMms2aGgv?=
 =?utf-8?B?d1E3WWdUeXVUeXBvR0doSk9wclZBZGwxMmNIQW8wbDliYVk3WGhTV29rdzM0?=
 =?utf-8?B?RGVKSTVaYkJZNVZqVWdBRHNqMDV3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3A5973CE2880B40BF30063A18F2D4BC@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bae67d-0140-4071-7b27-08d9f1395d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 10:44:52.6775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3zFHUaAi3uSZ7XfJmDlli4/DIVmWAdrv2yZAKuUBBQOLjG72+wIcBGE6V9IMVmGA281P8k0DryNtnM1Fq04gfpv0c5ZLsAjHxTa9cwm8r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-OriginatorOrg: citrix.com

T24gMTYvMDIvMjAyMiAwMzo0NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBNb24s
IDE0IEZlYiAyMDIyLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBPbiAxNC8wMi8yMDIyIDEyOjUw
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IFRoZXJlIGFyZSBleGFjdGx5IDMgY2FsbGVycyBv
ZiBzb3J0KCkgaW4gdGhlIGh5cGVydmlzb3IuICBDYWxsYmFja3MgaW4gYQ0KPj4+IHRpZ2h0DQo+
Pj4gbG9vcCBsaWtlIHRoaXMgYXJlIHByb2JsZW1hdGljIGZvciBwZXJmb3JtYW5jZSwgZXNwZWNp
YWxseSB3aXRoIFNwZWN0cmUgdjINCj4+PiBwcm90ZWN0aW9ucywgd2hpY2ggaXMgd2h5IGV4dGVy
biBpbmxpbmUgaXMgdXNlZCBjb21tb25seSBieSBsaWJyYXJpZXMuDQo+Pj4NCj4+PiBCb3RoIEFS
TSBjYWxsZXJzIHBhc3MgaW4gTlVMTCBmb3IgdGhlIHN3YXAgZnVuY3Rpb24sIGFuZCB3aGlsZSB0
aGlzIG1pZ2h0DQo+Pj4gc2VlbQ0KPj4+IGxpa2UgYW4gYXR0cmFjdGl2ZSBvcHRpb24gYXQgZmly
c3QsIGl0IGNhdXNlcyBnZW5lcmljX3N3YXAoKSB0byBiZSB1c2VkLA0KPj4+IHdoaWNoDQo+Pj4g
Zm9yY2VkIGEgYnl0ZS13aXNlIGNvcHkuICBQcm92aWRlIHJlYWwgc3dhcCBmdW5jdGlvbnMgc28g
dGhlIGNvbXBpbGVyIGNhbg0KPj4+IG9wdGltaXNlIHByb3Blcmx5LCB3aGljaCBpcyB2ZXJ5IGlt
cG9ydGFudCBmb3IgQVJNIGRvd25zdHJlYW1zIHdoZXJlDQo+Pj4gbWlsbGlzZWNvbmRzIHVudGls
IHRoZSBzeXN0ZW0gaXMgdXAgbWF0dGVycy4NCj4+IERpZCB5b3UgYWN0dWFsbHkgYmVuY2htYXJr
IGl0PyBCb3RoIHRob3NlIGxpc3RzIHdpbGwgaGF2ZSA8IDEyOCBlbGVtZW50cyBpbg0KPj4gdGhl
bS4gU28gSSB3b3VsZCBiZSBleHRyZW1lbHkgc3VycHJpc2VkIGlmIHlvdSBzYXZlIG1vcmUgdGhh
biBhIGZldyBodW5kcmVkcw0KPj4gbWljcm9zZWNvbmRzIHdpdGggdGhpcyBhcHByb2FjaC4NCj4+
DQo+PiBTbywgbXkgb3BpbmlvbiBvbiB0aGlzIGFwcHJvYWNoIGhhc24ndCBjaGFuZ2VkLiBPbiB2
MSwgd2UgZGlzY3Vzc2VkIGFuDQo+PiBhcHByb2FjaCB0aGF0IHdvdWxkIHN1aXQgYm90aCBTdGVm
YW5vIGFuZCBJLiBKYW4gc2VlbWVkIHRvIGNvbmZpcm0gdGhhdCB3b3VsZA0KPj4gYWxzbyBzdWl0
IHg4Ni4NCj4gVGhpcyBwYXRjaCBzZXJpZXMgaGFzIGJlY29tZSA3MCBwYXRjaGVzIGFuZCBmb3Ig
dGhlIHNha2Ugb2YgaGVscGluZw0KPiBBbmRyZXcgbW92ZSBmb3J3YXJkIGluIHRoZSBxdWlja2Vz
dCBhbmQgbW9zdCBwYWlubGVzcyB3YXkgcG9zc2libGUsIEkNCj4gYXBwZW5kIHRoZSBmb2xsb3dp
bmcgdXNpbmcgZ2VuZXJpY19zd2FwIGFzIHN0YXRpYyBpbmxpbmUuDQo+DQo+IEp1bGllbiwgQmVy
dHJhbmQsIGlzIHRoYXQgYWNjZXB0YWJsZSB0byB5b3U/DQo+DQo+IEFuZHJldywgSSBrbm93IHRo
aXMgaXMgbm90IHlvdXIgZmF2b3JpdGUgYXBwcm9hY2ggYnV0IHlvdSBoYXZlIHF1aXRlIGENCj4g
bG90IG9mIGNoYW5nZXMgdG8gaGFuZGxlIC0tIHByb2JhYmx5IG5vdCB3b3J0aCBmb2N1c3Npbmcg
b24gb25lIGRldGFpbA0KPiB3aGljaCBpcyBwcmV0dHkgbWlub3I/DQoNCkl0J3Mgbm90IHByZXR0
eSBtaW5vci7CoCBNeSB2ZXJzaW9uIHJlYWxseSBpcyB0aGUgYmVzdCB0aGluZyBmb3IgQVJNLg0K
DQpUaGUgcGVyZiBpbXByb3ZlbWVudCBhbG9uZSwgbWFyZ2luYWwgYXMgaXQgbWF5IGJlIGluIHBy
YWN0aWNlLCBpcw0KanVzdGlmaWNhdGlvbiBhbG9uZSBmb3IgdGhlIHBhdGNoLCBhbmQgQmVydHJh
bmQncyBSLWJ5IGlzIHRlc3RhbWVudCB0byB0aGlzLg0KDQpCdXQgdGhlIHJlYXNvbnMgd2h5IGdl
dHRpbmcgcmlkIHRoZSBzd2FwIGZ1bmN0aW9ucyBpcyBpbXBvcnRhbnQgZm9yDQpDRVQtSUJUIG9u
IHg4NiBhcmUgZXhhY3RseSB0aGUgc2FtZSBhcyB3aHkgZ2V0dGluZyByaWQgb2YgdGhlbSBvbiBB
Uk0NCndpbGwgYmUgaW1wb3J0YW50IGZvciBCVEkgc3VwcG9ydC7CoCBBIHRhZ2dlZCBmdW5jdGlv
biBkb2luZyBhbiBhcmJpdHJhcnkNCmJ5dGV3aXNlIHN3YXAgZnJvbSB0d28gcGFyYW1ldGVycyBj
b250cm9sbGVkIGJ5IHRoZSB0aGlyZCBpcyBmYXIgbW9yZQ0KdmFsdWFibGUgdG8gYW4gYXR0YWNr
ZXJzIGdhZGdldCBsaWJyYXJ5IHRoYW4gYSB0eXBpY2FsIGZ1bmN0aW9uLg0KDQppLmUuIHRoaXMg
cHJvcG9zZWQgaW50ZXJtZWRpYXJ5LCBpZiBpdCBjb21waWxlcywgaXMganVzdCBidXN5d29yayB3
aGljaA0Kc29tZW9uZSBlbHNlIGlzIGdvaW5nIHRvIGhhdmUgdG8gcmV2ZXJ0IGluIHRoZSBmdXR1
cmUsIGFsb25nIHdpdGggaGF2aW5nDQp0aGlzIGFyZ3VtZW50IGFnYWluLg0KDQp+QW5kcmV3DQo=

