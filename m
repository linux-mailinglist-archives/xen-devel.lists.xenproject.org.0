Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B649B6C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260406.449851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN98-0005FH-Qe; Tue, 25 Jan 2022 14:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260406.449851; Tue, 25 Jan 2022 14:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN98-0005C9-MS; Tue, 25 Jan 2022 14:50:10 +0000
Received: by outflank-mailman (input) for mailman id 260406;
 Tue, 25 Jan 2022 14:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN96-000334-QA
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd83f6db-7ded-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 15:49:27 +0100 (CET)
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
X-Inumbo-ID: fd83f6db-7ded-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=b8gUfnxfMT9jaop10Gl1R/jrvfY+DfW2W+UdEuJu/hM=;
  b=Gw7aE3fmcM4GIBPf6QXJtc/3L1A2/DZX9Vmy2g6csdV/oYClpYL5KWeF
   OWdlsszXDG2IABYUVMZjvFI/ru8FZ81dy7pRCQXy+DFZRmqJ9ZLlE2gUC
   YP8DNRd3JnCFZ0h/6+kvHK6Q8XGF1Rzz8sPqBaFNHADoHg/f4eCrHudFj
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TtqoIkttRPuZ5a0Yl4W8lu8MFtC52jinK4d1Do1ndrzzwl3ljTFPYUxIZwmpP4MsH+6McWbkp6
 dcRNmPiqOB3LBpqzFKwq6rQ4AjB6nhSNp8UspioaDmi0KA8Hpf56b7eysFoLl1cUwINA1hwNyH
 ahENqpCrqci2mTb7iU5NoRVUGTqGbBKFcn03wHXH7r2w1PC6l47YgIdWqeCfWmStMMFetUv+/A
 SnBLfRHu9mSCpGnFoUbZcGuDID5wwm3QhqaWN8SXKUzCe5LtPvDOni0wA3pQBo8f3oOS6+YBXF
 sVo0i6McWMgWsFXUG1kKhodW
X-SBRS: 5.2
X-MesageID: 64880007
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q4Wyeaq1iOy3PCJ4deK/AvB5HXBeBmLpYhIvgKrLsJaIsI4StFCzt
 garIBnXPamIajb9fdp+Oo+09kNVvpLdn9NhS1E9rC4xFX4X8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaKxZAsMJfDlo+EyFBNITnAvBrBN2IaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4STaaGP
 5JGAdZpRATKZTx+O1E8M707xLqWukT1eSVcrF3A8MLb5ECMlVcsgdABKuH9eNOQQt5Otl2Fv
 W+A9GP8ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEA6TxNNTcd7nfQzansgx
 gLYzuj0DhxW5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVc8yR9xLpXZX1oqMBraL9RdF1Oz63dWAAweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuMQLYCr1MvEmMtrZ5yEWIU7IT4iNuhf8NYImX3SMXFXfoHEGibC4gQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eRD+8zK/kuKHcqT503+idK2PSfJIZ9YbgfmRr1nvcus/VWEm
 /4CZpDi40gOD4XDjtz/rNR7waYidyZrXPgbaqV/K4a+H+aRMDhxUqCKmeJ4JdUNcmY8vr6gw
 0xRk3RwkTLXrXbGNR+LejZkbrbuVox4tnU1IWonOlPA5pTpSd3HAH43e8RlcL852vZkyPIoH
 fAJd9/ZWqZESyjd+iRbZp749dQweBOujAOIHiykfDlgIMIwG12XoofpLln16S0DLiurrs9i8
 beu4RzWHMgYTAN4AceINP/2lwGtvWIQkf5ZVlfTJoUBY13l9YVncnSjjvI+L8wWBw/Ewz+Wi
 1SfDRsC/LGfqI4p6tjZw6uDqt7xQed5G0NbGUjd7Kq3anaGrjbyn9cYXb/RLz7HVW7y9KGzX
 slvzqnxYK8dgVJHk4tgCLI3n6gw0MTi+u1BxQN+EXSVM1nyUuF8ImOL1NVkv7FWwuMLohO/X
 0+C94UIObiNP8+5QlcdKBB8M7aG3PAQ3DLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNGuRaijhcKM8qdinEG/muBGXUMTqE7u8xIG4TskAcqlglPbJG05vUaO31ThwGg6nUXH
 wI=
IronPort-HdrOrdr: A9a23:Rc8Sdq9Cm4KwovIabf9uk+FAdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qBTnhOJICOgqTMqftWzd1ldAQ7sSi7cKrweQeREWs9Qtrp
 uIEJIOeeEYb2IK9PoSiTPQe71LoKjlzEnrv5al854Ed3AVV0gK1XYfNu/0KDwSeOEQbqBJa6
 Z0q/A37AaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uHg9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9gwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgnf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQy/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKp7zPKN
 MeTP002cwmMm9zNxvizytSKZ2XLzgO9y69Mwk/Upf/6UkSoJh7p3Fos/D30E1wsK7VcKM0lN
 gsBJ4Y4I2mfvVmHZ6VO91xM/dfcla9OS4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="64880007"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eekxc+HW1UDGs70oPp3o71pMTQ2NwtI1P1znXComzjMifa4CvnNS6//RFAnGQ7Ok1vdDFDwHmdJ8zuvqaN1TxqdUHpWklo9Tb4hMAiDW16zO1G6BYI8FL1/G+UIneUOJ5S0sQxLDrNi1N5M5FXd1rmCQ1qzWdoBT7WnpISOjZQwrJST4hLNdsaShM3Tv5kZp6BAhiwI68IaRNYeCFN0nFR5mHIjpwcUgA3W4dQK7ykB+olsKWblkSIi9UixH1ud91b4jc205qHIMSaEtRdz3rQrekl9FjOH33JGigwrrthxBlcSelWAVFJJHzaOYmC41+k24gNRhgsPwNn8AhnuKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UP6F+DQsCKngxfuXZykNG42jx0HaHpJ8RyucFFd0lY=;
 b=hOlJhNxhktgA02qQ+OcSFHhb80vQ+zpPPkGdr7ad9ZFrzk0dBxapFGhDNTP0iQEjT55SQ7eWYFQ4gi2M08W9qMloHfrm3T5cNkahAuKXVotSBneSxlMB+jRt/KPMZZTNZrdI6MWc733OX80y7+haHnvUk+RFYBXbnqoJQuPZKd7HL6WbijeneedNJcU7bjPYvPVtm9kG/4XL+jQ1C/2ssUQcnFmpFbgtsOyCKGmcsaUEaaesJUC5I/lJR9aLtJOLVS6jja6m3Kiars+RpcFBZSsRdj9jgY8NF3lf852/ur3ZWMY+LFbP2aq5xN+ltNdExJqX67s2F6LI4yX9siIwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UP6F+DQsCKngxfuXZykNG42jx0HaHpJ8RyucFFd0lY=;
 b=ibTj5S9vS33CGpUQpmzVmsun79JfvLbkrSjlZG/KxlP87ivLESStgWK4JyPmnZ4oK0LpUKcfP+bciXwbwZk37fC1iaYlw0aV4D69Sxu2HCQJy5e/ByY2k0akhD7fpsLhZxFGwlT/xdIEMpoU5Sqav4sZkbdUz2lVJJYkx7I4BUc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v7 04/11] libs/guest: allow fetching a specific MSR entry from a cpu policy
Date: Tue, 25 Jan 2022 15:49:28 +0100
Message-ID: <20220125144935.44394-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54fac90c-7dc9-428a-0416-08d9e011f85d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568D6A3658D03364392C1A88F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T/64cUynr0F6G3dt/MDY8gY2tTl2fqFoMCoAZG9tj5qdXJO14SuKIpZePkLtbO07hUXsExc+FGTv0rPFDuYjkSbBFJUXkKUABGa7NWr49eQHA4+TSMeP5lY1512ukafdniR28wYlzhRuPC5ewRHpJfdhxxP6Y5K0bUuuZQuUxBni3yNddfO7ESvkxO4cJlgamoLvFqLKY2qrpW1uMe8IVgeWxG9zFszjmatA5PW3xEiBMXAMiA2EzbpSllUvypfbwMxVSLxzp0LSP6p8WMoqVQpCn9EQE9vPZSsH69blSkRwmKJ8X5upcOIch/LAqUS2EHgNfru80uPaIPuoNkSItGf74pkyoqwmoBHFG39stWvZZHbcpiNsywSHgJBHYCmUeAZqo2edhhF2cA1u00kzEUpkR6MQFKuJp8UN8aj1yjlhTjcpNR1cBhMuvm6ggX9lCaMhIOX5PhPG96U58KPae8XTI/UttrZZnhw7gsio94/vdNW0vsZN1g0LMFrPHdEJIdsigJfqAPhd67z6lpTIYaoTEoBFJFsMbaarSBJ9vRxSbCltHXl0dVH+1wfZ5GecYNHWxjx/CNiwCxZvQS6UsIwa1eMiMLVSW/ouy7vWmhBRwiF7LW+bQx4EoSkEDoP5vNcjarooRONthlAE4hqVEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3N1TkcvVTQwS2NpSXFnK2xKVVhRSlZFUVNPR1VqbEpmVnpaZEw0dXRZM0Fa?=
 =?utf-8?B?WXZQL1BSNDdvOEd6YTFnT001VkdyT1RkWklUdVB3Y21zNDN2bXhyTVp4WnlQ?=
 =?utf-8?B?cTRoRWlEYWc0L3R4TnJtaGVWSFRQYUgxTFRwNG9Bak8yRGlCaktEU25LaWJU?=
 =?utf-8?B?WkJ5bCtNNkxjWnM4VkFBL2FzNGJ5cXFlSUFOaExNZXBXcTQweGk1Y1RkYXp6?=
 =?utf-8?B?cE1raUcweGlUWmlINzJZcTBXY0JiT2ljbWgwNHVFQTFFMTFZbXpBNHkra1Vw?=
 =?utf-8?B?NXBxUXMrSTZFY05wSVR4c0FzMVpLdVNxeWJlc3h0Z2ZjNVgzeHozQlM4ckYw?=
 =?utf-8?B?MWhnM2IzZ1JHT1pZY0R2NUs4RDVXOTAyMXFlc0hVZGVXRkFxald1TGhidk9K?=
 =?utf-8?B?bUh0SCtHUHprWXBiV3lLREtyT0g3b1FCVElRaCtJYS9PSTQ3cDVySVJRKzdH?=
 =?utf-8?B?Q0FvTDQ1S0VaWjBzNmxFaXVQbGgrNHdJenZBZytoYUI5UU51ZGpKUTAwcENY?=
 =?utf-8?B?Vk9xcnNNTXkzeS9JQXBuQW5YdTd2M2dvSjBua3VzT1V5TWkrakxOZmFaNjdW?=
 =?utf-8?B?TVRDa2FJdE5JeTV6VDdCMTNlUUh4SW1yUU4yTU5mSEIzVkh0a0pCNThyc0xU?=
 =?utf-8?B?ZkowQ3dxR0RXTXN4eXlmdjJNZTFISDJzZHZzd2FqM1hhTTM0dmR6TmJTMFdV?=
 =?utf-8?B?N2JHelEwUDhhUTgrei9DN3h0K3lHS2oybUo1dE96N2Y0dUtWdzRucXR6TnR1?=
 =?utf-8?B?NGpKd3RQSE1pRTRRV3RlTDN0TEMvNjZOdmZrcXhLWWQ4eStXQ0VvOHdWTzlO?=
 =?utf-8?B?aUl6bVVKSTM4NjB2YmlyRCtSY1dZc21kZjJkRER6RGtpRUlDQXI3MTA2QS8y?=
 =?utf-8?B?WDlveGlja2VZbHQxcWZsK2tWQWhRQzNodUxXdUlQNUxST0MrQWphQXFIelQy?=
 =?utf-8?B?Vy96QjB6ZXpTSExydVY5TmJZWTNRUmxtSlpyNW56c0krMko5MGRBQURqL203?=
 =?utf-8?B?Sk84OFRxTjRoY09NUzFwb2VKekh5V2E3ZUlMSnV2b3NJYTU4WlVaQ0hGZldB?=
 =?utf-8?B?QUpzUzloNnhWSEVjcDJQQllsS1hhUmZkUzJyRmJkbkIzTnA5VkJFTWNWcG9N?=
 =?utf-8?B?SDdvZXdqWUxzV3drY2ZlMDdFWTB1LzJ4ZllYemdoellVZDVFcWV0V2VMckxl?=
 =?utf-8?B?cStBOXZFeDltVUNQdGw0QnRIK2dQdW0xQVNpOEpaZTliT1NHMGZHM0Y3Y09P?=
 =?utf-8?B?cTNjeU5CemZJN2RRUm5vQldyaE9sekNqcThUOEpYa0Rxc2Z5eFhhU29zclI1?=
 =?utf-8?B?S0c5V0kvVktqWHNwWXNqdkV6ZnQzZFp4QlVBY0Z4OTR3MmRIbE4zK29PWWt5?=
 =?utf-8?B?UW1JelA0NTZKVG5xR0FCdWFsdDJqSkx0VmlFYlJEQU5iSForbnJhbE1SYUhD?=
 =?utf-8?B?Tmw0VTNnV0U1czh4bDk0aGhmeE1EQjN3bGRjc2dVdjB6Mnc0QTNhT1NiVmk3?=
 =?utf-8?B?QU1VNTBIL2FNNUhpOEVka2F2Y0lZNlV0WHJ0K3dmTHI4am1YOWRzTzY2b21D?=
 =?utf-8?B?ZERPUnVhMlJuc0x3cU1KWTYvUzRaSGZvcE9vK1pUM1UxckFBczNCeWtvZEhR?=
 =?utf-8?B?SDVheWpIcDFXRGo5K3I1b1U5dXZxWDdSZE9mRlVLVnFpbHY4Wi9iZlVPb25I?=
 =?utf-8?B?S3Q1dEZyUVlqb1Q0UDNrbm5Mc0hOT0FWc2JRVHpLTEVBdEdnQ2t3U3pDWTBW?=
 =?utf-8?B?QllXMU8vRFJLZHhNZzdFbXF1b1VST1V3NHFnYUR6clhNS2tualhyU1g5aTVD?=
 =?utf-8?B?eFZSV2ZkYjg2N2plRXpxL2x6V2Ztd0wvRFZZTVErWE91M2xGd1diT2JzRS9B?=
 =?utf-8?B?bGs1Q1hjWmNnTUdxVmlId29HMStKL3dxU0cwZldSRXB6dm05MklPNTVqSGVW?=
 =?utf-8?B?VmZlOHM2MjNMTlpwc0Jld3pZMGtaNlBpdlhNWUE3bEJ0QUVhbi9BZ3d2MU1o?=
 =?utf-8?B?bjJZNWYwRS9aS1hYNmovdU1tdmdrNXA4SzlvdWsvM0xENDlxYWVobzBvejNo?=
 =?utf-8?B?emZBOTlNcjV4VVhjRFd2ZjhuR09VQXJtQXF0N2diK2lReDJxcHBrU1BXaTVN?=
 =?utf-8?B?WnEzQkZYNklWd0E5R0lIM3lObGRmU293UjVpd2pJNEp4aCtSZjBoY3BlYi9z?=
 =?utf-8?Q?d+Rp2s/t4RUIxMfiS3liemE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fac90c-7dc9-428a-0416-08d9e011f85d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:03.7747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rkwKs/qSVsjOWL/yeBsbIjvfjhxWjS8rYBfRvhV7J0y4Eem0roXza1dRYWeEQNdR9COxnMelGPdHkVxGM30mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Introduce an interface that returns a specific MSR entry from a cpu
policy in xen_msr_entry_t format.

This is useful to callers can peek data from the opaque
xc_cpu_policy_t type.

No caller of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Use x86_msr_get_entry.

Changes since v1:
 - Introduce a helper to perform a binary search of the MSR entries
   array.
---
 tools/include/xenguest.h        |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 0a6fd99306..2672fd043c 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -810,6 +810,8 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
                             uint32_t leaf, uint32_t subleaf,
                             xen_cpuid_leaf_t *out);
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out);
 
 /* Compatibility calculations. */
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index ad6b349680..af5b8e47f4 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -881,6 +881,26 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *policy,
     return 0;
 }
 
+int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t *policy,
+                          uint32_t msr, xen_msr_entry_t *out)
+{
+    const uint64_t *val;
+
+    *out = (xen_msr_entry_t){};
+
+    val = x86_msr_get_entry(&policy->msr, msr);
+    if ( !val )
+    {
+        errno = ENOENT;
+        return -1;
+    }
+
+    out->idx = msr;
+    out->val = *val;
+
+    return 0;
+}
+
 bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
-- 
2.34.1


