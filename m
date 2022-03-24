Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB74E64C2
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 15:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294391.500610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXOBu-00039U-Pf; Thu, 24 Mar 2022 14:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294391.500610; Thu, 24 Mar 2022 14:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXOBu-00037G-Mh; Thu, 24 Mar 2022 14:11:54 +0000
Received: by outflank-mailman (input) for mailman id 294391;
 Thu, 24 Mar 2022 14:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXOBt-00037A-Eb
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 14:11:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583f7096-ab7c-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 15:11:50 +0100 (CET)
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
X-Inumbo-ID: 583f7096-ab7c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648131110;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hum6UWGr/2bCXVY/Rf0EtTra81zHhb2t6/vnNVDl6wk=;
  b=MX6CBbmKlNoKgMab33/Kaycuo7u8z9zXRBmljDtSHEd2c6R2Z8PIXbta
   h/DhMcqdIPGHpHlC2xy34mftMhZ5PFtTCGUswwQ3zn18nQ9QALemRvr0t
   DJZFrbh99tTNuMRjUwz3ohVl2u9h8M7q/uHBxEX+2AKy6UNzk0DQMF7Nl
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66521678
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uu2q8KMTKER0JZ3vrR2vl8FynXyQoLVcMsEvi/4bfWQNrUom0TACy
 TYZX2/XMvyINGWhfI8kaY/noxxTupTVmtdkTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2NIw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 PZziY6vTRoTPoLKusEefjZFTi9VBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlt3JkQQqa2i
 8wxZiNxRRfGaB5zHmwMV7cPg/6tlmTOfGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EruPCmCLTWYQMFaa5/PpnnF2SwGMIDBQcE1C8pJGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQnF26ggwDX8dqE8I8yiSO54XJvgiyPz1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpkiXJuuPBpJZmTEc9dvY5
 zmR5BYziLwI5SLg//XqpAuX695AS3Wgc+LU2uk1dj/9hu+aTNT8D2BN1bQ9xawfRGp+ZgPd1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpy77I9gAu28meRcB3iM4ldnBO
 h+7VeR5vsI7AZdXRfUvP9LZ5zoCk8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3a5TbkUkOAbeiCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FngMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:WehKmKEl8+734JrOpLqFBpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ak854Ed3AVV0gK1XYBNu/0KDwQeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VJN1xN/dfWVa9CC4lDgqpUCHa/ec8Sjbwl6I=
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="66521678"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfUa+G0FPBTcmPxcFgZUfbo/XJvn5nO5AgODXUja4ug/6228nyRAnaqbzLga5JclYc4NCcoGUS4A6fma4LSXkb4MONxA+W/b8POi7tS+Mq9TmQayojado01RglctSSWVfGwsd+jTeMYIFnb8Ya7uoDrn+NplTF14AV1UGZhHj3dAgTcw546Uwwp+1JWpX412boUQd8/zrTEWEGP+dXRhSeZZLF1tkvxdE2AJrOfpjw30IyrxkAm7UyzScD+ieRgU0FkDv/w3xKPLFunkXu9kjSmjLWQaQH2tuJVwhD/OGi4qXyo9Zcv8MD48zhXBv0eMmxe5epMjMDe7GO+smDkQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ3TbiWijUITJ4G2k4Wite5laUI4aZ4/ZPZxreiWpuU=;
 b=j18CMYtg0/oqOhz47gGuUNA7xkNX5m8yDxLkX3nSJAlE16DoRY6qdm/WQO7EMZtm/d307Oex7q0R94BaSPuKaioJ/i+0jXMjDGSx3/CGup5c8p93J7e+PuEq295uIArtOcbjOIdj+6urSzz3CUDQL57tZIejTQKDk+k6HcXIO64rpu+dEeGqaXxRNpPZ7nMaEEgCD33Njflb8E/EN518BbUL2S3PwVPk9oL9XEjgkJuW2mI7uUjfbluycwrKWryYyzfrGKswJYen3E7wPK0WgQCr5sz25pQwkrxsyLix+cQbCbdwB8E5K/+lQlsdfVJX7TvftMZdrsfSNcRF+pZQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ3TbiWijUITJ4G2k4Wite5laUI4aZ4/ZPZxreiWpuU=;
 b=hEzUAEANNKg6XoirVwTebPcghA5IwWTEMhz9VG2QebPnJ1owXtSz2bEuL3W1PSSBEGVvib31sLxr6MMUu6f1h7yxGJ7UIbr8Io1MCWAh52/zklCXS4lhGcqDoA6SRWOEcGZ2gXRiSNkcjhmWOCAmvxqfWQ0CBIfdVbNfvrQMtXU=
Date: Thu, 24 Mar 2022 15:11:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Support status of OpenBSD frontend drivers
Message-ID: <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
References: <Yjx4kNv7hG4FGGot@itl-email>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yjx4kNv7hG4FGGot@itl-email>
X-ClientProxiedBy: LO2P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a4bf29d-8da1-45a0-9c90-08da0da039cf
X-MS-TrafficTypeDiagnostic: BN6PR03MB3140:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB314057A6C0FF6BC07D7F291F8F199@BN6PR03MB3140.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hl22fFRzC/tn6cDc5lKWqXhSerk12LrvUjubEi8N4fbphPlfm64DNCa2veh2LSTmo9glbhHP0jAbtRg0s8W7hsMAKOwnq5fssYY28suV5jIWW0c/kx2akxbj/09P0Oj4ZtsCaoF23Zr/B5k80G73h89/4xsHyFEK3xD/LTiP2pP1SRH1lM4HEwM2WyA2Fq1Kaxw5qfTa5Tj3SIfeve78w4aPHWJgkmdXRwYg0PIFSxEMoVcVrMq2YtKjgpdS6Mxhua5zlN9dx/Pvr1ivSbPtGmqys94MSe4Sd9LY2gM9DgBg5w7eMCfTIfmx2ZWAYum2omUknFDrXDWUOC5C8qmV37Fj7yjAgF0f+C+PtKKfaZ+sow19UdVIZcSmR69DxGZ9dkqB52YFZnDVcvQ2AkgUN6cfg63SN2nnqwO/Cf3t7L3JKMFCw3VWCR+6r+1KIYu2UCPXfdYXnDJY7ou45CrywVyPCC92k65sDO6b/ONh3xsdzWoh9R/7y4vSfmjA1z1oDx2lPzyiCV6IdxXbXjXtdqkowuLQDWQNJa7oc/EaaoEhM7XZJhq/AxXn9bnGUXVv2ZUpHfsFDf1MfT+QzxZjKqDIqHR+2jufKQszVHDjNAw79m7OPRQb+4Ekn/9mTinRXi4qdL5O5N8KRFveKT5rQcZG7broUuHrVjk0oeigCKoMELGk/M9okC/LxAmyLxzW7siYy4VVwrk4G5XqOOUFoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(8936002)(82960400001)(8676002)(4326008)(508600001)(33716001)(66476007)(66556008)(6666004)(86362001)(9686003)(6512007)(6916009)(66946007)(2906002)(6506007)(83380400001)(5660300002)(26005)(38100700002)(186003)(316002)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1RNT3pIbjZYTmZGaVFINWUyUHI3aUdQSVF2b2RwRGVEUXhUdDg5SW1OaCs5?=
 =?utf-8?B?Qm55YTNzTFN2NUU0K2ZmR1JQMnd0aFFQSnE5UTE4OXVudXEzYjVXK2pVWDl0?=
 =?utf-8?B?d0ZLMWxwUDRNR1NUQk13aHdyOFBvZFBOZ053VUlKYTFWTHBkM2hEL1FaZ1Yv?=
 =?utf-8?B?cXczTit3RGpIdC8yRGJlQnN4Wm1Id3dLK085VG5la3NDN2M5b09FdHQ1OTA4?=
 =?utf-8?B?YmhyczZobEFaNFd3dzZheTRGRnlCRjhJZXBiNEJSYStPVm03UmlXU1BQN3Ru?=
 =?utf-8?B?cm1lckd0SXowWXZYOTM4S1pYc1JLN1JpR044V3hCK3hsRHlucnNlMlI0SDZF?=
 =?utf-8?B?NU1Pd001dVNYSTZTN0d5Y0prRWI3V09XcGRjYmd4NGNMUDY4U3lJcU1DanU0?=
 =?utf-8?B?UVJDNElsTm9PdUpJei9Oc09Ec21FRkNKbnJIcXhWQ0hwbXBLVTRRSHpWUFpP?=
 =?utf-8?B?US8yalBkWWJPS1JqNzRjTGpZRXovVlhWQzBHdkZWcldFOXJMSGkrY2R5R0N3?=
 =?utf-8?B?dU1JNU1IcEI2QXBYcUtCLzBrUVp3Umo4SGNoT3krVnJyc2x4c2lEc09FQ25x?=
 =?utf-8?B?dGZGYVFLYVpIR3BGZjZuUkNvR09vSEdaRGxYMTlTMjM0RWFhZHUySTdLeXRP?=
 =?utf-8?B?ZzZxM1B6b3VyRFhnbGZsMlQ1SStsOG96L2hYM3VtWVROekw3QnQzbjc5TzZs?=
 =?utf-8?B?enZ3UVh3THQvUzVyTE9Ea0o3ZEJ2QnhZZmlkbUwyRnNRTVllVVh0WXlJSnly?=
 =?utf-8?B?Qlg1M1lsMlNUenppV0dySEdLdGwvSk5sT2ozOW1jTG9WbGg0UjYwSmZySjV6?=
 =?utf-8?B?eUxwV3hBbXNPeW4ybXdYRFc3dEpmU2tWakNQekJsUjMxb2JOMmE0TFdmNkpD?=
 =?utf-8?B?ajNXbUVHVGJrN3JNS1lCYjVjR2drTmFxNlpaa01sRG02a2t5RDhhZG9rUDBO?=
 =?utf-8?B?aEdHSXB3RXFVVXRUZ2dqVmI5UkwrdUlJTyt3akVsSmJOQVQxbGhMdmRBTXdN?=
 =?utf-8?B?bXY4dkgzMTVodnZTZnZEazVJc0s5cFNSZitySjNWWDZWNkNvZEpYY3BZa0Yv?=
 =?utf-8?B?d0IvMWt2S1RGcmJSdlhDZUxiUVBlK25jVDZxUGlMUG9iTFZINnhPcU5rT0dK?=
 =?utf-8?B?Q1R5TmtSRTUwL0J3Wnk2aXF0Mk5jNnRvVDJ6MW9JWmt2YXdQWkRWZ0syL0pT?=
 =?utf-8?B?VGNkVjMzNzBUbkxuS1A5d3J1V21pRzY5cUxkajEwNnNYZUZPbUhhd1hNMmdh?=
 =?utf-8?B?QWQvY0tOMVlZTXpsT1RFbDNYdmtHUUd2R3piUW8zd3VXWFYreXUxZW9MWStB?=
 =?utf-8?B?L3dJZzR2Y3NBOFVEZUc4eVlDYlBEdThidE1aUEdFMmoxTlVTaUFEWWtGOHRB?=
 =?utf-8?B?OXJ5Vm03ZkhtTjNvK1pjSDQ5TmhLMDhsNVh0c0VETDBWdi93SCtHYzBQNDA1?=
 =?utf-8?B?ME1rclljY3pVUDV1amtSdDZaT0hmNHpWU2xySzJSeGNMNHJodnJJZS9tMG0z?=
 =?utf-8?B?OCtwRW12eVZoQ3FiVFRyM3NRM1pEQVFwL1VuUnpkWk9STnpZbWpYOFkwa1lN?=
 =?utf-8?B?YkJobWFXOUMvd3V3ekY5WjArTHlrREd3Y0ZIZFZEQ0pYUi9KWmRRR01DT3J0?=
 =?utf-8?B?TFpXYnNIQ0VBeGh4YWJBMTNYWldSSjB2ZHB5d0QvTXdaT0dJajlFcVQvQmZ1?=
 =?utf-8?B?TE5iR1VCTFRIcWREMDRrYXlneWJHcG1PdHhiSTRMeGRYL29la2VacDM5SGl2?=
 =?utf-8?B?YldKM0UrTVNEV3NocE5KY2JPcGJOMlM5QmVjZ3lVbUZNMzI3bjZLRVNHTUFk?=
 =?utf-8?B?Z05GUGF5Q3NHWEwyQW50c3QrbjlVSnBEMEJ5SVNDTnl5cjZFT0lyZms2Yktw?=
 =?utf-8?B?VCt1SFR0YWpDZFc5bVlYRGhOVnB5YU1qZFd2MWZVVUhWbm82UUhhM1VlQ05I?=
 =?utf-8?B?VjZwSDdIMWVJNWp1c3B5YUlmRk1BM3JTTE9SeTlveUVSckhlMWY2MCtEaUp4?=
 =?utf-8?B?bkxvMk9tckw5NHpVZWxmOThjZ0ZCald1dWxsRk5NNnE0dXJaWkpKS21Jamsx?=
 =?utf-8?B?NmFlOTdMY3A5UnJrMGJCSDFBTDlhUDltMmVtaWd3L3BsYkt2amx4YUhrS0ZS?=
 =?utf-8?B?VHYzcExYVzlGb2FsMHd1TnQxQzR4ME9pUVZOV3Vnb0l0cmlKTlA2SS9Ueksz?=
 =?utf-8?B?OTNHK2xrWDBpd2REazIzbWVtOWJmWTJYMXFWSVhqUDk2eVdOOFVxVkZseEp2?=
 =?utf-8?B?NmtTdHhrazF5L3NkZWxyaGxXOEtSVTViQTd3TU9mWmZaN294TFpQQ2ZmZ0ow?=
 =?utf-8?B?aU1sb2tzblRlVkx5UU5Td0VKNWc0amxxMmh3TGpNWWdyQy9IUnFXc0tIcWRI?=
 =?utf-8?Q?qnQ/4y+Xr5hdUWDo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4bf29d-8da1-45a0-9c90-08da0da039cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 14:11:44.3432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lqnHu3CH4x+Uu08p4KxIqPJzR0mXBAF8Tw4bauBB7MGn+EUa/c0OAP5ZmkxpIiXp+0LzbSzpjJlywjK/heTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3140
X-OriginatorOrg: citrix.com

On Thu, Mar 24, 2022 at 09:56:29AM -0400, Demi Marie Obenour wrote:
> As per private discussion with Theo de Raadt, OpenBSD does not consider
> bugs in its xnf(4) that allow a backend to cause mischief to be security
> issues.  I believe the same applies to its xbf(4).  Should the support
> document be updated?

I think that's already reflected in the support document:

'Status, OpenBSD: Supported, Security support external'

Since the security support is external it's my understanding OpenBSD
security team gets to decide what's a security issue and what is not.

That however creates differences in the level of support offered by
the different OSes, but I think that's unavoidable. It's also hard to
track the status here because those are external components in
separate code bases.

Could be added as a mention together with the Windows note about
frontends trusting backends, but then I would fear this is likely to
get out of sync if OpenBSD ever changes their frontends to support
untrusted backends (even if not considered as a security issue).

Thanks, Roger.

