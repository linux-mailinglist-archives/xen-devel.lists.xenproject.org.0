Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7936348ACD2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 12:42:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255697.438219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FWo-0002Yb-Ey; Tue, 11 Jan 2022 11:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255697.438219; Tue, 11 Jan 2022 11:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7FWo-0002Vy-BN; Tue, 11 Jan 2022 11:41:26 +0000
Received: by outflank-mailman (input) for mailman id 255697;
 Tue, 11 Jan 2022 11:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jw/=R3=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7FWm-0002Vs-H9
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 11:41:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 633b11f1-72d3-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 12:41:18 +0100 (CET)
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
X-Inumbo-ID: 633b11f1-72d3-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641901281;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HBAeyB6pBf2zzgmjH4/b19PdHZ7UWw5tkWqitFhy9CI=;
  b=RuMQ44LMkSNine/Y70BD+vQdyG/Uc3uzMqwKD8e6JIcCDB286lTNZJxN
   ChtUr2TaMajVeNfq5ZK+ev3fv+N3O+ZEoG+zi5Mayn9t9oBwxxqlbHQlx
   oqEH2QQgjhHNypfLsV19daxpFLn7NJerTUsC2uGhLooz6NSf2sbcukyGY
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: huc5QjMXPplabH5vi8Noa7x2WYChMmG8Hk52vF+pLXKC4yzun3f2OFUZekowkb/KP6OlNeBep3
 NThlLmOgGXt85utF8Jo9R++MhDqyOIOefYSAzlmRzqwREa5G5gGXnP/vIGLNU+NWUGSELzUmi8
 gz20TTjUqHbiMRY9SBm+7sqkzlbf8RjMv3m9Z7D2PYI41h450RAkSwPRsvOLyDHfociqVB2s89
 onDxSvJbY97KgaVn3TUyhF/qwMnRnC1XEQmE5LFn5j+WyT+eVoSv/0WiNCk74t+eBaQ2hPkmxJ
 pcVpDCw5Rr05Bg0Znnh6OXXl
X-SBRS: 5.2
X-MesageID: 63848580
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+4N3FKq31LJYyTdfonj+qQ1/20BeBmLqYhIvgKrLsJaIsI4StFCzt
 garIBmCP//eYjD9fN8kOoni8hwCuJeDytA2HFRp/309EClA9JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2IHgW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZC1SV0gBZbQpL4ibUNcGAFzAohe4ZaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4VTaqOO
 ppBAdZpRDbETQZyEAoPMYsdoOGnoVjRXQJFtHvA8MLb5ECMlVcsgdABKuH9e8OIbdVYmF6Co
 WDL9Hi/BQsVXPSPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZNbdx8vfQNWQBw6
 WHTm9jJCANKqKS8HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjiv3jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOvyjxpiGGeN6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYCL6MfcuMtrqVpxCIU3c+TLNDKu8gj1mOMkZSeN61Hs2OR74M57FzSDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTMLxRxP7a8W39r
 oYOX+PXmk43eLCvPUHqHXs7cApiwY4TX86m8qS6t4erf2JbJY3WI6SAnuN6Jd00xvQ9eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP13m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:OraXE6wZDKVN+DIzLjexKrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-IronPort-AV: E=Sophos;i="5.88,279,1635220800"; 
   d="scan'208";a="63848580"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiA98JMe2igvD92OX9r+7TIeecBTX5MdnfUIK35VHRTUa4HqVeeqTG9sjS2WaKSlgviw4LWwfXefLWlg58INnByOIHaO7vT46kpOejk/T68tEdIVszOQKGlQ2MFkZkht5SI67qQroZhdgsquWZQLG/z89R+V2xVx9K+PvQCjpIYXao7siIiwkVKS7s97JVysS/+JxYW7UlLHLgZG/1np0Ib/EUwgR3o/XEb+JLX5HHriaWQfmX40pcj1AUEowE92kWf7DPwtFlD19LcLnjJkirHNCAH/BebbfXtXdLVLxjLWrgIoZ5F9m0VwNIU5xXFbUF5aaFsi0qUNnr+1ztOz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKifjQwupusyRFhelBISVhrtOo/r3bJGYOlLYLiNANs=;
 b=oDw2Q1dUcQuPmxFkROAhwmGUIXOWLslTb2FK8PxCsKKxrk9ND4HcByqY8ZmadUzP3rW31to/WeeWehaPeo/w3O49N/t2nwTvmpdh6f+ETKCkClbbGNGZOSUVS7vqFmwCpbXOOI6eCQg1MRA2RQbQcophERDp3RKIDiJniKLv0xDtCD/mAvcXoXPmKN7AOESPoMLdUSjzA3VN31XXFx36T3VzYLD5F22VCXCA/TdpP+Zsnoy6uNnTnD6pn+AhF9BoN6GoljvkNLcM3emJiq5AkT4L6Lql4mAGk1jv6pLgmE7x16HuqfhJoHeLIu7hKOZWCl6R8LUX1V296cv9J7vwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKifjQwupusyRFhelBISVhrtOo/r3bJGYOlLYLiNANs=;
 b=WX5kHLPMUCW3sPvhCW4vVjLhxoT+gjeMfpyMmei1u71nJ30T24iGL7orhmz81OFlsw+Hqk3SLWabBwvQXT3wfWmtF4p/zpkzSZGUOmNPrvabQ/slUZKqR6CislLubBQbpeg5gVhDuKs6YQ2zBc3G1lfn4LYADieyC/uzkLsqFCI=
Date: Tue, 11 Jan 2022 12:41:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian
 Jackson <iwj@xenproject.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 04/12] libx86: introduce helper to fetch msr entry
Message-ID: <Yd1s1p1DNN0doPIs@Air-de-Roger>
References: <20211129153355.60338-1-roger.pau@citrix.com>
 <20211129153355.60338-5-roger.pau@citrix.com>
 <545f5185-9cd0-63cb-3519-470d587e12ea@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <545f5185-9cd0-63cb-3519-470d587e12ea@suse.com>
X-ClientProxiedBy: MR1P264CA0048.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3a8edd7-b0bd-4fc0-530b-08d9d4f74701
X-MS-TrafficTypeDiagnostic: DM5PR03MB3371:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB3371930C424BD2433A96A77E8F519@DM5PR03MB3371.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbeRoAPybdO0r5UcpHojd9kFTlZ6nIgbrcQQH52jxw6Zgh329DIDKL1ZpgMw4eTi59iV99YsbdIfmQl3cmjelTQU99CJldqaikF6i8CIZDY/AiinchEmIgzQWw9RcrXCwuBqgUMZfUHqwVczeMkGQZuSa+njXjkw+XfETS9uQkYl+XlXnJqvewKKqc3f0hUgsWrlXOrWHYBnlYMrkS8tRqmHkUzvtA78idWXEtPPkGDy1Gi2HMikuPfq7DulGFp0ZAubz3ZnHgYSkTL45Q3C30t3N5SvFqZdYEM2CKgXNHD5WjAkVvxb9Ltq3tGxjIz9rPQzn8kW0ZMAZPbbzhMHvezFFbm4h/++jeMVuPKFma7lx8jqwhfuvVMaiTOwbxFUde/1X3AZ7heTL4uu8WGcr0Sd6qGvES3e5482vUxzIyqs7DaWEMrtmBDLGORbvATpO0Qpeq8BJrw4IXNTYXK+hxwWc1CIQzwYL+LW7Oc4KKowLMnE/AiJdYiRMkZX1IvcHQeNVCl4t9GMT2aa1SapwgpdNOJyJC7fXq0euvHjS96Fnj8TFjxywwQ1wkvNYC5dxiCJkAxKa5GYJzLw3QT8NA0eUxmlzZDnxSJr1TzNUwA0B7j4dbKNYyIJsczpqWMxAu3eRZRy5ZNyNcXyQzbfow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(316002)(66946007)(6512007)(53546011)(6506007)(66476007)(9686003)(5660300002)(6916009)(6486002)(66556008)(8936002)(54906003)(186003)(26005)(508600001)(4326008)(83380400001)(8676002)(86362001)(85182001)(82960400001)(38100700002)(2906002)(33716001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDNMWktEQndMVHhDNS94Y29oUThibUtSYSsxVk1saGp5LzFGS2t6QjlzMk1Q?=
 =?utf-8?B?dEhCYlRRTmM5T1g0eHU1UXdkdzNOaDFqb01VcnRxMkliYXoxWGV5djVERC85?=
 =?utf-8?B?UURpYStHa1l6SG1jME5VRkM0N3FmSjNKQjdUTlZsYVZNNFZjd3pQUVE4bi9m?=
 =?utf-8?B?WC9QQWVCSjFpVUZPYzA0aXJFcHczVjJZQ2xuUDRzUncwWmtWaE1xSUtZaWhm?=
 =?utf-8?B?Sm5Bc0hyZXVNMGlrcEdvOVlTQ3J4S2creXB6TkhSdnhENWY4UzBYK3JtWkc3?=
 =?utf-8?B?VGtpem1WTE9rWUxzS0p0bVV6UUNrcUpRTWFDRjJrY2lSTzFlSFB0L1RETGgx?=
 =?utf-8?B?Sk9lWlVhQTI5NTJGODZRVlY1NDEyQlgyTE9nNEt6dEFqRDM4VDk0MnBCMVhN?=
 =?utf-8?B?QmxsME1HZktlQkU2alpoQnpPYU45U215ZWFvNkNXS09hSjdGZDh2L1BXNFdh?=
 =?utf-8?B?SUd6QnFjRjFjd2x2WVhkY1B3eEliZWtlaXhtL3hqemhKcy9UR3ErdHM0VVI1?=
 =?utf-8?B?RDhjSGJ2Wkt2bXEyZW9TeXNZUzA0NTlCMEl6OVREdVJ4RVFWdHJpU0djbW9o?=
 =?utf-8?B?WU1qYnZMVjl3bGxwVHlhNUdXMjU3UFBEQjQvaFZocWNiYUR0MzdGSitrQWc5?=
 =?utf-8?B?WGxXSVAvdUNyOXFPZjI3Z1M1SFRPVmlnRGM2ZVp4NUxPWEJFTDRxby9DT2E4?=
 =?utf-8?B?cHIvQ1RDRUZPQUsrbGdCZ01Rcy83OXZ1SkQ5N0ZwUjczVFhVY1JpeWEyMTFC?=
 =?utf-8?B?ajllZXpGc0s4aTBIRHNhakExajhVSGJmVnNVdWFSckx1ZWoxQ21lRUhFNW9w?=
 =?utf-8?B?M3IrTWVhRU9YeSthQU91MUdOeFBVMlZsYklCZkg2ZXZJOGNhRTlCdFBQS2R6?=
 =?utf-8?B?cVkwY0FrckRrbDFROEpzOHBCcklPZVhFVy9HemcwazExQVBIdVpJb1RJU3Z1?=
 =?utf-8?B?LzI1cUtIUkpyYWFYNmd3cWdva1FjOVcrc3NleHJJenpnNXV2dUEzTVBNek5V?=
 =?utf-8?B?THV0clRlcmY4UTk2dFhpWUlhQjV6UU1zczVwRkxLdTB5bHZvNlBBVm5UallL?=
 =?utf-8?B?TWFGS0wvanprd21HYVBKbXpMUVYzTVdoL01EM0VZaEgzaVBBRk5Nd2syVm9a?=
 =?utf-8?B?WUtQeVJhaVk3RHdqZEpZSlludU83K0NrblJjL0Fnam16QlVJK01JU1U1cmd4?=
 =?utf-8?B?eEhoYUN0a1dLSitJWnBmWE9iNURwMVF0eFdVdzdKK3JOa0w1cThLNm1kU1d4?=
 =?utf-8?B?Q1RlM2JzZmVOWUNiVWxhb0gyNzF1aU1FTksvWWpZWDhKMHhIS1ZER3YrdjNk?=
 =?utf-8?B?SG9nWWYra29DRWpkTXpVbFdPRWVHWU0wQ2hyRE14TVk4dDFNTWVzc3NSc1Ni?=
 =?utf-8?B?b0xuUWR0bUVnVGRmUGxUOWxkQVFjSktCQ05SemNZTHQwM3U0QWhrYzBxbVhN?=
 =?utf-8?B?dGpDYkFjVFhzbFFmRWpnVlc4KzNCQWU2MTUyMmd0VU95b05qYTM2U2Zuekkz?=
 =?utf-8?B?ZkhiTkd1VnB5WmxHRDBwcUtkdC8weHZ1UHZKR2xhVFd1dUJldEs3aEMxc0J4?=
 =?utf-8?B?QjZEVDh4MFdBek16eWNONjB1K2ZDZkRveFBlMEhzUzRJQlpMTWhLY1JTbk5t?=
 =?utf-8?B?aDFDU08wUmFZZGZKbGd6ZHBRVlBWWm1OWTRxSVZWTVd3K0I1eE9ORkZ3RzFj?=
 =?utf-8?B?TWFjMzVTdHpSNzEwU3c5Y0lUWTFxK2g0YW9ZdXdUa2szelZVVWU4WXFFMGwx?=
 =?utf-8?B?K05pVjVWaXF6bmtlUTdETXdHWHo1QzlNallZQjVhTUFHVW1hSmp3bFZiTmtm?=
 =?utf-8?B?akJ6NG5TMS9nQTAxUWdCa0VJeHV0R0UzN2FiSnZuaEJMM0IraXhISGlNbDhL?=
 =?utf-8?B?aVVjTEE2emFBZ2ovSFZmUmFFTWliSXNaVzBFYkIrdWJ4SlZBSGhYbXdROGdv?=
 =?utf-8?B?amRxNFNwMzdQT05WRkVIVVZqeUMwTXpMbFV2Zk40MnMrbnowT3ptUVdndmto?=
 =?utf-8?B?OGI5VXd5aDNySDNybVN6ZUdjRE9wdURGd0hNV0I5VTZBTlgwR3FISUhwMlNN?=
 =?utf-8?B?Zzc5L0t4Tk5oWkNqdU03R2pFRkdUZFdSOWYyMVFmZm5SYmdpeHhNTVU2NHJQ?=
 =?utf-8?B?OGFGSndYVUNDdVB6L2cvOERhVDhDZVNZbVRFaCtJM0E2c3VYRjczaXVSSHNw?=
 =?utf-8?Q?M6Matv0sKkr68uak/oP92uw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a8edd7-b0bd-4fc0-530b-08d9d4f74701
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 11:41:16.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtDnBz0RwEcLoUEBb87SjGzHQ2w+R8o6v40NRrTo8wkmRpDQFrOTQsqpTj8I3iLSngmvdHc4s7hiyM845agwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3371
X-OriginatorOrg: citrix.com

On Mon, Dec 06, 2021 at 03:34:18PM +0100, Jan Beulich wrote:
> On 29.11.2021 16:33, Roger Pau Monne wrote:
> > --- a/tools/tests/cpu-policy/test-cpu-policy.c
> > +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> > @@ -386,16 +386,6 @@ static void test_msr_deserialise_failure(void)
> >              .msr = { .idx = 0xce, .flags = 1 },
> >              .rc = -EINVAL,
> >          },
> > -        {
> > -            .name = "truncated val",
> > -            .msr = { .idx = 0xce, .val = ~0ull },
> > -            .rc = -EOVERFLOW,
> > -        },
> > -        {
> > -            .name = "truncated val",
> > -            .msr = { .idx = 0x10a, .val = ~0ull },
> > -            .rc = -EOVERFLOW,
> > -        },
> >      };
> 
> Why is this removal necessary? I don't think any of the additions further
> down actually replaces these.

There are no longer overflow errors, since the field in msr_policy for
both MSRs is now 64bits after this change. I've tried to explain this
in the commit message:

"Note this requires making the raw fields uint64_t so that it can
accommodate the maximum size of MSRs values, and in turn removing the
truncation tests."

Thanks, Roger.

