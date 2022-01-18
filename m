Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F849241E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 11:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258439.445062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m4a-0001AA-BE; Tue, 18 Jan 2022 10:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258439.445062; Tue, 18 Jan 2022 10:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9m4a-00017U-5k; Tue, 18 Jan 2022 10:50:44 +0000
Received: by outflank-mailman (input) for mailman id 258439;
 Tue, 18 Jan 2022 10:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pp88=SC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9m4Y-00017M-Qd
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 10:50:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a9fc76-784c-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 11:50:41 +0100 (CET)
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
X-Inumbo-ID: 79a9fc76-784c-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642503041;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2rd0dRxurMeCld1piTRTkR3LaNJjUeBSUgGst226drw=;
  b=XEmjW+2JPm2qhLSl5yBnFV+ZrovglKmIGWaRPr6hUtRTMwqFEKEAj+jy
   4lgxWV3/if5OhuOkyO6gcoD34XKfBEGHx0nVQh5Nqm00iZnuQKtIqYVIb
   RVCE/PmHBffcFA2IdcDk3uATR/fnh6RlaYidoEer+WSenirYHlL6ATFV3
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MCm9ZsqU8SHhHK7lzyT6SMCONDk11yi2eQx6hD4HRgb7UT/Cbl1In5k4or3Mb7AGlWFNOVbMa2
 0u5TJeLPwziUG29fIiF+zKWvpblBkEb1++aXsTr+MOViDzHcOYhoXy50zYEQZelakO+sww7tO0
 vYceI5/3Pk9Yn3C7oEc1Wjb1NlTALQzm5VbGsmxjb/m1UlOQapKpjxAFKeg7j8B/YzC+m3LkBj
 Y06lCvyzWizjjeKmfMzEz9XgLDeVew8Wn+qiBlSV35NPknkSLfSFBhByq6WhplHl5Bs5iMts7P
 u4aS4IcBl5hYoxdI6krBplmS
X-SBRS: 5.2
X-MesageID: 62201888
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7z0ZG6pHvGGd6pRrOKvZ1H9JXGBeBmLoYhIvgKrLsJaIsI4StFCzt
 garIBmGO6veMWTzKtslYNnn80IG68SDzNNhQQFp/n1jFHtD9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaSNUTgNH4Hzo/QQSVpCIgRQPrJt2paSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4UR66HN
 5pJAdZpRDffYyBoKHsUMo0nobuzuVXHdBQDi13A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA8cyZ+TP0Ki/QmSCZpz
 G6ssdD2Lh5G5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A71JZTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBZw6ByD8hUVPlhcRBhps1XQ9lFAN7fYVXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMJYCf2PPErONjsYyjP8UQGPY66PhwzRoAfCqWdiSfdpH0+DaJu9z2FfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQXSBshksvLsiFiFo
 r53aprRoz0CAbKWX8Ui2dNJRbz8BSJlVcmeRg0+XrPrHzeK70l6WqCBmu1wKtU190mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq672hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:2bW7Ca6YllSDz2yVpAPXwVCBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ITjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.88,297,1635220800"; 
   d="scan'208";a="62201888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BayoOyWnJA+mfx3SlFv4XR24D9ch5FQHR1+AJpUNaAulOQIAPkQI/RAP0nkwPTtjgXUtHsst5egAyCWpAgjkPng6dpNoy1lpfyfr9bH0/FxqvIvr8naMoBiNPVEw3LMXdBKWFgrXqOfh0/2YcONQ1oTA6BtgMfT31s+1+Pt785G2kUW0C/yNaXfRVsBxjdzvwKQzdq8lpn25eZowasjWr4l/OsFY7plqwqm4yz4KFljjuKxhVRRmSQxH92NOrPg0Iuw1E5+Vwmk6EUUcdjQb9R6IpghqEtVBEGmzlY0zh01lQVXmJ0mlUvXc+BqH5Z7bK2BBFZmaScDhfdrOqWL16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfHRzazomr6Mxwdfj8yoJaVfINXi330K/rGVj2005Co=;
 b=UcOwrQskcYVfZ4zLTJLMMZFtjAtosOoizFBBSH/34izijib9Ue11KH/8vM7Yyrjmit8eCGaetG3/63IM3flwARDmsBm4KzdALPyR3nCgoYo1tVlnv3fNLXe/Ypu3ooQ2PglvTL2csFVVYpv3XZ7z7FWwizqlg9Ri8HbidxuRe+dv/maqL9+V+wahzjGnNZlkbGEu58Arm2ahLZ+bh5fzKZXSjZgOPYoPkT99TA5p4oQ+L2kHKf8RijNcWuvnK+ZpIe4DJzb86wRn8FuRkvTzSNnjYAW5rdFeH1eb5H6k2HRCU8iXlW58VEk92kKl9wPMR9Hw/VVPy73KdUp7O1VOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfHRzazomr6Mxwdfj8yoJaVfINXi330K/rGVj2005Co=;
 b=RjvzhqelomtfKHhjLCaaF0pOKg/m5IznjwUv/e2FuaKLJ1m6AhHUH5cOPmG5pPs6kPjCnX5oA0PsuSoGva/VADx8Kn9UPkIm9pN0Vl3ceT4WQgqQuAdRpf4H7a98P/vBIrGN2DzWX03CBhLstwXIq9/aPptNc/2M3O9fg0MPJTk=
Date: Tue, 18 Jan 2022 11:50:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 01/12] libs/guest: move cpu policy related prototypes
 to xenguest.h
Message-ID: <Yeabd8eme6UOIA4J@Air-de-Roger>
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-2-roger.pau@citrix.com> <YeaOoQ1ELpJpL/cg@perard>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeaOoQ1ELpJpL/cg@perard>
X-ClientProxiedBy: MR2P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7990411-b894-47f3-b9f4-08d9da705baa
X-MS-TrafficTypeDiagnostic: PH0PR03MB6445:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB6445082BAF84FDBD5A7886F48F589@PH0PR03MB6445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/rFVXF7kFkHNvIru3wJRDLYZGvJ7vSSt3lSe3aPnMk4kbjk90afUtRQ3hHq+Mwcyg2y06t3JTCzmMHEpxxEDqg3v2kFM9bY/EPh52BhhBlGl8fjnioCi9TW5/lnYPStu4P0EWlaNyZvppb2vpbssFupaxp+Y5b3CfTAQsX7/h4OtSUxcNNiWXYYmyckIMwr6hyuzVQQYV/dcESxXL9SJ5vT7+zf23/ixIjXjFx4ip893NuGPZYKUrsgmyzP5bOZcXMkTjcv3lZUoeXVc+8CYy1UTctFLyP0b8zCyym3mKnkx4xCcpA8PdazArGdGuBsPL36AbevOUTTimawun9MKyFJxCxjWo3Rd7FZ74UT9RKWdPCbZIhKdjBoSqjBdR60CNnjHgnHbbNuICIWcPUxx+CWDGcuMAgJuX9w7XlJDDbf5GDtwTbIWcJuhewUsxLCCvaI4pKufAzLA5XZzwn9VZndzFjqpBL4o2hju3K6GdpfC5DjxOUe+uoS9+vZri+PDAqSI7zZu/toRi9tGzXS1Q69JEQv3zQJY8a8TeKbmm7HHTiAhiHRJY+2NYtqFrnsxiTj8Wh6zBSSxK2IdDo0abjJwVwP3YeMspsd3KjknP7jv9JRdDk/OH7pe4XrZr1FlAdyIEm+RlOkteuNHoROoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(8676002)(8936002)(6666004)(508600001)(107886003)(33716001)(6506007)(54906003)(85182001)(186003)(6862004)(316002)(26005)(66946007)(2906002)(6512007)(82960400001)(9686003)(6486002)(66556008)(6636002)(86362001)(5660300002)(66476007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak01NDk5UllXVU11aTcyUmhtT3hmSGpPbERoWlhROHdlZ3ZKUVRXSitqb1Nu?=
 =?utf-8?B?akFjZWluNmZNRVkwa2tBdzN0S096NFNZRjN6UGVMOFE3c2JwREFFUS91b1Q5?=
 =?utf-8?B?Q0ZxZFRibEkvNnFmMFVwaGY4c3JzS0lZYWQxNURGWjZydHE3d0Y3LzZIUTZR?=
 =?utf-8?B?Y2lQajFkbk9rNm8zWHZxbXdhWHozbHE3S05GZjcwOUMxamZrek1zbXh6a3cv?=
 =?utf-8?B?dm82clVrY2JuNVFNd1kvdFZzalFicFNMck5na0tsUkxKTFFMRjArV2h3T05Q?=
 =?utf-8?B?bkZSWHA1RkZKU1BuTmxjcjVla1poVlpZUnhDOURiYXpKZmhSdGVGQjJONW02?=
 =?utf-8?B?YlRBV2Y4cjdubk5lQmRmOHJHc1FCOEwrL1hOc0U5NjFNOGtpN1dqanl6QVJL?=
 =?utf-8?B?S2ZOazluT3ZZMXl6TVB2V1dvNjRqN1ptV0h6YmNadWNlKy96WlM3aWNWNXBp?=
 =?utf-8?B?WmdNYWg2bTArYjlyQ1lJdkYrNHRDRHpIWVVKcERaeUZVYlJBNVp4ODFwazFS?=
 =?utf-8?B?ZVBXZEd6Y1VUY1ptUVBtcGhkNVEyQTdVSUJZbkZ1SEhnZS9lTHQ0UU9ZWkQx?=
 =?utf-8?B?a2ZPc2lIeVNkMlArVmhBckZLVzlzc0F5ZlVVMlEyMXI1bSszZmlUVjltcG5B?=
 =?utf-8?B?bTFaNzFHczA0eS9QZWhqaFRmV1E0cjRSS2xqVXd5blVQYXQzVVVwRkl3c0d5?=
 =?utf-8?B?aUdQdTk5cXBCd283UXJzK3Y0VnRJT2tqZXVsQ3pvTC8rVWo1OHRwTWhaS2Rh?=
 =?utf-8?B?RVBhOVhpaUhUblhGUkhBUUZLZG5JMmtRZHovb205OW0wSXUvanBlTjlhWWFu?=
 =?utf-8?B?eEQraEtKSnZDZE5aSTZtOXlQN2o2NmpBaFBKL1AzUXdmeHIvZno2RzhpWHZo?=
 =?utf-8?B?cHJzenJhc2NmMkNpYWhKdEROZ3IvYnFXQlcxOHd3V3RyVlVIZVV6ZE1QdEdh?=
 =?utf-8?B?RFFTMzZMWjV2SXd5bG9WU2tkcGY3QS8rTDliS3BhSTdWRGRoOUQvWTB4c0Q1?=
 =?utf-8?B?MWFZZE9CQWg0OWh6TFM0RFpaUWJEb2lZdU1LN3hYdWNFUE1KQkZxaExleTJo?=
 =?utf-8?B?dEpicEtaQ3hxbkhvc3lEUjFqQi9NaGZDMzk2bmFwT1lhQmt0RjRORXcvc09w?=
 =?utf-8?B?RHlLYWxUb24yU01vQmhyVEZNYzFSNUVTclJzOUplK3JidWVOZmZ0L0FRUkFw?=
 =?utf-8?B?YTMzZXdSVnlOTlZBc21SeTFsU3ErZTZJc2F1cnhmcC9XQ201ZkxRZVdRbVEz?=
 =?utf-8?B?Z01aNHZmMndCOHFVbG4vWU1aNUNoWFg0SHBuYlVTQjBKckJrNnpGZElWVWhK?=
 =?utf-8?B?R1VNQjk0VHlMTFVXVUVlNWlCUmJKRUhKd2x6UnJ0UXF6NHVnUVoyU3piMzQ2?=
 =?utf-8?B?cFVLL1NkWUF4VzdrNThkM0M0TEEwMnlJaE12WTFNRG9KemJwM2d3Y3hlM1Rs?=
 =?utf-8?B?L1RHcEI2aDhqME5JdnNlOTRFRU93dFRaTHk2MThwdXBwTi94T1Q3RSs4NjdY?=
 =?utf-8?B?UlZzbXZFcDhDT2paa2NkUGtucm1MNG5aSmxRR1crRFVBdXhHOE1kZysrZnRr?=
 =?utf-8?B?bmhoUEpiWFBSRW1MVmk4bkNubURMUWtabU5XUnV4Y1Y3NU9SdnhFQnEvWFo0?=
 =?utf-8?B?SHVWWS9lcmtOM3ZUeVdSRGJVcFd5emczaVBLV3M4UVNodTFQY00yaDBYMXRw?=
 =?utf-8?B?NW9GSFJmYlV1TzVqU1ZzMEhmNjNKeTZWSEpGbjRmb3NTYVppenZtazJzZUlO?=
 =?utf-8?B?amowT0RmbEtXUWljYWFEVXBFR2dCb0RtaVpJbnA5Yks3TGNudGx2MGZYc2NM?=
 =?utf-8?B?aEhCeDc2VjFtK1VibE1Fa3pkYjl1Q1hxTDNMaXNrQWFCR0hRaHdGdzhsVWJn?=
 =?utf-8?B?NTVHS21ZNy8wMWZrTDluakZIWHpLSG8wcE5seGUyU1M5UTlaMWd2MFRFTldj?=
 =?utf-8?B?amJrbnQ5elM0TFdFU05kallpK21IK3RmRHpOWEwxb3ZLanpLWUR4S2l4S0k5?=
 =?utf-8?B?VjFscVlsTjVIWVhMU01pMjJYcHNuVnlFN1RmL2ZXTGtoVDFNSjA5NTlZU2l2?=
 =?utf-8?B?UXZSQlM4ai9zY1NxUStlTVIwa1VkS1g0OU1OeEtvUjJiOTJMSk9QUzhha1RJ?=
 =?utf-8?B?dFBaQ3BpOHFheEY1UFhHM1Rpa0tiTTFtZmJXR0lETXlXWmkrOWJyM2Y3MjVB?=
 =?utf-8?Q?dSvZWF9I94YRmJIcWWsYXhc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7990411-b894-47f3-b9f4-08d9da705baa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:50:36.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLdetkZ7NPL5VVcPkqezi2pltvZ7LNnxYkYrJXWYl5MJum8aPx6gqr6ME609LjVksMq7eB9YX/wTJUoAL2Xj7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6445
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 09:55:45AM +0000, Anthony PERARD wrote:
> On Mon, Jan 17, 2022 at 10:48:16AM +0100, Roger Pau Monne wrote:
> > Do this before adding any more stuff to xg_cpuid_x86.c.
> > 
> > The placement in xenctrl.h is wrong, as they are implemented by the
> > xenguest library. Note that xg_cpuid_x86.c needs to include
> > xg_private.h, and in turn also fix xg_private.h to include
> > xc_bitops.h. The bitops definition of BITS_PER_LONG needs to be
> > changed to not be an expression, so that xxhash.h can use it in a
> > preprocessor if directive.
> > 
> > As a result also modify xen-cpuid and the ocaml stubs to include
> > xenguest.h.
> 
> Adding xenguest.h to ocaml stub has been done so it isn't part of this
> patch anymore ;-).

I assume it was removed on rebase and I didn't even realize.

> > Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks.

