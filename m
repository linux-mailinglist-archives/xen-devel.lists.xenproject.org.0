Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE84B244E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270392.464667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIU7g-00033y-6t; Fri, 11 Feb 2022 11:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270392.464667; Fri, 11 Feb 2022 11:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIU7g-00031a-3D; Fri, 11 Feb 2022 11:29:56 +0000
Received: by outflank-mailman (input) for mailman id 270392;
 Fri, 11 Feb 2022 11:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIU7e-00031U-8a
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:29:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece52a88-8b2d-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:29:52 +0100 (CET)
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
X-Inumbo-ID: ece52a88-8b2d-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644578991;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9Qya4+/+BU1VQdN6RKeLt6CqIvd7S4iXX6Uw6kt8PwU=;
  b=VqJfYUsfJqxwWWG4ogWu9NfJFP5hrjeWWtRGdl9xPmEBAq3yMvYHFXUw
   idjJh0fHjJ4VHZraLTHl6lmTdbdntO80/3ONMVrc/tauFCPYA7ROEPwr1
   B5LQz7Tg3lUCZaUKOYPVR3smjw9l52xixGtsT7zBBnOjlgDcgyOLHkivO
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: b8Xb08VznzKQ8NUkrPcSD9RQPyMagYaF9a7pK190uQDDe3wIxewPjYUr7IceTutxjwm6t19ttu
 D/rNncGK/bPCPQsNnR3z69wJY661YfgATKlcETW6j9ujQURVNNHbr5imsz9k2t8YfJDOQ/Awc0
 ONNwAHeOOMBAzkgQ442cDcCPwK7IadcFy3lIICR+r0qCe4Bl07ZWjtxXYsoDfqM3AnnQs2jAsO
 1ZKPYZtMUNIfCl4xj3gU24PNGKdKZ7wysNfj8LW7Xk4KZ3oNsjxDPw26rn+3Wy2R1+ZDaAzy8I
 8/431gnQhft3VwGczf7C8D03
X-SBRS: 5.1
X-MesageID: 64007852
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GwWIVKj92PncSmYSC5WfySqiX161ERYKZh0ujC45NGQN5FlHY01je
 htvCz+OafmCZzTwedl1a47g9hhSu5fWyN9kHgFtqikzFyMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1oic2rEgV4fZfXs/VaDhtxSShuLI1/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u2pgWQqaDP
 aL1bxIxNDTBPjtVZ24RM6ARn6SJjUPPTxhX/Qf9Sa0fvDGIkV0ZPKLWGOTSftuGVMBEhHGyr
 2jN/3n6KhwCPdnZwj2Amlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUcWEGnu/C/hgi7UshGN
 k0P0iM0qO4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLW/gDfAGEHRzxAbdUOtckqSDhs3
 ViM9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIM5gw/LT91jOLWoldCzEjb1q
 xiVqAAuirNVitQEv4254FTGjjSEtpXPCAkv6W3/XG2/6RhiTJW4fIHu4l/ehcusN67AEAPH5
 iJd3ZHDsqZeVvlhiRBhXs0oIOCyvPTUcwfHqk8oQpsIrT296l6aKNU4DC5FGG9lNcMNeDnMa
 UDVuB9M6JI7AEZGfZObcKrqVZ10kPGI+cDNE6mNM4EQOsQZmBqvoXk2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwZ50n/uVZ9TCTMIVvgDLdoRrpohE9jiF+Lm
 +uzz+PQl31ivBTWO0E7C7I7I1EQNmQcDpvrscFRfePrClM4RD18UaKOnul8ItQNc0FpegHgp
 CDVtqhwkgSXuJE6AV/SNiALhE3HAf6TUk7XzQRzZA31ihDPkK6k7bsFdotfQFXU3LcL8BKAd
 NFcI5/oKq0WElzvom1BBbGg/N0KXEn63mqmYnv6CAXTirY9HmQlDPe/JVCxnMTPZwLq3fYDT
 0qIiF+FH8pZGlgK4QS/QKvH8m5ddEM1wYpad0DJPsNSaAPr9o1rIDb2lfg5P4cHLhCr+9dQ/
 1/+7c4wqbafrokr3sPOgKzY/Y6lH/EnRhhRHnXB7KbwPi7fpzLxzYhFWeeOXDbcSGKrp/nyO
 bQLl6nxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+Co4EIObiANM7/PkQWIQ4pMraK2f0Ow2GA5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lXm2BQwM9uAgiRFzEi2LyQNA/c9q5UXII73kQ53mFtMVoPRV33t65aVZtQSbkRze
 m2IhLDPjqh3z1bZdyZhDmDE2OdQiMhcuB1Oy1NedV2FlsCc260y1RxVtz82Uh5U3lNM1OcqY
 jpnMEh8JKOv+TZ0hZccAzDwSl8ZXBDJqFbsz1YplXHCSxj6X2PAG2QxJOKR8R1L6GlbZDVao
 OmVxWuNvewGpy0tMv/egXJYlsE=
IronPort-HdrOrdr: A9a23:FqaZaqu5VaK8xQK0KmduRR2b7skDEdV00zEX/kB9WHVpm62j+/
 xG885w6faZslYssRIb9uxoWpPwIk80nKQdieJ9AV7IZmfbUQWTTb2KKbGSoQHdJw==
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="64007852"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIT4GEGIJEEkxj+CXDezhcRqE6C1ARJIVLVGJJ4A8EEKPKqG9lTvmt+YGxozuKTBRKSEPmyhuDLjvgRJDPdroJxuvuepe6t8b5689/y/YhR3tstkMqjVKALp90KDv7uf7xqVShRgOIyptDNjYY2t8bq7EIeV9RecEQjjjs7CAk583NM4tId6sISww7H4tXNP2Ab86V7R7KThuETS73B+Gxe/1t0KpBPzAy+OauD9KWOCU3rj1GFPXpby1kfcQpUY+hfLIa5Ku73lygl+qKWeXuM1CIPgpn1MyEP6Hp6+sJxE5i6uazpW2MvJ23i1gIvEZd5ZPeNo1C84xkbYv3JgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12gU3dD6aF/I0hChB/+yNcF8B+IPZx/hIu8NtiCGK/k=;
 b=Y+xbpkQyYkOMOfEX5PUVWxFO6FJX3zjwDuZ/j9Y9KeN6wV9XrETpAfoQ1e71Jux3FyYQ5a8Y9ISizRdbwX8xP3v11DjcAkUuD62GgqycyrZrOp06e5sS0gFDhQAPV8LlExWXLAEFwcapmU3loYystrweK9xbdNqJ2tdm687ofT/YjRb3hgiQBQhnxuq6hWzkf/Z4JJEb5glSKtzskzmxkkKfZhJJfwHcX//xa8+9wqrtkNjMXu1CE9VDiooNTn/JhMHby1AByPRAGG817baXdnTWo6OT0nTxKJ/LOv4ZjnBR0DpnYiZ/x728EjAr0XR2MGSZqLOGhjOVu1EHqXC9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12gU3dD6aF/I0hChB/+yNcF8B+IPZx/hIu8NtiCGK/k=;
 b=og2iYj586XeN07S0R2GfCe/9Ahf9VozTsUs2cv9JhN2CdJp0foQTZeXfJ5eE+yCtBGlXIojUszF5lEVW6Un95T5LBCGLVVy2dJr7SKkDKwvntE3WWWdIzgC268cGnjbfyqfQO6s7/q0K7gUsbohmki2Kc/5nGT8y9lwnJh3gphM=
Date: Fri, 11 Feb 2022 12:29:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YgZIo9VQktcqGHTD@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e35cc484-7d6e-451d-c215-08d9ed51cd7e
X-MS-TrafficTypeDiagnostic: DM5PR03MB2908:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB2908EE0352F7500CEB7A0A628F309@DM5PR03MB2908.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLO6VbJQYG6ampgHp5sWNoGkz2sxvLIXOFbKyA0NUOR6pGiwaz8z/ue8Xc5OXbQVp9GMsggod4fMhFdgR5lta/BNVXV/ROCAyAR1hfO8cKO2z7yq9lzfLxbfSjmlioA6o9M1RS3u7LKYTZFza1tLTNpIJHYnxknuv+Tw/zPgWrWJdGQfYTed7M2NiYaiXz9bDE3sDhs8I1e3ChnhNL7NrBykZ3QDPwfadDJM5BTcU9gAS2ElggzR0KphPIBDwaTxi5qUw1Ef+cgnh19PBsorkuyhxNWVChjet6oag1kV4y2fW50V7mpM5ZQDsMj9SifRYmiAvuj1CGSe+HTVvQ12uUVBjYTlolERQC8iZZ54ME0HCOK+8RDxTVn8ipbjsI2ch1fBikizuiKrpCXwDIy0YtVNt71evSjhWOwKWUTRaasCuF+M5Yy+XZ4I6OtWz66uwqxtS46lI76XFU1yBsM7IS+NI/HsPwY9201w0P198oqykDKMK8CDjuxiQLZtKIsE7bv1+zcIAV0q1Lgs+t1D8JgUpUdp3pDeKwNkZWk3XJkG5yVfHzIQoOf5d+WGEOEsOVvJrzo+4TKP6nVHlptUsEALSQAprKdvcHBjCkvjDc/77I13njTuM58TamYc+WLX5+5gz+AMzDZWaWlXrSRa2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(8676002)(26005)(186003)(83380400001)(9686003)(6512007)(6666004)(4326008)(8936002)(6506007)(66476007)(66556008)(66946007)(86362001)(5660300002)(53546011)(38100700002)(54906003)(508600001)(7416002)(110136005)(6486002)(82960400001)(316002)(6636002)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEVZLzExS21wVTFlS1pjMDVUamNWQ2F3NzFCK3pkVEpnbjRLNVdOYmMvRzN5?=
 =?utf-8?B?dWUrbTFmTU9CVktQK2JkejByKzd3WE4xWUZwTHUzUXdzd0RGUnFtR2E0SFIy?=
 =?utf-8?B?aXplMHhYV2p3N2R2Z2h3K2x6QngvR2pocEJub0lVZmk5VmthOUdVUjBqcnNw?=
 =?utf-8?B?b0NKbVZRelFoZXF1ckNhZzdOSjlZakdXSUxjcEVKQ3lWL1M1cTdMRjJrMTJR?=
 =?utf-8?B?K1RFYVdwRnpjZGQ2bURTaVpMa3dxR0N4bnhzQzNRaXdRbWNIZHNRS3hTY29q?=
 =?utf-8?B?ZDVVTkpHSlNSQURDL1VDV09HaG5PMXM2eVpSWlhZUXdkUEhTRGFkam1mY2pm?=
 =?utf-8?B?eUZSNlBIMm13SmJVdUN2blFjTlB2dEdSeWFicUlwTTZEZi9WSmJaVFhkdlQ1?=
 =?utf-8?B?dkJGU0ZvK0FWL1pXWCs4VjV0UURhakNtNjRvN3psZXRhbHRrekJhRTZoTnQ3?=
 =?utf-8?B?QnBPNEFJcG9sdGE5WjVNS2kzdUhNdkhMcm5LVG1ndWYzNWxaaFRzdWUxT1N6?=
 =?utf-8?B?YkF2a09TNHlvNWx2RHdaZ0tYQVJrMjFYOHVNem1XRUorQXB3WXRySUUvVUZY?=
 =?utf-8?B?eVEzT3BDYUNtWjRVWkE2eEZLL2F4M0VDamdVMFFpczlyWk5lb1BOSXEzQVR6?=
 =?utf-8?B?RVZ1VXl1THhZV3d4TVlRR3lURExDaFpvQ1R3Uzc4bzJOQ0o3bURsOWUzV0ph?=
 =?utf-8?B?VVJzaDZRVjFRODE0YUEwaU9Uc2M2T0ZaU1NWemowTlhCMnpQa3lPZDFrbnhl?=
 =?utf-8?B?RXY3UzAvRFBLcHBzTUMyakRQTU1Kdnc1NTNDeDJxc1hZc3owMHZFWVY4QVRt?=
 =?utf-8?B?T2phZWtpRHFpTGlRRE1zdjg5UE1iVEQ2TmthSDRZZmVxL2hmM1NDQ01PSE5p?=
 =?utf-8?B?WFBicVNpZCt2USttVm03NnZiNkhhUkUyRlJZOVpqU0dXeVJMTVZhTVZVOVd2?=
 =?utf-8?B?ZHN5Sm5kY2RrbmR3U2VLZVdJZVRrV0E1WVo3RlJKeXk0dG1hOUs2aHRiTHUx?=
 =?utf-8?B?YUU1dFdKNy9qeFRRNUdZRmNZK2xyWnh3RERVQjN6ZC9kQ25xaUN1Nll1MDNG?=
 =?utf-8?B?WGlpQ3U2eHhmZmZodzlmd0RUS0hlY1dxdkFFUk8wTVhtYzdBdVFHWU9GMXRP?=
 =?utf-8?B?cXVwM0dCNDFxYTQyUmNaajJHUlFGUUVlcVExbGorclVvZjg3bjQrMzRWUmNJ?=
 =?utf-8?B?cWUweFBzYmYxa25kNTJ2dlBFempzSkozZnJVdlRMQWxoWVcvdXc3N2ZIQnRq?=
 =?utf-8?B?cU1pSkNJb0dERFFiWjEwT3k5UXNhc28vVzI3bVZJNUpKbjdrai9vSEZGSEIz?=
 =?utf-8?B?MCtkQ1VkTEtqUldvcUFlK2NrWnNaVUxBMjQwOTdnUFArRHVTUm54QzlHdSt3?=
 =?utf-8?B?Q1lNSWFvQkdrU2VpYml0aUNEc0dWazVPSWpxQTVkWTFtbk9sQzBOb3NocnBr?=
 =?utf-8?B?SlY4SERiYTlIOGtteDdWUndPNmNGL3cxVjRjTktoT0pzWTd1U2VSWXU2a1Ba?=
 =?utf-8?B?V1BaSm5zbGRueUhFNkpYYndPV25JUmpHTlpydHd4R1RITXl3ZEFvTDY1WStM?=
 =?utf-8?B?S2tvVlZMa2hLRThnbldicWVuMUZGUjc5OVRnTmw2Y0VDYlJCZCtmYmN5Ky9n?=
 =?utf-8?B?M2d5bUZqeEtCRjlEbkxKd0t6Y1BDNDZTWWY2ajJwazRnemNrZStWTGdHUHJz?=
 =?utf-8?B?bnJpdjFXMlVsRDZaYnFaNHlsRENPTzZ2dlZ2cHRZVkZ0bi9JMFNiSVUzKzhK?=
 =?utf-8?B?cHN3TFZ6dUIvQ3hUY0VPZzFDT09mb0VSR1NYOE9WbVN3aXp3OEJtWDFpTTNt?=
 =?utf-8?B?Q0RoMTZRT0JZNUlySDdwdUI5Q3h2aWtKeGZBYTRBL3FKRUd2QVd1SlZNVzBJ?=
 =?utf-8?B?dWZUaXdwbUpabGJ5Q2syRUIrRUV4MFRROG9LQkd6anBjVjBYRkgzY3RFYnZy?=
 =?utf-8?B?aW5uRG5sVFVsQy9RdDNINmZyK2RHTS9hWFI4SFNkckl4QkRCMVRKWTNiNlJM?=
 =?utf-8?B?aWdBd0FKMU1IazUva25zWGo5TVkvdHpvTHh0dllMRTF1cG5ZbExVc012OWVE?=
 =?utf-8?B?ZWpObFRaN2RQWnJuWFAxOUxlRHpoRFl6cUFDNDJ4RlVrcFBYbllIc0JBWXIr?=
 =?utf-8?B?V3NUMjArU2FPWDZiSm8wQ2txSDdNaW9VYTI0c0ZWTm9WeVNRSG54VXhaS1ZQ?=
 =?utf-8?Q?qbGnMuvE9MA7znZi959ifI0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e35cc484-7d6e-451d-c215-08d9ed51cd7e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:29:44.6968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPSpEFyHbQfkjR2H2s0JR1FTTiuRQQcd66k+IWoNQD8a0UIhnp7BgOKP8Z/FRRjNYGOEHimfA3vCLxSV0vdmEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2908
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
> On 10/02/2022 10:03, Roger Pau Monné wrote:
> > On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
> >> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> >> index 7ab15e07a0..4060aef1bd 100644
> >> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
> >>               MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
> >>       }
> >>   
> >> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> >> +    if ( bsp )
> >> +    {
> >> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> >> +        assisted_x2apic_available = (cpu_has_vmx_apic_reg_virt ||
> >> +                                     cpu_has_vmx_virtual_intr_delivery) &&
> >> +                                    cpu_has_vmx_virtualize_x2apic_mode;
> > 
> > I've been think about this, and it seems kind of asymmetric that for
> > xAPIC mode we report hw assisted support only with
> > virtualize_apic_accesses available, while for x2APIC we require
> > virtualize_x2apic_mode plus either apic_reg_virt or
> > virtual_intr_delivery.
> > 
> > I think we likely need to be more consistent here, and report hw
> > assisted x2APIC support as long as virtualize_x2apic_mode is
> > available.
> > 
> > This will likely have some effect on patch 2 also, as you will have to
> > adjust vmx_vlapic_msr_changed.
> > 
> > Thanks, Roger.
> 
> Any other thoughts on this? As on one hand it is asymmetric but also 
> there isn't much assistance with only virtualize_x2apic_mode set as, in 
> this case, a VM exit will be avoided only when trying to access the TPR 
> register.

I've been thinking about this, and reporting hardware assisted
x{2}APIC virtualization with just
SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. While
those provide some assistance to the VMM in order to handle APIC
accesses, it will still require a trap into the hypervisor to handle
most of the accesses.

So maybe we should only report hardware assisted support when the
mentioned features are present together with
SECONDARY_EXEC_APIC_REGISTER_VIRT?

Thanks, Roger.

