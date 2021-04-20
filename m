Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819B365EB8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 19:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113961.217103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYuJr-00060R-Mi; Tue, 20 Apr 2021 17:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113961.217103; Tue, 20 Apr 2021 17:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYuJr-000602-JG; Tue, 20 Apr 2021 17:37:51 +0000
Received: by outflank-mailman (input) for mailman id 113961;
 Tue, 20 Apr 2021 17:37:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NaoY=JR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYuJp-0005zx-Dp
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 17:37:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fac79dd-5ad5-44fd-9ebf-7701117f32ed;
 Tue, 20 Apr 2021 17:37:48 +0000 (UTC)
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
X-Inumbo-ID: 4fac79dd-5ad5-44fd-9ebf-7701117f32ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618940267;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+xGlr9fhgmV3YVMsKJcABd8Y6hxgCGA2j3NzGmk4yME=;
  b=WLKiS2GwHxZZ9Hx+5dVFvbPEgU00nFSzxqJKLAczObVgdC4e/K0Wab1B
   eJn1fM2edPoaoVSX2i9SHZPR9iaxxU3Q5AxIpn55iOoKpuJe+CNlUBOW7
   +leWvtkAjvjLObnV7HLtAcpEyMiW+tKUkf2KTGLTt6m9RYj5rt5jJPdq7
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: x02FWENlHvPI90q23sdRAuh3xUD05d7L4yCjx861RpWDWTddRjAygVblpvnILEl0JtbqxSdyam
 xozi6cJUnW4q+w+8PgfmNVknzCNwvO7mnV6OT4ZD5/T3oFrEcwlyLqHW7yffC0aqU/7z7rtH/k
 i4slrhbbwL3EyiMOoT6Ad8w6e6707J97JEKxdmZVWsSkxPmJipmqdn0+3NkduxB+VEwDUeIdRB
 g0JsV5KyE1fBCthO0vX1DA0pUkw4s9NaiBrXrcsJZo9//tL9Eazj9hXGxtALKkmBlo+xzlQ1F9
 D6A=
X-SBRS: 5.2
X-MesageID: 41843039
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PtO4+a4Dcuk23u3OqQPXwWeEI+orLtY04lQ7vn1ZYSd+NuSFis
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
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41843039"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQgjukxN33yyisTDnrq1el5Q9j3iZOPx3FB35kTEPBPdPEviv15ivfGWCdLEXQ6HXPuvSybwUWPE4KwCphU3fETXq29vL58xUNL3NtvfSB8tmWbziODsO6IeJTU+5nPzZG5Sctmu/a11IYsr6SkFyFYbe0+upCnS7JX6IZ2zhPJ4vfuZvGhOnEdggTh5KtNCESaTS4FMt01U7hH3tr0aRHpXRicUCGnkcaKNnWatlkVK2zK3NOsbSJL+fIFRUCS/qRyKSNoxI6NUdVEgpya2r5atkzmTad9Zm+ox4pD3EOWSTtAsdGpmaew/QVCihinumK1jkS7UT4xdDFVkh+mVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xGlr9fhgmV3YVMsKJcABd8Y6hxgCGA2j3NzGmk4yME=;
 b=Ma/k6RbzEljwwnIzuM/ekS1hBoa7VR8QmWWFT4Kseliy96g7XSLmpyPso0/bOCW00KtOMEkmbiBUkeeD4IPXrGrjf04zHmxeDI/QQlNlnmI0XGYcDrI8ExB2ZzsNkB2D+2ggPLEAW+BZ/WZW2JaWjACVnhr51CnJ6FEYRz1fO8FAyHroBK1VQm81Zc+KGIROV1s1qvB+qqJt5q+GhmDB7kqdcCI+gJJ5MESieSdMM6RHnGpkdILfL0fokpYCUdChGXk7L1Me/FP2veN4ID6QqrluYmbLTPdH67wSChLNn4tugbY3HWxipUSMluT00Om7hrUonL7ptuOsJU0uBIANZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xGlr9fhgmV3YVMsKJcABd8Y6hxgCGA2j3NzGmk4yME=;
 b=B+nuf+5fIl2hyYCB+abzYqQZ+HCyYFBwTh5TRTc65zhLgBng7ACB6AhXNrSTUoegWM8psg102Tp996Ia/zHIx0xIRG2Z2wECj1G/56UGdh6LYFD1WE5tT1HK+i91Ilibd6A6wj3gXaySLFsegHwd2CT/qN9e72rXGFYXFbc9H2M=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210419144524.32608-1-andrew.cooper3@citrix.com>
 <a048d155-085d-b942-40cc-00624b5bbd11@suse.com>
 <faff3047-66e3-0d6f-1878-e1dac47b7c06@citrix.com>
 <398b912d-d19f-8321-815a-362c6da6d70d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shim: Simplify compat handling in write_start_info()
Message-ID: <7f95560f-6417-ab03-4719-eba99152713d@citrix.com>
Date: Tue, 20 Apr 2021 18:37:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <398b912d-d19f-8321-815a-362c6da6d70d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65ea45ef-77b6-41d1-8b2a-08d90423003e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB38622D710E38AC684845AA4EBA489@BYAPR03MB3862.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7dgQhMWXtNkwEzd+jIxjyPHhz5L2AuivsC8WW4iqCzlazduQ5RoxlpKYhDEO3AoioAI8UtBA3QndEfzX+AD/dGqkTjRzwaFBEt6ZilLkWlhDfUnazA+WogMBQY61VhS64mlARhnPcwAOWDPN1L/Nc5/+1+j9LkSLgMczM61RE0IISQ/FJbUOKWoplsF6mfAPO2Nftii4+svEsvBgeWJNi30eVLOINddO6Il2JjFsZ20RxK5egYR/NolrkI4/IkimTmkWYEgJAD17bemQOQAV03X+Nvq3+V/otv1R936gl6/nRy/NdaZz/dg3IiUZuoYTZtrABITGZ+D8FFgEfMlnPwpAFgCIuD4dUQu1B3ewAfUyvZlc2KzJ9gkjcgiCKIEvTPOHrlZbfL1syxKaVZKrrKR3vNZmna6Ibk+Qqqt77ozw3/F5+KjRqxjGvjxEMc/yGgvL579cn33iRzDv/HApN9Uh8F4OVEmXw97lPRVypGnsI92rAg3R2AlzIFb9R2e8yIug6miX9hsrGlAHrAd4X9FnBtBmgNiXa2Q+4wIYpCb2FcsYOodCkdPlIow0Gx1v1VgwGU6GukK6WfRAyjPAEa1o6P5aTvE+exom9Z8IjZq66PUqrGrQyl95o6ZdUpxrEyeeC46SEMy59MuCAbTgP48DxlSOYPBwiT6EgfWjC1RKsOnOrniYZJEC8zYfRrz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(54906003)(66476007)(66556008)(66946007)(6666004)(8676002)(478600001)(956004)(2616005)(16526019)(8936002)(316002)(5660300002)(53546011)(31686004)(16576012)(36756003)(31696002)(6916009)(4326008)(6486002)(2906002)(26005)(186003)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S0ZoRmoxeGJsWXV4ZmhBTTF2MlBDM3JpTnhXTjhYbW9rQUxKV21XbEV5QUhT?=
 =?utf-8?B?NzJQOXJsS3lsdi9XVWkrUk4ranp5MHFRZEUzbWNubWJGckxZejFWTHZMMkxj?=
 =?utf-8?B?M0FMWlhMSmE0eEJ6MVhMS3BTTGNJWEZkSFI5WjIvK3FQL0ZDQ2JrdTFrM1ZC?=
 =?utf-8?B?bzhqR3ZCdnRuTmJON0ZwcEtOeXQ2ZmEwc2o2Y0JVNnlDclduMVhBUWh5VEhu?=
 =?utf-8?B?UGZ2Mm9pbTRkVEppQm1EbjNGNUkrdVpoMjl4SDk0UlNVL0RBN05kRk4yekhE?=
 =?utf-8?B?Z2pVZUNYYURkVzB0ajcvWWMvQXgxbDdVcTk2ODBwOUZieGpiNE5tVlR3SFlo?=
 =?utf-8?B?TXFZdnQyNE9wRVhoa1o2VHF3V0pralppOGpYN2xJS0IxY2xBdlQrSkxzNVB5?=
 =?utf-8?B?NWRJN0JQdzYvWDVjS08rSzM0aitNWjhmL3lKNlpObTcyc1lHUGQ5Y0tYd2tm?=
 =?utf-8?B?MlFiZGl3MjRPSVpnN2V4OEl0b0N5RFFKa00rR2RMakt3TlcxdTNleWxGUHdI?=
 =?utf-8?B?NWRMem5EMlZtdkVKVDQyYjk1bGhqTmVFQzVQN2dTMjBWZzQ2WUlCTjU2a1dt?=
 =?utf-8?B?cnF3Yy9qZ0ZPaVN5RzJoc0RTTzEzaUxubTdvNlF1MzVqbWpTdWRQWHJ1MTd5?=
 =?utf-8?B?eWczTlNUTDlZNFZiVjlzcDFKVFNNeXd4SWw4YmtLWEdWb2lCWnFDYjJ3K2RT?=
 =?utf-8?B?UlJoOGVyaUJmeGQ0S2w4SjZnemd4Q2YvRDByZlZMbGE1cmVBUFhjemhXQWRI?=
 =?utf-8?B?NU0zUm5jR3k2ZGlEMGQydnlLRXMvOHFoSlYzU21lSk96UERSYm1tUGhJVW85?=
 =?utf-8?B?ckMwMnl0UDRqbHA3RUh6SWR2K3FTVERiS1p4MkdGTDEva0tMWXBJOHJ1TnV6?=
 =?utf-8?B?UXFSSUx5UW9XM3BDMVdEN0FESjBCLzRnMXZ2dU82ODA5d014UGFST05OMHd0?=
 =?utf-8?B?VTk5eGxYbm1zYWZ1d2lMeWJEekJEQ1JoRFNzVUFNa2wwSDkwMldybU9HbEZn?=
 =?utf-8?B?TjV6NGxIRTU5eEhKK2pWRjdrT3RTRkVTN0NtM05sR0lpbDNBTGwzL1ROVTFV?=
 =?utf-8?B?ajVpZkxVZ2svSGFNclhTR1MycXlMRUVvamZudTdiTHdmWlNpODVIN3BQNzV4?=
 =?utf-8?B?ZUN5WXhTT2Uxa0FpTzhFQjkrT0hSY1p1NFpyNmJUS1kyVEFyc2FqT3Y4bkZJ?=
 =?utf-8?B?WEljZmFaczhPbk9tZys3Tmo5WUdqSHo1YnB3MjVNYmZqVHZRYm9qNk9Lb3Jk?=
 =?utf-8?B?UHQ4cUhtdHk4Q09kUkI1STdOa05aalVON2FFQ2pIVjNwTURzZU13TzlpSDZN?=
 =?utf-8?B?SzcwdnMzZnpFaklRR3A5VlIyWDFmM1hDMVB2aTVCYmY0Szl6aDIwQ3RUc3Bw?=
 =?utf-8?B?SWw5TGt5ZUtQMkZ4Sm5BY2I4cTc4VktXZWgyeGVIbHFFZW5LWUZDVWwwdlIz?=
 =?utf-8?B?ZTMwV08xYUFZaWprU3pIeWlHRW82TmZUQmZIMzVBc2k0N0VwQUNCOUFDQUlD?=
 =?utf-8?B?L0hWTUdTdVhzR28wUjBFUkw2Y2VWdEZNV0hBZi9Xc3p5QnFia3FVdzRWNVdz?=
 =?utf-8?B?RG1wSllBQUZWZFp0Zm9QU2hNQkhCMXRqWmRKeGovZG40aHZlOVJpYlQyL0RM?=
 =?utf-8?B?alIzYUhKUTlXblZPSVBFTVlra3ZrR2JZcHh2RHk2LzhwMkpjMHQ3aFY2dWkx?=
 =?utf-8?B?MWxmSHVXNEpEZUFkNnF2dmhwOHBJUWhUekxDVmdZSjVvZzFLVzNncjgyei9w?=
 =?utf-8?Q?GlHcwu9TEU66q5lkuYfm4cdOi2RukD7HXDP5m7r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ea45ef-77b6-41d1-8b2a-08d90423003e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 17:37:42.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrWcGGHHPSj83H4+KUi6jNgQt5ZZaw/VgTIOamqCSeB4PCXrBHzetMkL9CDlPIRDwFGtymqj3IMf1vQcI/H1ARvCTUGWmAx45+slV/G18jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3862
X-OriginatorOrg: citrix.com

On 19/04/2021 17:00, Jan Beulich wrote:
> On 19.04.2021 17:57, Andrew Cooper wrote:
>> On 19/04/2021 16:55, Jan Beulich wrote:
>>> On 19.04.2021 16:45, Andrew Cooper wrote:
>>>> Factor out a compat boolean to remove the lfence overhead from multipl=
e
>>>> is_pv_32bit_domain() calls.
>>>>
>>>> For a compat guest, the upper 32 bits of rdx are zero, so there is no =
need to
>>>> have any conditional logic at all when mapping the start info page.
>>> Iirc the contents of the upper halves hold unspecified contents after
>>> a switch from compat to 64-bit mode. Therefore only with this part of
>>> the change dropped ...
>> But we're shim, so will never ever mix compat and non-compat guests.
> That's not the point: A compat guest will still cause the CPU to
> transition back and forth between 64-bit and compat modes. It is
> this transitioning which leaves the upper halves of all GPRs in
> undefined state (even if in reality a CPU would likely need to go
> through extra hoops to prevent them from being zero if they were
> written to in compat mode).

Hmm.=C2=A0 That's awkward.

So real behaviour (I've checked with some contacts) is that upper bits
are preserved until the next write to the register, after which the
upper bits are zeroed.

I wonder whether I'll have any luck formally asking AMD and Intel for a
tweak to this effect in the manuals.

~Andrew


